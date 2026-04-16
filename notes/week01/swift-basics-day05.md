# Swift Basics Day 5

## 今天学了什么
- 计算属性
- 带 getter / setter 的计算属性
- 属性观察器 willSet / didSet
- extension 给已有类型加属性
- extension 给已有类型加方法

## 和 C++ 的对应关系
- 计算属性 ≈ getter / setter 封装
- willSet / didSet ≈ 手写 setter 时的前后日志逻辑
- extension 在 C++ 没有这么直接的语言内建形式
- 扩展 Int / String 本质上是给已有类型补能力

## 核心理解
- 存储属性是真正存值
- 计算属性不直接存值，而是现算
- willSet / didSet 是属性变化前后的自动钩子
- extension 可以让已有类型更好用

## 今天最容易混淆的点
- 计算属性和方法的边界
- 带 setter 的计算属性本质上不是存了两个值
- extension 不是继承，也不是新类型