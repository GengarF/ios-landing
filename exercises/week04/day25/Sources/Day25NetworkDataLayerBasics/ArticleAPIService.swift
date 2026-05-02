import Foundation

protocol ArticleAPIServiceProtocol {
    func fetchArticles() throws -> [Article]
}

final class ArticleAPIService: ArticleAPIServiceProtocol {
    private let shouldSimulateFailure: Bool

    init(shouldSimulateFailure: Bool = false) {
        self.shouldSimulateFailure = shouldSimulateFailure
    }

    func fetchArticles() throws -> [Article] {
        if shouldSimulateFailure {
            throw NetworkError.serverError
        }

        let articles = [
            Article(id: 1, title: "Swift Networking", content: "Learn how apps get data."),
            Article(id: 2, title: "Repository Pattern", content: "Separate data fetching from app flow."),
            Article(id: 3, title: "Mock API Service", content: "Use fake data before real networking.")
        ]

        guard !articles.isEmpty else {
            throw NetworkError.emptyResponse
        }

        return articles
    }
}

/*
这里的重点是：

APIService 负责“获取原始数据”。

现在我们没有真的发网络请求，而是用假数据模拟。
这就是 mock API 的感觉。

shouldSimulateFailure 是这个 mock service 自己的配置，
App 调用获取文章时不需要传 shouldFail。

真实项目里，它可能会用：

URLSession
async/await
JSON decoding
*/
