import Foundation

final class AppSimulator {
    private let apiService: ArticleAPIService
    private let repository: ArticleRepository
    private let store: ArticleStore
    private let listViewController: ArticleListViewController

    init() {
        self.apiService = ArticleAPIService()
        self.repository = ArticleRepository(apiService: apiService)
        self.store = ArticleStore()
        self.listViewController = ArticleListViewController(
            repository: repository,
            store: store
        )

        configureRoutes()
    }

    func run() {
        print("")
        print("AppSimulator: App 启动")
        print("")

        let semaphore = DispatchSemaphore(value: 0)

        listViewController.viewDidLoad { [weak self] in
            guard let self else {
                semaphore.signal()
                return
            }

            self.listViewController.simulateUserTapArticle(id: 2)

            print("AppSimulator: 回到列表页，重新渲染，观察点赞状态是否同步")
            self.listViewController.render()

            self.store.printCurrentState()

            print("AppSimulator: App 流程结束")
            semaphore.signal()
        }

        semaphore.wait()
    }

    private func configureRoutes() {
        listViewController.setOnSelectArticle { [weak self] article in
            self?.openDetail(article: article)
        }
    }

    private func openDetail(article: Article) {
        print("AppSimulator: 打开文章详情页：\(article.title)")

        let detailViewController = ArticleDetailViewController(
            article: article,
            store: store
        )

        detailViewController.viewDidLoad()
        detailViewController.simulateTapLikeButton()
    }
}

/*
这里用了：

DispatchSemaphore

原因是现在是命令行程序，APIService 里用了异步模拟网络请求。

如果不用 semaphore，程序可能还没等异步请求回来就结束了。

真实 iOS App 不需要这么写，因为 App 生命周期一直存在。
*/