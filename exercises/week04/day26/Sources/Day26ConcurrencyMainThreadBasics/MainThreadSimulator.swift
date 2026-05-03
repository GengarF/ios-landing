import Foundation

final class MainThreadSimulator: Sendable {
    func runOnMainThread(_ action: () -> Void) {
        print("[MainThreadSimulator] simulate UI update on main thread")
        action()
    }
}

/*
这个文件只是模拟。

真实 UIKit 里，会看到类似：

DispatchQueue.main.async {
    // update UI
}

或者：
@MainActor
*/