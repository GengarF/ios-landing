# Swift Basics Day 8

## 今天学了什么
- Generics
- 泛型函数
- 泛型 + Optional
- protocol extension
- compactMap
- reduce

## 和 C++ 的对应关系
- Generics ≈ 模板
- 泛型函数 ≈ template function
- protocol extension ≈ 接口 + 默认实现
- compactMap ≈ parse + 过滤掉无效值
- reduce ≈ std::accumulate

## 核心理解
- 泛型的核心是“不要把类型写死”
- protocol extension 可以给协议提供默认实现
- compactMap 会在转换的同时去掉 nil
- reduce 会把一组值按规则累计成一个结果

## 今天最容易混淆的点
- 泛型函数和普通函数的区别
- protocol 本身和 protocol extension 的区别
- map / compactMap / filter / reduce 的作用边界

## 我自己的总结
Day 8 开始，Swift 的抽象能力更明显了。
今天接触到的内容比前几天更接近真实项目里的常见写法。