# Swift Basics Day 12

## 今天学了什么
- map
- filter
- compactMap
- reduce
- 高阶函数链式组合

## 和 C++ 的对应关系
- map ≈ 遍历数组并生成新数组
- filter ≈ 遍历数组并按条件留下元素
- compactMap ≈ 尝试转换，成功就保留，失败就跳过
- reduce ≈ std::accumulate
- 链式调用 ≈ 多轮手写 for 循环组合

## 核心理解
- map 是“逐个变换”
- filter 是“按条件筛选”
- compactMap 是“转换并去掉 nil”
- reduce 是“累计成一个结果”
- 高阶函数可以串起来形成数据处理链

## 今天最容易混淆的点
- map 和 compactMap 的区别
- filter 和 map 的边界
- reduce 的初始值为什么重要
- 高阶函数虽然方便，但不应该为了炫技而乱用