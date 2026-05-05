# Day30 学习日志

## 今日主题

Objective-C 基础 1

## 今日目标

- 理解 `.h` / `.m`
- 理解 `@interface` / `@implementation`
- 理解 `@property`
- 理解方法声明和调用
- 理解 Objective-C 消息发送语法
- 理解 nil 消息安全
- 对比 Objective-C / Swift / C++ 的基础表达差异

## 今日任务

- [x] 阅读 Objective-C 基础语法
- [x] 写 `Person` 类小例子
- [x] 对比 Swift class 写法
- [x] 对比 C++ class 写法
- [x] 整理 `notes/week05/objective-c-basics-day30.md`
- [x] 补充 `notes/week05/objective-c-swift-cpp-comparison.md`

## 今日练习文件

- `exercises/week05/day30/Person.h`
- `exercises/week05/day30/Person.m`
- `exercises/week05/day30/main.m`
- `exercises/week05/day30/README.md`

## 今日理解

- Objective-C 通常使用 `.h` 声明，`.m` 实现。
- `@interface` 是类声明。
- `@implementation` 是类实现。
- `@property` 用来声明属性。
- `-` 开头表示实例方法。
- `+` 开头表示类方法。
- `[person sayHello]` 是消息发送语法。
- `[[Person alloc] init...]` 是 Objective-C 创建对象的经典写法。
- `profileText` 是一个无参数、有返回值的实例方法。
- `nil` 消息通常不会崩溃。
- 给 `nil` 发消息通常安全，但如果后面继续使用返回值，仍然要注意结果是否符合预期。
- Objective-C 的语法虽然看起来怪，但可以用 Swift / C++ 对照理解。

## 今日遇到的问题

- 当前 WSL + Ubuntu 环境下可能找不到 `Foundation/Foundation.h`，这属于环境问题，不是当前 OC 示例语法错误。
- `nonatomic` 的底层含义还不完全理解。
- `copy / strong / weak / assign` 的完整区别还需要后续学习。
- `instancetype` 和 `id` 的区别后续还需要继续补。
- `@autoreleasepool` 目前只知道是自动释放池，还没深入理解。

## 今日完成结果

- 能看懂一个最基础的 Objective-C 类声明。
- 能区分 `.h` 的对外声明和 `.m` 的具体实现。
- 能把 `[person sayHello]` 读成“给 person 发送 sayHello 消息”。
- 能读懂 `initWithName:age:`、`updateName:`、`profileText` 这几种不同形态的方法。
- 知道 `nil` 消息通常安全，但不能因此忽略所有空值问题。

## 明天计划

进入 Day31：Objective-C 基础 2 + Swift/OC 对照。重点先看懂基础写法，不急着深入底层细节。
