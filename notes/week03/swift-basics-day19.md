# Swift Basics Day 19

## 今天学了什么
- protocol 基础
- 不同类型遵守同一个 protocol
- protocol 作为函数参数
- protocol 约束属性
- protocol extension 默认实现
- 用 protocol 统一不同类型的相同行为

## 核心理解
- protocol 描述的是能力，不是身份
- 不同类型可以共享同一种能力
- 函数参数可以写成某个 protocol，表示接收任何遵守该协议的类型
- protocol 不只能约束方法，也能约束属性
- protocol extension 可以提供默认实现
- 同一能力、不同实现，是 protocol 很适合表达的场景

## 今天最重要的例子
- Student 和 Teacher 都能 introduce
- ArticleItem 和 VideoItem 都有 title
- LocalFile 和 RemoteFile 都能 load

## 今天最容易混淆的点
- protocol 不是 class 继承
- protocol 关心能力，而不是具体类型
- 不要为了抽象而抽象，只有多个类型真的需要统一处理时，protocol 才更有价值

## 以后要继续注意
- protocol 命名要清楚
- 协议职责不要太大
- 默认实现适合放通用行为
- 不同实现适合留给具体类型自己完成