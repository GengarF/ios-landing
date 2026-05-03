import Foundation

final class BasicPerson {
    let name: String

    init(name: String) {
        self.name = name
        print("[BasicPerson] init \(name)")
    }

    deinit {
        print("[BasicPerson] deinit \(name)")
    }
}

final class StrongPerson {
    let name: String
    var apartment: StrongApartment?

    init(name: String) {
        self.name = name
        print("[StrongPerson] init \(name)")
    }

    deinit {
        print("[StrongPerson] deinit \(name)")
    }
}

final class Person {
    let name: String
    var apartment: Apartment?

    init(name: String) {
        self.name = name
        print("[Person] init \(name)")
    }

    deinit {
        print("[Person] deinit \(name)")
    }
}

/*
这里有三类：

BasicPerson：演示普通 ARC 释放
StrongPerson：演示 strong 引用循环
Person：配合 weak 版本的 Apartment
*/