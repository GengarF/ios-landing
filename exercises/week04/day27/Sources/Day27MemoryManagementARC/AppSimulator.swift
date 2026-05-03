import Foundation

final class AppSimulator {
    func start() {
        print("Day 27 Memory Management ARC")

        basicARCDemo()
        strongReferenceDemo()
        strongCycleDemo()
        weakReferenceDemo()
        closureStrongCaptureDemo()
        closureWeakCaptureDemo()
    }

    private func basicARCDemo() {
        print("\n[Demo1] Basic ARC release")


        // person 是唯一的 strong 引用，因此对象会一直存活到 person 被设为 nil。
        var person: BasicPerson? = BasicPerson(name: "Gengar")
        print("[Demo1] person is alive")

        //移除最后一个 strong 引用，ARC 会立即释放对象并调用 deinit。
        person = nil
        print("[Demo1] person set to nil")
    }

    private func strongReferenceDemo() {
        print("\n[Demo2] Strong reference keeps object alive")

        // person2 和 person1 指向同一个对象，会增加一次 strong 引用。
        var person1: BasicPerson? = BasicPerson(name: "Fan")
        var person2 = person1

        print("[Demo2] person1 and person2 point to same object")

        // 这里只移除 person1，对象仍被 person2 持有，所以不会释放。
        person1 = nil
        print("[Demo2] person1 set to nil, object should still be alive")

        person2 = nil
        print("[Demo2] person2 set to nil, object should be released")
    }

    private func strongCycleDemo() {
        print("\n[Demo3] Strong reference cycle")

        var person: StrongPerson? = StrongPerson(name: "Jeff")
        var apartment: StrongApartment? = StrongApartment(unit: "A-101")

        // 下面两行会制造循环强引用：person 持有 apartment，apartment 又持有 person。
        person?.apartment = apartment
        apartment?.tenant = person

        print("[Demo3] person and apartment strongly reference each other")

        // 即使外部引用消失，对象内部仍互相 strong 持有，因此 deinit 不会执行。
        person = nil
        apartment = nil

        print("[Demo3] external references set to nil")
        print("[Demo3] If no deinit appears above, there is a strong reference cycle")
    }

    private func weakReferenceDemo() {
        print("\n[Demo4] Weak reference breaks cycle")

        var person: Person? = Person(name: "Momo")
        var apartment: Apartment? = Apartment(unit: "B-202")

        person?.apartment = apartment
        apartment?.tenant = person

        print("[Demo4] apartment.tenant is weak")

        person = nil
        print("[Demo4] person set to nil")

        apartment = nil
        print("[Demo4] apartment set to nil")
    }

    private func closureStrongCaptureDemo() {
        print("\n[Demo5] Closure strong capture cycle")

        var owner: ClosureOwner? = ClosureOwner(name: "StrongClosureOwner")
        owner?.setupStrongCapture()
        owner?.runCompletion()

        owner = nil

        print("[Demo5] owner set to nil")
        print("[Demo5] If no deinit appears above, closure captured self strongly")
    }

    private func closureWeakCaptureDemo() {
        print("\n[Demo6] Closure weak capture")

        var owner: ClosureOwner? = ClosureOwner(name: "WeakClosureOwner")
        owner?.setupWeakCapture()
        owner?.runCompletion()

        owner = nil

        print("[Demo6] owner set to nil")
        print("[Demo6] deinit should appear because closure captured self weakly")
    }
}