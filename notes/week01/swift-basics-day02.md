# Swift Basics Day 2

## 今天学了什么
- Optional
- nil
- if let 解包
- Array
- Dictionary
- struct
- class
- init
- self

## 核心理解
### 1. Optional 是什么
Optional 表示一个值可能存在，也可能不存在。
例如：
- `String` 表示一定有值
- `String?` 表示可能有值，也可能是 nil

### 2. Optional 和 C++ 的对应关系
- `String?` / `Int?` 可以类比 `std::optional<T>`
- `nil` 可以类比 `std::nullopt`
- `if let` 可以类比“先判断 optional 有没有值，再取 value”

### 3. Array 是什么
Swift 的 Array 很像 C++ 的 `std::vector`
- `append` ≈ `push_back`
- `count` ≈ `size()`
- `for in` ≈ range-based for

### 4. Dictionary 是什么
Swift 的 Dictionary 很像 C++ 的 `std::unordered_map`
- key 不存在时，取值会返回 Optional
- 所以 `scores["math"]` 的类型不是 `Int`，而是 `Int?`

### 5. struct 和 class
今天先理解成：
- 都可以定义自己的类型
- `struct` 更像轻量的数据类型
- `class` 更像对象类型
- `init` 可以类比构造函数
- `self` 可以先类比 `this->`

## 今天最容易混淆的点
- Optional 不是普通值，不能直接当普通值乱用
- Dictionary 取值返回 Optional，不是直接返回值
- `init` 是 Swift 的初始化器，对应构造函数
- `struct` 和 `class` 的深层区别今天先不展开

## 今天写过的练习
- 认识 Optional
- 用 if let 解包
- nil 的情况
- Array 基本操作
- 遍历数组
- Dictionary 取值与解包
- struct Person
- class Car

## 我自己的总结
今天最大的收获是理解了 Optional。
Swift 不喜欢“值可能为空但类型里不写出来”这种情况，
而是要求在类型层面明确标出来，这比很多语言更安全。