# Day28 学习日志

## 今日主题

小项目 2：设计版 App 数据流

## 今日完成内容

- 完成 Article 模型设计
- 完成 ArticleAPIService 模拟异步网络请求
- 完成 ArticleRepository 数据仓库层
- 完成 ArticleStore 统一状态源
- 完成 ArticleListViewController 列表页模拟
- 完成 ArticleDetailViewController 详情页模拟
- 完成 MainThreadSimulator 主线程模拟器
- 完成 AppSimulator，串起完整 App 数据流
- 成功运行 `swift run`

## 今日核心链路

```text
AppSimulator
-> ArticleListViewController.viewDidLoad
-> ArticleRepository.loadHomeArticles
-> ArticleAPIService.fetchArticles
-> MainThreadSimulator.run
-> ArticleStore.replaceArticles
-> ArticleListViewController.render
-> simulateUserTapArticle
-> ArticleDetailViewController
-> ArticleStore.toggleLike
-> render

## 核心链路

程序启动
-> @main main()
-> 创建 AppSimulator
-> AppSimulator.run()
-> ListViewController.viewDidLoad()
-> Repository.loadHomeArticles()
-> APIService.fetchArticles()
-> 后台线程延迟 1 秒返回文章
-> Repository 把文章返回给 ListViewController
-> MainThreadSimulator.run()
-> Store.replaceArticles()
-> ListViewController.render()
-> AppSimulator 模拟点击 id = 2 的文章
-> ListViewController 从 Store 找到文章
-> onSelectArticle 回调给 AppSimulator
-> AppSimulator 创建 DetailViewController
-> DetailViewController.viewDidLoad()
-> DetailViewController 从 Store 读取文章并渲染
-> 用户点击点赞
-> DetailViewController 调用 Store.toggleLike(articleID:)
-> Store 修改统一状态
-> DetailViewController 重新渲染
-> AppSimulator 模拟回到列表页
-> ListViewController.render()
-> 列表页从 Store 读到最新点赞状态
