# Day28 - 小项目 2：设计版 App 数据流

## 1. 今天完成了什么

今天完成了一个纯 Swift 命令行版本的 App 数据流模拟项目。

项目模拟了：

- App 启动
- 列表页加载
- Repository 请求数据
- APIService 异步返回数据
- 回到主线程更新 UI
- Store 保存文章列表
- 列表页展示文章
- 用户点击文章
- 打开详情页
- 用户点赞
- Store 更新点赞状态
- 列表页重新渲染并看到最新状态

## 2. 项目中的文件职责

### Article

`Article` 是文章模型，用来描述一篇文章的数据结构。

字段包括：

- id
- title
- author
- summary
- isLiked

其中 `isLiked` 是可变状态，因为点赞状态会变化。

### ArticleAPIService

`ArticleAPIService` 模拟网络层。

它通过 `DispatchQueue.global().asyncAfter` 模拟异步请求，通过 completion 返回文章列表。
（但是对于这个项目使用会导致编译失败：
编译失败的根因是 DispatchQueue.global().asyncAfter 的闭包在 Swift 6 检查下是 @Sendable。
这个 @Sendable 闭包捕获了普通的 completion，所以编译器报错。
当前 Day28 的重点是 App 数据流，不是 Swift 并发隔离，所以先去掉后台线程模拟，保留最核心的数据链路。）

这里使用了 `@escaping`，因为 completion 会在函数返回之后才执行。

### ArticleRepository

`ArticleRepository` 是数据仓库层。

它负责向上层隐藏 APIService 的细节。

ViewController 不直接调用 APIService，而是调用 Repository。

### ArticleStore

`ArticleStore` 是统一状态源。

它负责保存文章列表，并提供：

- replaceArticles
- article(id:)
- toggleLike(articleID:)
- printCurrentState

外部不能直接修改 `articles`，只能通过 Store 提供的方法修改状态。

### ArticleListViewController

`ArticleListViewController` 模拟列表页。

它负责：

- 在 viewDidLoad 时加载文章
- 把文章保存到 Store
- 渲染列表页
- 模拟用户点击文章

### ArticleDetailViewController

`ArticleDetailViewController` 模拟详情页。

它不直接保存 Article 副本，而是保存 articleID 和 Store。

这样详情页和列表页共享同一个状态源。

### MainThreadSimulator

`MainThreadSimulator` 模拟回到主线程更新 UI。

真实 iOS 中更新 UI 应该使用：

```swift
DispatchQueue.main.async {
    // 更新 UI
}
