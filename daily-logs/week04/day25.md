# Day 25

## 今日目标
- 理解网络层和数据层的基本职责
- 用纯 Swift 模拟 API 请求和数据返回
- 理解 Service / Repository / Store 的区别
- 跑通 day25 的练习项目

## 今日完成
- 定义了 Article 数据模型
- 定义了 NetworkError 错误类型
- 定义了 ArticleAPIService 模拟网络请求
- 定义了 ArticleRepository 包装数据获取逻辑
- 定义了 AppSimulator 模拟 App 调用数据层
- 实现了成功加载数据的流程
- 实现了请求失败的错误处理
- 跑通了 swift run

## 遇到的问题
- 需要继续理解 APIService 和 Repository 的职责区别
- 当前只是 mock 数据，还没有真正发起网络请求
- 需要继续熟悉 throws / do-catch 在数据层中的使用

## 今天印象最深的点
- 页面数据通常来自数据层，而不是直接写死在页面里
- Repository 可以隔离 App 层和 APIService
- 请求失败是正常情况，需要明确错误处理
- Mock API 很适合在没有真实接口时练习数据流


## 明天计划
- 继续理解 JSON 和 Codable
- 学习网络数据如何转成 Swift Model
