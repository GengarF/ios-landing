import Foundation

final class StrongApartment {
    let unit: String
    var tenant: StrongPerson?

    init(unit: String) {
        self.unit = unit
        print("[StrongApartment] init \(unit)")
    }

    deinit {
        print("[StrongApartment] deinit \(unit)")
    }
}

final class Apartment {
    let unit: String
    weak var tenant: Person? // tenant 是反向引用，不拥有 Person，所以用 weak 避免循环引用。

    init(unit: String) {
        self.unit = unit
        print("[Apartment] init \(unit)")
    }

    deinit {
        print("[Apartment] deinit \(unit)")
    }
}

/*
这里重点看：

var tenant: StrongPerson?

这是 strong，会参与循环引用。

而：

weak var tenant: Person?

这是 weak，不会增加引用计数，可以打破循环引用。
*/