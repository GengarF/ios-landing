# Swift Basics Day 24

## 今天学了什么
- 页面和数据流的基本关系
- Model / Store / List Page / Detail Page 的职责
- 用纯 Swift 模拟列表页和详情页
- 模拟用户操作后更新状态
- 理解数据源和页面展示之间的关系

## 核心理解
- Model 负责表达数据
- Store 是统一的数据源
- List Page 负责展示集合数据
- Detail Page 负责展示单个对象
- 用户操作应该修改数据源，而不是只改页面里的临时副本
- 页面重新渲染时，应从数据源读取最新状态

## 今天的数据流
Model -> Store -> List Page -> Detail Page -> User Action -> Store Update -> List Refresh

## 今天最重要的点
Article 是 struct，传给详情页的是一份值。
如果只修改详情页里的 Article，不一定会影响 Store。
所以状态更新应该通过 ArticleStore 完成。

## 和真实 iOS 的对应关系
- Article 类似页面使用的 Model
- ArticleStore 类似简单数据源 / 状态管理器
- ArticleListViewController 类似列表页
- ArticleDetailViewController 类似详情页
- AppFlowSimulator 模拟 App 页面流程