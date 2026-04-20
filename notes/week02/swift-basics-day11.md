# Swift Basics Day 11

## 今天学了什么
- closure 作为函数参数
- trailing closure
- closure 完整参数写法
- $0 / $1 参数简写
- 自定义接收 closure 的高阶函数
- completion 风格 closure

## 和 C++ 的对应关系
- closure 参数 ≈ std::function / lambda 参数
- trailing closure ≈ Swift 对最后一个函数参数的语法糖
- $0 / $1 是 Swift 的参数简写，C++ 没有这么直接的对应物
- transformNumbers ≈ 手写 map 风格函数
- completion 风格 closure ≈ 回调函数

## 核心理解
- closure 不只是“匿名函数”，还经常作为参数传入函数
- trailing closure 是 Swift 很常见的写法
- $0 / $1 让短 closure 更简洁
- 高阶函数本质上是“函数接收函数”
- completion 风格的 closure 很适合表达“做完之后执行什么”

## 今天最容易混淆的点
- 完整 closure 写法和简写写法的关系
- trailing closure 只是语法糖，不改变本质
- completion 风格 closure 不一定意味着异步，它首先是一种回调表达方式