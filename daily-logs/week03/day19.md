# Day 19

## 今日目标
- 学习协议驱动的基本思路
- 学习如何让不同类型共享一套行为
- 跑通 day19 的练习项目

## 今日完成
- 完成了 6 个练习
- 定义了 Introducible 协议
- 让 User / Student / Teacher 遵守同一个协议
- 学会了把 protocol 作为函数参数
- 学会了用 Titled 协议约束 title 属性
- 学会了 protocol extension 默认实现
- 用 Loadable 统一了本地资源和远程资源的加载行为
- 跑通了 swift run

## 遇到的问题
- exercise3 调用 introduce() 时，输出标签仍然显示 exercise2，日志上有点混乱
- 还需要继续体会什么时候适合抽成 protocol
- 需要避免为了抽象而抽象

## 今天印象最深的点
- protocol 描述的是能力，不是身份
- 不同类型可以通过同一个 protocol 被统一处理
- Loadable 这种例子已经很像真实工程里的抽象方式


## 明天计划
- 继续学习值类型和引用类型的进一步应用
- 继续加强模型设计和协议抽象能力