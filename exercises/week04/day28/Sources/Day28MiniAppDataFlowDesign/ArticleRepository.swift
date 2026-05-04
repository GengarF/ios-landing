import Foundation

final class ArticleRepository {
    private let apiService: ArticleAPIService

    init(apiService: ArticleAPIService) {
        self.apiService = apiService
    }

    func loadHomeArticles(completion: @escaping ([Article]) -> Void) {
        print("Repository: 准备加载首页文章数据")

        apiService.fetchArticles { articles in
            print("Repository: 收到 APIService 返回的数据，准备交给上层")
            completion(articles)
        }
    }
}

/*
Repository 的意义是：不要让 ViewController 直接依赖 APIService 的细节。

以后真实项目里，Repository 可能会做这些事：

先读缓存
缓存没有再请求网络
请求失败返回兜底数据
把 DTO 转成页面 Model
合并多个接口结果

今天先做最小版。
*/