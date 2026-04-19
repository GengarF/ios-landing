# Swift Basics Day 9

## 今天学了什么
- struct 的 memberwise init
- 自定义 init
- 默认值和 init()
- class 初始化
- 可失败初始化 init?
- 在 extension 中补充初始化器

## 和 C++ 的对应关系
- init ≈ 构造函数
- memberwise init ≈ 按成员传值的构造调用
- 自定义 init ≈ 自己写构造函数
- init? ≈ 更像“返回 optional 的工厂式创建”
- extension 中补 init ≈ 补充更方便的构造入口

## 核心理解
- struct 通常会自动得到 memberwise init
- 自定义 init 可以在初始化时做数据处理
- 有默认值时，可以直接用空初始化
- class 初始化时必须把存储属性都初始化好
- init? 适合表示“对象创建可能失败”
- extension 可以补充更方便的初始化器

## 今天最容易混淆的点
- memberwise init 和自定义 init 的区别
- init? 返回的不是普通对象，而是 Optional
- extension 中补 init 时，最好复用已有初始化器