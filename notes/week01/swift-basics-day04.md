# Swift Basics Day 4

## 今天学了什么
- protocol
- protocol 约束方法
- protocol 约束属性
- throws / try / do-catch
- closure
- sorted
- map

## 和 C++ 的对应关系
- protocol ≈ 抽象接口 / 纯虚基类
- throws / try / do-catch ≈ 异常机制
- closure ≈ lambda
- sorted + closure ≈ sort + lambda 比较器
- map ≈ 对数组逐个处理后生成新数组

## 核心理解
- protocol 用来定义“必须提供哪些能力”
- 可能失败的函数要显式写 throws
- 整数除法 Int / Int 的结果还是 Int
- closure 是匿名函数，很适合和 sorted / map 这种高阶函数配合

## 今天最容易混淆的点
- throws 只是“可能抛错”，真正调用时还要 try
- Dictionary 返回 Optional，今天虽然没重点写，但这和可能失败的调用思路很像
- closure 语法一开始看着怪，其实可以直接类比 lambda