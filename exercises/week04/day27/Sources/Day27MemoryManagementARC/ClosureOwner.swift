import Foundation

final class ClosureOwner {
    let name: String
    var onComplete: (() -> Void)?

    init(name: String) {
        self.name = name
        print("[ClosureOwner] init \(name)")
    }

    deinit {
        print("[ClosureOwner] deinit \(name)")
    }

    func setupStrongCapture() {
        // closure 被 onComplete 强持有，而 closure 又强捕获 self，会形成循环引用。
        onComplete = {
            print("[ClosureOwner] strong capture owner = \(self.name)")
        }
    }

    func setupWeakCapture() {
        // 使用 [weak self] 让 closure 不拥有 self，从而避免 self 和 closure 互相强持有。
        onComplete = { [weak self] in
            guard let self = self else {
                print("[ClosureOwner] self is nil")
                return
            }

            print("[ClosureOwner] weak capture owner = \(self.name)")
        }
    }

    func runCompletion() {
        onComplete?()
    }
}

/*
这里的关键是：

onComplete = {
    print(self.name)
}

会让 closure 强持有 self。

而：

onComplete = { [weak self] in
    ...
}

不会让 closure 强持有 self。
*/