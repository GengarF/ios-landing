# Day 24

## 今日目标
- 理解页面和数据流的基本关系
- 用纯 Swift 模拟列表页、详情页和状态更新
- 理解数据从 Model 到 Page，再到用户交互后的变化过程
- 跑通 day24 的练习项目

## 今日完成
- 定义了 Article 模型
- 定义了 ArticleStore 数据源
- 定义了 ArticleListViewController 列表页
- 定义了 ArticleDetailViewController 详情页
- 定义了 AppFlowSimulator 模拟页面流程
- 实现了文章列表展示
- 实现了文章详情展示
- 实现了点赞和收藏状态更新
- 实现了返回列表后重新渲染最新状态
- 跑通了 swift run

## 遇到的问题
- 需要继续理解页面临时数据和 Store 数据源之间的区别
- 需要继续体会 struct 值语义对状态更新的影响
- 当前仍然是纯 Swift 模拟，还不是实际 UIKit

## 今天印象最深的点
- 页面展示的数据应该来自统一数据源
- 用户操作后应该更新 Store
- 列表页重新渲染时，能看到 Store 中的最新状态
- 数据流比单纯页面跳转更接近真实 App 开发


## 明天计划
- 继续理解网络与数据层
- 继续模拟更真实的 App 数据获取和展示流程
