# Swift Basics Day 27

## 今日主题

ARC / 内存管理 / 引用循环。

今天用纯 Swift 命令行项目观察 class 对象的释放时机，并理解：

```text
strong 引用会保留对象
weak 引用不会保留对象
两个对象互相 strong 引用可能导致引用循环
closure 捕获 self 也可能导致引用循环
```

---

## 1. ARC 是什么

ARC 全称是 Automatic Reference Counting，也就是自动引用计数。

Swift 会自动记录一个 class 对象有多少个 strong 引用。

当 strong 引用数量变成 0 时，对象就会被释放。

我不需要像 C++ 那样手动 delete 对象，ARC 会自动管理对象生命周期。

---

## 2. deinit

`deinit` 会在 class 对象被释放时调用。

它类似 C++ 的析构函数。

```swift
deinit {
    print("deinit")
}
```

在学习内存管理时，可以通过 `deinit` 观察对象有没有被释放。

如果预期对象释放，但没有看到 `deinit`，可能说明还有引用持有它，或者出现了循环引用。

---

## 3. strong 引用

Swift 中普通 class 引用默认是 strong。

```swift
var person: Person?
```

只要有 strong 引用指向对象，对象就不会释放。

如果两个变量都指向同一个对象，那么其中一个变量设为 nil，对象不会立刻释放；只有所有 strong 引用都消失，对象才会释放。

---

## 4. 引用循环

引用循环是指两个或多个对象互相 strong 持有。

例如：

```text
Person strong -> Apartment
Apartment strong -> Person
```

即使外部变量都设成 nil，这两个对象内部还互相强引用，所以 ARC 无法释放它们。

表现是：

```text
没有看到 deinit
```

这就是内存泄漏的一种常见来源。

---

## 5. weak 引用

`weak` 是弱引用，不会增加对象的引用计数。

```swift
weak var tenant: Person?
```

weak 通常用于打破引用循环。

例如：

```text
Person strong -> Apartment
Apartment weak -> Person
```

这样 Person 和 Apartment 不会互相强持有。

weak 的特点：

- 只能用于 class 类型
- 通常是 Optional
- 被引用对象释放后，weak 会自动变成 nil
- 不会增加引用计数

---

## 6. unowned

`unowned` 也不会增加引用计数，但它和 `weak` 不同。

区别：

- `weak` 是 Optional
- `unowned` 通常不是 Optional
- `weak` 指向的对象释放后会自动变成 nil
- `unowned` 假设对象一定还活着
- 如果对象已经释放，还访问 unowned，可能崩溃

初学阶段，如果不确定生命周期，优先使用 weak。

---

## 7. closure 捕获 self

如果一个对象持有一个 closure 属性：

```swift
var onComplete: (() -> Void)?
```

closure 中又使用了 self：

```swift
onComplete = {
    print(self.name)
}
```

会形成：

```text
object strong -> closure
closure strong -> self
```

这也是引用循环。

解决方式是使用：

```swift
onComplete = { [weak self] in
    guard let self = self else { return }
    print(self.name)
}
```

`[weak self]` 表示 closure 不要强持有 self。

---

## 8. Day27 Demo 总结

### Demo1：Basic ARC release

创建一个对象，然后把变量设为 nil。

看到 `deinit`，说明对象被释放。

### Demo2：Strong reference keeps object alive

两个变量指向同一个对象。

第一个变量设为 nil 时，对象还不会释放。

第二个变量也设为 nil 后，才看到 `deinit`。

### Demo3：Strong reference cycle

Person 和 Apartment 互相 strong 引用。

外部变量都设为 nil 后，仍然没有看到 `deinit`。

说明出现了 strong reference cycle。

### Demo4：Weak reference breaks cycle

Apartment 的 tenant 使用 weak。

Person 和 Apartment 不会互相强持有。

外部变量设为 nil 后，可以看到 `deinit`。

### Demo5：Closure strong capture cycle

对象持有 closure，closure 又强捕获 self。

外部变量设为 nil 后，没有看到 `deinit`。

说明 closure 捕获 self 造成了循环引用。

### Demo6：Closure weak capture

closure 使用 `[weak self]` 捕获 self。

外部变量设为 nil 后，可以看到 `deinit`。

说明 `[weak self]` 打破了 closure 和对象之间的循环引用。

---

## 9. 真实 iOS 中的常见场景

### delegate

delegate 经常写成 weak：

```swift
weak var delegate: SomeDelegate?
```

因为 delegate 通常会反向指向拥有者，如果用 strong 容易形成循环引用。

### closure callback

网络请求、动画、异步回调中经常出现 closure。

如果 closure 内使用 self，需要注意是否要写：

```swift
[weak self]
```

### Timer

Timer 也可能强持有 target 或 closure，如果使用不当，也可能造成循环引用。

---

## 10. 今日核心理解

今天最重要的是：

```text
ARC 只会自动处理普通引用计数
但不会自动解决 strong reference cycle
```

所以需要主动识别：

- 对象之间是否互相 strong 引用
- closure 是否强捕获 self
- delegate 是否应该 weak
- Timer / callback 是否可能造成循环引用

---

## 11. 自测问题

1. ARC 什么时候释放一个对象？

   当一个对象不再被任何 strong 引用持有时，ARC 就会释放它。

   例如 Demo1 中，`person` 是 `BasicPerson` 的唯一 strong 引用。当执行：

   ```swift
   person = nil
   ```

   最后一个 strong 引用消失，所以对象会被释放，并执行 `deinit`。

2. `deinit` 用来观察什么？

   `deinit` 用来观察 class 实例什么时候被释放。

   在今天的练习里，只要看到类似：

   ```text
   [BasicPerson] deinit Gengar
   ```

   就说明这个对象已经被 ARC 回收了。如果预期应该释放却没有看到 `deinit`，通常说明还有 strong 引用存在，或者发生了循环引用。

3. 为什么普通 class 引用默认是 strong？

   因为大多数引用关系都表示“我需要这个对象继续存在”。

   strong 引用会让 ARC 保留对象，保证使用它的时候对象不会提前释放。例如：

   ```swift
   var person1: BasicPerson? = BasicPerson(name: "Fan")
   var person2 = person1
   ```

   `person1` 和 `person2` 都 strong 持有同一个对象，所以只把 `person1` 设为 `nil` 时，对象还不会释放。

4. Demo3 为什么没有看到 `deinit`？

   因为 Demo3 制造了 strong reference cycle。

   ```swift
   person?.apartment = apartment
   apartment?.tenant = person
   ```

   `StrongPerson` strong 持有 `StrongApartment`，同时 `StrongApartment` 又 strong 持有 `StrongPerson`。

   后面即使执行：

   ```swift
   person = nil
   apartment = nil
   ```

   也只是移除了外部引用。两个对象内部仍然互相 strong 持有，所以引用计数不会归零，ARC 无法释放它们，因此看不到 `deinit`。

5. weak 为什么能打破循环引用？

   因为 weak 引用不会增加对象的引用计数。

   Demo4 中：

   ```swift
   weak var tenant: Person?
   ```

   `Person` strong 持有 `Apartment`，但是 `Apartment` 只是 weak 引用 `Person`。这样就不会形成“你强持有我，我强持有你”的闭环。

   当 `person = nil` 后，`Person` 没有 strong 引用了，就可以被释放。

6. weak 为什么通常是 Optional？

   因为 weak 引用指向的对象可能随时被释放。

   当 weak 指向的对象释放后，Swift 会自动把这个 weak 引用设为 `nil`。所以 weak 属性通常需要写成 Optional：

   ```swift
   weak var tenant: Person?
   ```

   这表示：这个引用可能有值，也可能因为对象已经释放而变成 `nil`。

7. closure 为什么会捕获 self？

   因为 closure 内部使用了 `self` 的属性或方法时，closure 需要把 `self` 保存起来，等 closure 之后执行时还能访问它。

   Demo5 中：

   ```swift
   onComplete = {
       print("[ClosureOwner] strong capture owner = \(self.name)")
   }
   ```

   closure 使用了 `self.name`，所以会捕获 `self`。默认情况下，这种捕获是 strong。

8. `[weak self]` 解决了什么？

   `[weak self]` 解决 closure 和对象之间的循环强引用问题。

   Demo5 中，`ClosureOwner` strong 持有 `onComplete`，而 `onComplete` 这个 closure 又 strong 捕获 `self`，于是形成循环：

   ```text
   owner -> onComplete -> owner
   ```

   Demo6 改成：

   ```swift
   onComplete = { [weak self] in
       guard let self = self else {
           print("[ClosureOwner] self is nil")
           return
       }

       print("[ClosureOwner] weak capture owner = \(self.name)")
   }
   ```

   closure 不再 strong 持有 `self`，所以 `owner = nil` 后对象可以正常释放。

9. weak 和 unowned 的区别是什么？

   `weak` 不拥有对象，引用的对象释放后会自动变成 `nil`，所以通常是 Optional。

   `unowned` 也不拥有对象，但它不会自动变成 `nil`，通常不是 Optional。它适合用在“被引用的对象一定比当前引用活得更久”的场景。

   简单记：

   ```text
   weak：对象可能先释放，所以要处理 nil，更安全
   unowned：对象必须还活着，否则访问会崩溃
   ```

   初学阶段优先使用 `weak`，只有非常确定生命周期关系时再考虑 `unowned`。

10. delegate 为什么常常是 weak？

    因为 delegate 通常是一个反向引用。

    常见结构是：一个对象 strong 持有某个组件，组件又通过 delegate 回调这个对象。如果 delegate 也是 strong，就很容易变成循环引用。

    所以 delegate 常常写成：

    ```swift
    weak var delegate: SomeDelegate?
    ```

    这样组件可以通知 delegate，但不会拥有 delegate，也就不容易造成循环引用。
