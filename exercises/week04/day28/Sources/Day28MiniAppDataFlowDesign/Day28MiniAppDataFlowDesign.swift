// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation

@main
enum Day28MiniAppDataFlowDesign {
    static func main() {
        let app = AppSimulator()
        app.run()
    }
}


/*
Day 28：小项目 2 设计版 App 数据流。

今天这个项目模拟的是一个非常简化的文章 App。
目标是把 Day23～Day27 串成一条完整链路： 也是大厂 iOS 业务代码里非常常见的数据流雏形。

App start
-> List Page load
-> Repository fetch articles
-> APIService async load
-> Repository returns articles
-> MainThread update Store/UI
-> Store save articles
-> List Page render
-> Select article
-> Detail Page render
-> User action
-> Store update article
-> List Page refresh

它有：

Article：文章数据模型
ArticleAPIService：模拟异步网络加载
ArticleRepository：包装数据获取逻辑
ArticleStore：保存和更新文章状态
ArticleListViewController：模拟列表页
ArticleDetailViewController：模拟详情页
MainThreadSimulator：模拟回到主线程更新 UI
AppSimulator：组织完整 App 流程

今天要重点理解的不是某一行 API，而是：

数据怎么从服务层进入 App，又怎么被页面展示和更新。
*/