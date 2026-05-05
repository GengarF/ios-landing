# Day30 - Objective-C 基础 1

## 1. Day30 的定位

Day30 是 Week5 的开始，目标不是把 Objective-C 学深，而是先建立读懂老 iOS 代码的基础语感。

- 很多 iOS 老项目仍然有 Objective-C 代码
- 很多基础组件、SDK、工具代码可能是 OC
- Runtime、RunLoop、消息发送等底层概念和 OC 关系很深
- 看懂 OC 能帮助我更快适应大厂已有项目
- Swift 和 Objective-C 混编在 iOS 工程中很常见

今天重点关注：

- 文件怎么拆
- 类怎么声明和实现
- 属性怎么写
- 方法怎么声明和调用
- Objective-C 的消息发送长什么样
- `nil` 消息为什么相对安全
- 它和 Swift / C++ 的直觉差异在哪里

## 2. `.h` 和 `.m` 是什么

`.h` 通常放声明，告诉外部这个类有什么属性和方法：

- 类的名字
- 继承关系
- 对外暴露的属性
- 对外暴露的方法

`.m` 通常放实现，写具体方法逻辑：

- 方法具体逻辑
- 私有辅助方法
- 内部细节

可以先粗略理解为：

```text
.h = 告诉别人我能做什么
.m = 我具体怎么做
```

今天的练习文件对应关系：

```text
Person.h = 声明 Person 类有什么属性和方法
Person.m = 实现 Person 类的方法逻辑
main.m = 创建 Person 对象，并给对象发送消息
```

## 3. `@interface` 和 `@implementation`

`@interface` 用来声明类。

```objc
@interface Person : NSObject

@end
```

这表示声明一个 `Person` 类，并且它继承自 `NSObject`。

`@implementation` 用来实现类。

```objc
@implementation Person

@end
```

这表示开始实现 `Person` 类的方法。

## 4. `@property` 基础

Objective-C 常用 `@property` 声明属性。

```objc
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
```

先记住基础直觉：

- `@property` 用来声明属性
- `NSString *name` 表示字符串对象指针
- `NSInteger age` 表示整数
- `copy` 常用于 `NSString`
- `strong` 常用于对象持有
- `assign` 常用于基础数值类型
- `weak` 和对象引用关系有关，后面再结合具体场景学习
- `nonatomic` 是 iOS 里常见写法，表示不自动加线程同步成本

## 5. 方法声明和调用

Objective-C 方法声明示例：

```objc
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age;
- (void)sayHello;
- (void)updateName:(NSString *)name;
- (NSString *)profileText;
```

其中：

- `-` 表示实例方法
- `+` 表示类方法
- 括号里是返回值类型
- 参数名会嵌在方法名中

今天的几个方法可以先这样读：

- `initWithName:age:`：初始化一个 `Person` 对象
- `sayHello`：没有参数、没有返回值的方法
- `updateName:`：有一个参数、没有返回值的方法
- `profileText`：没有参数、返回 `NSString *` 的方法

## 6. 消息发送语法

Objective-C 调用方法不是点语法为主，而是消息发送：

```objc
[person sayHello];
[person updateName:@"Jiale"];
```

可以先理解为：

```text
[接收者 消息]
```

创建对象这句也可以按消息发送来拆：

```objc
Person *person = [[Person alloc] initWithName:@"Jiale" age:18];
```

可以先读成：

```text
先给 Person 类发送 alloc 消息，分配对象
再给这个对象发送 initWithName:age: 消息，完成初始化
```

## 7. nil 消息安全

Objective-C 中给 `nil` 发送消息通常不会崩溃：

```objc
Person *person = nil;
[person sayHello];
```

这和 Swift 的 Optional 强制解包、C++ 的空指针调用直觉很不一样。

但这不代表所有空值问题都不用管。如果给 `nil` 发消息后还要继续使用返回值，仍然要确认结果是否符合预期。

## 8. Objective-C / Swift / C++ 对比

Day30 先关注基础层面对比：

- 文件组织
- 类型声明
- 对象创建
- 方法调用
- 属性表达
- 空值表达

详细内容放在：

```text
notes/week05/objective-c-swift-cpp-comparison.md
```

## 9. 今日小结

- 我能看懂一个最基础的 Objective-C 类声明。
- `.h` 主要看这个类对外暴露了什么。
- `.m` 主要看方法具体怎么实现。
- `@interface` 是类声明，`@implementation` 是类实现。
- Objective-C 方法调用要读成“给对象发送消息”。
- 给 `nil` 发消息通常不会崩，但不能因此忽略所有空值问题。
