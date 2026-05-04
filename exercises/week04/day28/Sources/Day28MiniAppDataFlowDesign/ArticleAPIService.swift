import Foundation

final class ArticleAPIService {
    func fetchArticles(completion: @escaping ([Article]) -> Void) {
        print("APIService: 开始模拟网络请求文章列表...")

        let articles = [
            Article(
                id: 1,
                title: "Swift Optional 入门",
                author: "无线平台团队",
                summary: "介绍 Optional 的基本使用场景。",
                isLiked: false
            ),
            Article(
                id: 2,
                title: "iOS 页面数据流设计",
                author: "App 架构组",
                summary: "讲解列表页、详情页、Store 之间的数据流。",
                isLiked: false
            ),
            Article(
                id: 3,
                title: "ARC 与引用循环",
                author: "性能优化小组",
                summary: "理解 strong、weak 和 closure 捕获 self。",
                isLiked: false
            )
        ]

        print("APIService: 网络请求完成，返回 \(articles.count) 篇文章")
        completion(articles)
    }
}
