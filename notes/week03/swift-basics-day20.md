# Swift Basics Day 20

## 今天学了什么
- struct 的值语义
- class 的引用语义
- 数组中值类型和引用类型的差异
- mutating
- inout

## 核心理解
- struct 赋值时复制数据
- class 赋值时复制引用
- 数组里放 struct，取出来改的是副本
- 数组里放 class，取出来改的是同一个对象
- mutating 表示值类型方法会修改自身
- inout 表示函数会直接修改外部变量

## 和 C++ 的类比
- struct 值语义 ≈ 普通对象拷贝
- class 引用语义 ≈ 多个指针/引用指向同一对象
- inout ≈ C++ 引用参数 T&
- mutating ≈ 显式声明这个值类型方法会修改 self