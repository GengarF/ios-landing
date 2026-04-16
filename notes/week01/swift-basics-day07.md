# Swift Basics Day 7

## 今天学了什么
- struct 的值语义
- class 的引用语义
- inout
- static 属性
- static 方法

## 和 C++ 的对应关系
- struct 的赋值复制 ≈ C++ 普通对象拷贝
- class 的引用语义 ≈ 多个指针/引用指向同一个对象
- inout ≈ C++ 的引用参数 T&
- static 属性 ≈ 静态成员变量
- static 方法 ≈ 静态成员函数

## 核心理解
- struct 是值类型，赋值时会复制一份
- class 是引用类型，赋值时多个变量会共享同一个对象
- inout 可以让函数直接修改调用者传入的变量
- static 属于类型本身，而不是某个实例

## 今天最容易混淆的点
- struct 和 class 看起来写法接近，但语义差异很大
- inout 调用时必须加 &
- static 不是实例成员，而是类型成员