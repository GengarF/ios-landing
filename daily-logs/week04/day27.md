# Day 27

## 今日目标
- 理解 ARC 的基础机制
- 理解 strong / weak / unowned 的基本区别
- 理解 class 之间为什么会产生引用循环
- 理解 closure 捕获 self 为什么可能导致循环引用
- 用纯 Swift 模拟常见内存管理场景
- 跑通 day27 的练习项目

## 今日完成
- 定义了 `BasicPerson` 演示普通 ARC 释放
- 定义了 `StrongPerson` 和 `StrongApartment` 演示 strong reference cycle
- 定义了 `Person` 和 `Apartment` 演示 weak 打破引用循环
- 定义了 `ClosureOwner` 演示 closure 捕获 self 的情况
- 完成了 6 个内存管理 demo
- 通过 `deinit` 观察对象是否释放
- 跑通了 `swift run`

## 遇到的问题
- strong / weak / unowned 的区别还需要继续熟悉
- closure 捕获 self 的循环引用需要多看几次才能完全内化
- 当前只是用命令行和 `deinit` 模拟，还没有进入真实 UIKit 场景
- Instruments / Leaks 目前只是认知，还没有实操

## 今天印象最深的点
- ARC 会自动释放没有 strong 引用的对象
- 两个对象互相 strong 引用时，即使外部变量设为 nil，也可能不会释放
- weak 不增加引用计数，可以打破引用循环
- closure 也可能强捕获 self，造成循环引用
- `[weak self]` 是解决 closure 循环引用的常见方式

## AI 协同记录
- 今天让 Codex 做了什么：
  - 让 Codex 解释 Day27 项目中的 ARC、strong、weak 和 closure capture
  - 让 Codex review 每个 Demo 是否清楚体现内存管理概念

- Codex 给了哪些建议：
  - 检查哪些 Demo 应该看到 `deinit`
  - 检查哪些 Demo 故意看不到 `deinit`
  - 检查 weak 和 strong 的命名是否清楚
  - 提醒 closure 捕获 self 是 iOS 中常见的内存泄漏来源

- 我采纳了哪些：
  - 保留了通过 `deinit` 观察对象释放的方式
  - 保留了 strong cycle 和 weak break cycle 的对比
  - 保留了 closure strong capture 和 weak capture 的对比

- 我没有采纳哪些：
  - 暂时没有引入 UIKit / Timer / delegate 的真实代码
  - 暂时没有使用 Instruments 做 Leaks 检查
  - 暂时没有展开复杂的 unowned 示例

- 为什么：
  - 当前 Day27 的目标是建立 ARC 和引用循环直觉
  - 先用纯 Swift demo 看懂对象释放时机
  - UIKit、Timer、delegate、Instruments 后面再结合真实 iOS 场景学习

## 自测问题
- ARC 什么时候释放一个 class 对象？
- `deinit` 的作用是什么？
- 为什么 Demo2 里 `person1 = nil` 后对象还没释放？
- 为什么 Demo3 里没有看到 `deinit`？
- `weak` 为什么能打破引用循环？
- `weak` 为什么通常是 Optional？
- closure 为什么可能强持有 `self`？
- `[weak self]` 解决了什么问题？
- `weak` 和 `unowned` 的区别是什么？
- 真实 iOS 里 delegate 为什么经常写成 `weak`？

## 明天计划
- 进入 Day28 小项目 2 设计版
- 把页面、数据流、异步、内存管理等概念继续串起来
