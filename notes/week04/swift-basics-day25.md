# Swift Basics Day 25

## 今天学了什么
- 网络层和数据层的基本概念
- 用 Mock API 模拟网络请求
- 用 Service 负责获取数据
- 用 Repository 包装数据获取逻辑
- 用 AppSimulator 模拟 App 调用数据层
- 用 throws / do-catch 处理请求失败

## 核心理解
- Model 负责表达数据
- APIService 负责获取原始数据
- Repository 负责包装数据获取逻辑
- App 层不应该直接关心底层数据怎么来的
- 请求可能成功，也可能失败，所以需要错误处理

## 今天的数据流
AppSimulator -> ArticleRepository -> ArticleAPIService -> Article

## 今天最重要的点
Repository 可以把 App 层和 APIService 隔开。
这样以后数据来源变化时，App 层不需要直接跟着改。

## 和真实 iOS 的对应关系
- Article 类似网络返回后解码出来的 Model
- ArticleAPIService 类似网络请求层
- NetworkError 类似请求失败时的错误类型
- ArticleRepository 类似数据仓库 / 数据访问层
- AppSimulator 模拟页面或 App 调用数据层