# Objective-C / Swift / C++ 对照笔记

## 1. 文件组织对照

| 维度 | Objective-C | Swift | C++ |
| --- | --- | --- | --- |
| 声明 | `.h` | 通常直接在 `.swift` 中声明 | `.h` / `.hpp` |
| 实现 | `.m` | 通常同文件或同模块其他 `.swift` 文件 | `.cpp` |
| 常见直觉 | 声明和实现分离明显 | 更偏模块内直接组织 | 声明和实现分离明显 |

Day30 练习中的对应关系：

```text
Person.h = 声明 Person 类有什么
Person.m = 实现 Person 类具体怎么做
main.m = 创建对象并调用方法
```

## 2. 类型声明对照

Objective-C：

```objc
@interface Person : NSObject
@end
```

Swift：

```swift
class Person {
}
```

C++：

```cpp
class Person {
};
```

基础直觉：

- Objective-C 用 `@interface ... @end` 声明类
- Swift 用 `class` 声明类
- C++ 也用 `class` 声明类，但类定义结尾需要 `;`

## 3. 对象创建对照

Objective-C：

```objc
Person *person = [[Person alloc] initWithName:@"Jiale" age:18];
```

Swift：

```swift
let person = Person()
```

C++：

```cpp
Person person;
Person *person = new Person();
```

Objective-C 这句可以拆成两次消息发送：

```text
[Person alloc] = 给 Person 类发送 alloc 消息，分配对象
[... initWithName:age:] = 给对象发送初始化消息
```

Swift 的 `Person()` 更接近直接调用初始化器。

C++ 既可以创建栈上的对象，也可以用 `new` 创建堆上的对象。Day30 只需要先知道写法不同，不急着展开内存管理细节。

## 4. 方法调用对照

Objective-C：

```objc
[person sayHello];
[person updateName:@"Codex"];
NSString *profile = [person profileText];
```

Swift：

```swift
person.sayHello()
person.updateName("Codex")
let profile = person.profileText()
```

C++：

```cpp
person.sayHello();
person.updateName("Codex");
std::string profile = person.profileText();
```

基础直觉：

- Objective-C：`[接收者 消息]`
- Swift：`对象.方法()`
- C++：`对象.方法()`

Objective-C 的方法名会把参数名嵌进去：

```objc
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age;
```

这个方法名整体可以读成：

```text
initWithName:age:
```

## 5. 属性对照

Objective-C：

```objc
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
```

Swift：

```swift
var name: String
var age: Int
```

C++：

```cpp
std::string name;
int age;
```

Day30 先记住：

- Objective-C 对象类型常见 `NSString *name`，里面有 `*`
- Objective-C 基础数值类型常见 `NSInteger age`，没有 `*`
- `copy` 常用于 `NSString`
- `assign` 常用于基础数值类型

## 6. nil / Optional / nullptr 对照

| 语言 | 空值表达 | 基础直觉 |
| --- | --- | --- |
| Objective-C | `nil` | 给 `nil` 发消息通常安全 |
| Swift | `nil` + `Optional` | 必须显式处理 Optional |
| C++ | `nullptr` | 对空指针解引用通常危险 |

Day30 例子：

```objc
Person *emptyPerson = nil;
[emptyPerson sayHello];
```

这句在 Objective-C 里通常不会崩溃，可以先理解成“给空对象发消息，通常什么都不做”。

但这不等于所有空值问题都可以忽略。如果给 `nil` 发消息后还要继续使用返回值，仍然要确认结果是否符合预期。

Swift 的直觉更像：

```swift
person?.sayHello()
```

C++ 的空指针调用更危险，Day30 只先记住“不要把 C++ 空指针直觉直接套到 Objective-C 的 `nil` 消息上”。

## 7. 内存管理对照

待 Day31 / Day32 / ARC 复盘时补充。

## 8. 协议 / 接口 / 抽象对照

待 Day31 学习 Objective-C Protocol 后补充。

## 9. 闭包 / Block / Lambda 对照

待 Day31 学习 Objective-C Block 后补充。

## 10. Runtime / 静态派发 / 动态派发对照

待 Day32 学习 Runtime 后补充。
