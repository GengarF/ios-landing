//Repository 包装 APIService。
import Foundation

final class ArticleRepository {
    private let apiService: ArticleAPIServiceProtocol

    init(apiService: ArticleAPIServiceProtocol) {
        self.apiService = apiService
    }

    func loadArticles() throws -> [Article] {
        try apiService.fetchArticles()
    }
}

/*
这里重点是：

App 不直接依赖 APIService，而是通过 Repository 获取数据。

App -> Repository -> APIService

这样以后如果数据来源变化，比如：

网络
本地缓存
数据库
mock 数据

App 层不用直接关心。

Repository 依赖 ArticleAPIServiceProtocol，
这样以后可以替换真实网络服务或测试用 mock。
*/
