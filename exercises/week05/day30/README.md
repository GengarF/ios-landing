# Day30 - Objective-C 基础 1

## 1. 今日主题

Objective-C 基础 1。

本日目标不是精通 Objective-C，而是先能看懂一个最基础的 OC 类。

重点内容：

- `.h` 和 `.m`
- `@interface`
- `@implementation`
- `@property`
- 方法声明
- 方法调用
- 消息发送语法
- `nil` 消息安全
- 和 Swift / C++ 的区别

---

## 2. 为什么入职 iOS 岗需要看 Objective-C

虽然现在新代码大量使用 Swift，但很多大厂 iOS 项目仍然会包含 Objective-C：

- 历史业务代码
- 基础组件
- SDK
- Runtime 相关代码
- Category
- Delegate
- Block 回调
- 老架构模块
- 第三方库源码

所以入职前不一定要能熟练写复杂 OC，但至少要能看懂：

```objc
@interface Person : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age;
- (void)sayHello;

@end
```

也就是能大致判断：

- 这个类叫什么
- 继承自谁
- 有哪些属性
- 有哪些方法
- 方法参数是什么
- 方法返回值是什么

---

## 3. 文件说明

本练习有 3 个文件：

- `Person.h`：声明 `Person` 类、属性和方法
- `Person.m`：实现 `Person` 类的方法
- `main.m`：创建对象并调用方法

Objective-C 通常会把一个类拆成两个文件：

```text
Person.h  -> 对外声明：这个类有什么
Person.m  -> 内部实现：这些方法具体怎么做
```

可以先把它类比成：

```text
.h 像菜单 / 接口说明
.m 像厨房 / 具体实现
```

---

## 4. 看懂 `.h`

`Person.h` 里的核心代码：

```objc
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age;
- (void)sayHello;
- (void)updateName:(NSString *)name;
- (NSString *)profileText;

@end

NS_ASSUME_NONNULL_END
```

### `@interface`

```objc
@interface Person : NSObject
```

含义：

```text
声明一个 Person 类
它继承自 NSObject
```

Swift 里类似：

```swift
class Person {
}
```

C++ 里类似：

```cpp
class Person {
};
```

但 Objective-C 的类通常继承自 `NSObject`，这是很多基础能力的来源。

### `@property`

```objc
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
```

含义：

```text
Person 有一个 name 属性，类型是 NSString *
Person 有一个 age 属性，类型是 NSInteger
```

这里先不用纠结 `nonatomic`、`copy`、`assign` 的完整内存管理细节，只先建立直觉：

- `NSString *name`：对象类型，写法里有 `*`
- `NSInteger age`：基础数值类型，写法里没有 `*`
- `copy`：字符串常见属性修饰
- `assign`：整数这类基础类型常见属性修饰

### 方法声明

```objc
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age;
- (void)sayHello;
- (void)updateName:(NSString *)name;
- (NSString *)profileText;
```

先看结构：

```objc
- (返回值类型)方法名:(参数类型)参数名 第二段参数名:(参数类型)参数名;
```

例如：

```objc
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age;
```

可以读成：

```text
这是一个对象方法
返回值是 instancetype
方法名整体是 initWithName:age:
第一个参数是 name，类型是 NSString *
第二个参数是 age，类型是 NSInteger
```

`-` 表示对象方法，需要通过对象调用。

后面会看到 `+`，它表示类方法，类似 Swift 里的 `static` / `class` 方法。

`profileText` 是一个有返回值、没有参数的方法：

```objc
- (NSString *)profileText;
```

可以先读成：

```text
返回一个 NSString * 类型的简介文本
```

---

## 5. 看懂 `.m`

`Person.m` 里的核心代码：

```objc
#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age {
    self = [super init];
    if (self) {
        _name = [name copy];
        _age = age;
    }
    return self;
}

- (void)sayHello {
    NSLog(@"Hello, my name is %@, age is %ld", self.name, (long)self.age);
}

- (void)updateName:(NSString *)name {
    self.name = name;
}

- (NSString *)profileText {
    return [NSString stringWithFormat:@"%@ - %ld", self.name, (long)self.age];
}

@end
```

### `@implementation`

```objc
@implementation Person
```

含义：

```text
开始实现 Person 类
```

`.h` 负责告诉别人“我有什么”，`.m` 负责写“我具体怎么做”。

### 初始化方法

```objc
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age {
    self = [super init];
    if (self) {
        _name = [name copy];
        _age = age;
    }
    return self;
}
```

先读懂这个流程：

```text
先调用父类 NSObject 的 init
如果初始化成功
把传入的 name 保存到 _name
把传入的 age 保存到 _age
最后返回当前对象 self
```

Swift 里接近：

```swift
init(name: String, age: Int) {
    self.name = name
    self.age = age
}
```

Objective-C 的初始化写法更啰嗦，但在老代码里很常见。

---

## 6. 消息发送语法

`main.m` 里有：

```objc
Person *person = [[Person alloc] initWithName:@"Jiale" age:18];

[person sayHello];
[person updateName:@"Codex"];
[person sayHello];
```

Objective-C 的方法调用一般写成：

```objc
[接收者 消息];
```

所以：

```objc
[person sayHello];
```

可以读成：

```text
给 person 发送 sayHello 消息
```

带参数的方法：

```objc
[person updateName:@"Codex"];
```

可以读成：

```text
给 person 发送 updateName: 消息，参数是 @"Codex"
```

创建对象这句：

```objc
Person *person = [[Person alloc] initWithName:@"Jiale" age:18];
```

可以拆成两步看：

```objc
Person *person = [Person alloc];
person = [person initWithName:@"Jiale" age:18];
```

含义：

```text
先向 Person 类发送 alloc 消息，分配对象
再向这个对象发送 initWithName:age: 消息，完成初始化
```

---

## 7. `nil` 消息安全

`main.m` 里还有：

```objc
Person *emptyPerson = nil;
[emptyPerson sayHello];
```

在 Objective-C 里，给 `nil` 发送消息通常是安全的，不会像很多语言那样直接崩溃。

也就是说：

```objc
[emptyPerson sayHello];
```

如果 `emptyPerson` 是 `nil`，这句一般什么都不会发生。

这和 Swift 很不一样。

Swift 里如果对象可能为 `nil`，通常需要写：

```swift
person?.sayHello()
```

而 Objective-C 的消息发送天然允许：

```objc
[person sayHello];
```

即使 `person == nil`，也通常不会崩。

不过这不等于所有空值问题都可以忽略。如果给 `nil` 发消息后拿到返回值，并继续参与计算或传给别的逻辑，仍然要小心判断结果是否符合预期。

这个特性会影响很多老 iOS 代码的风格。

---

## 8. 和 Swift / C++ 的区别

### 和 Swift 对比

Swift：

```swift
person.sayHello()
person.updateName("Codex")
```

Objective-C：

```objc
[person sayHello];
[person updateName:@"Codex"];
```

Swift 更像现代静态语言，语法更短。

Objective-C 更像“给对象发送消息”，语法更啰嗦，但 Runtime 能力更强。

### 和 C++ 对比

C++：

```cpp
person.sayHello();
person.updateName("Codex");
```

Objective-C：

```objc
[person sayHello];
[person updateName:@"Codex"];
```

C++ 更偏编译期决定调用关系。

Objective-C 更强调运行时消息发送。

这也是后面学习 Runtime 时会反复遇到的基础直觉。

---

## 9. 当前环境说明

当前主环境是 WSL + Ubuntu。Objective-C 在 Linux 下能否直接编译，取决于本机是否安装了 clang、Objective-C runtime、Foundation/GNUstep 等依赖。

Day30 可以先把重点放在读懂语法和文件结构上，不强制要求当天必须编译通过。

如果 VS Code 中 `Person.h` / `Person.m` / `main.m` 出现红线，尤其是类似下面的错误：

```text
'Foundation/Foundation.h' file not found
```

这通常不是当前 Objective-C 代码写错，而是 WSL 环境里没有 Apple 的 Foundation SDK。

本练习使用了更接近 iOS/macOS 的写法：

- `#import <Foundation/Foundation.h>`
- `NSObject`
- `NSString`
- `NSInteger`
- `NSLog`
- `@autoreleasepool`

这些内容在 macOS + Xcode 环境下更自然。当前阶段可以先把这组文件当作“阅读 Objective-C/iOS 风格代码”的练习，等后面进入 Mac / Xcode 阶段，再尝试真实编译运行。

---

## 10. 今日观察重点

今天不需要记住所有细节，先把下面几件事看顺：

- `.h` 里声明类、属性和方法
- `.m` 里实现方法
- `@interface` 是声明
- `@implementation` 是实现
- `@property` 是属性
- `-` 开头的是对象方法
- `[person sayHello]` 是给对象发送消息
- `[nilObject doSomething]` 在 Objective-C 里通常是安全的

重点读熟这几句：

```objc
Person *person = [[Person alloc] initWithName:@"Jiale" age:18];
[person sayHello];
[person updateName:@"Codex"];
```

把它们读成：

```text
创建一个 Person 对象
给 person 发送 sayHello 消息
给 person 发送 updateName: 消息，并传入新名字
```
