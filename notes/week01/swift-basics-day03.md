# Swift Basics Day 3

## 今天学了什么
- 属性
- 方法
- mutating
- enum
- switch 匹配 enum
- extension
- self

## 和 C++ 的对应关系
- 属性 ≈ 成员变量
- 方法 ≈ 成员函数
- mutating 表示这个方法会修改 struct 自身
- enum 在 Swift 里比 C++ 的 enum 更强，它本身就是完整类型
- init 仍然可以类比构造函数
- self 可以继续类比 this

## 核心理解
- struct 不只是装数据，也可以有方法
- 如果 struct 方法要修改属性，必须写 mutating
- enum 和 switch 是天然搭配
- extension 可以在不改原定义结构的情况下给类型加行为

## 今天最容易混淆的点
- mutating 只在值类型修改自身时需要
- enum 打印出来不一定是人类最友好的显示形式
- extension 不是新类型，而是给已有类型扩展能力