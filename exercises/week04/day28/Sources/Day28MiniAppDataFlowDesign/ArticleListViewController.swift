import Foundation

final class ArticleListViewController {
    private let repository: ArticleRepository
    private let store: ArticleStore

    private var onSelectArticle: ((Int) -> Void)?

    init(repository: ArticleRepository, store: ArticleStore) {
        self.repository = repository
        self.store = store
    }

    func setOnSelectArticle(_ handler: @escaping (Int) -> Void) {
        self.onSelectArticle = handler
    }

    func viewDidLoad(completion: @escaping () -> Void) {
        print("")
        print("ListViewController: viewDidLoad，列表页开始加载")
        print("")

        repository.loadHomeArticles { [weak self] result in
            MainThreadSimulator.run {
                guard let self else {
                    completion()
                    return
                }

                switch result {
                case .success(let articles):
                    self.store.replaceArticles(articles)
                    self.render()
                case .failure(let error):
                    print("ListViewController: 加载文章失败：\(error.localizedDescription)")
                }

                completion()
            }
        }
    }

    func render() {
        print("")
        print("====== 文章列表页 ======")

        if store.articles.isEmpty {
            print("暂无文章")
        } else {
            for article in store.articles {
                print("[\(article.id)] \(article.title) / \(article.author) / \(article.likeText)")
                print("    \(article.summary)")
            }
        }

        print("=======================")
        print("")
    }

    func simulateUserTapArticle(id: Int) {
        print("ListViewController: 用户点击了 id 为 \(id) 的文章")

        guard let article = store.article(id: id) else {
            print("ListViewController: 没有找到这篇文章")
            return
        }

        onSelectArticle?(article.id)
    }
}

/*
这里是今天最重要的 ViewController 数据流。

列表页不自己制造数据，而是：

viewDidLoad
-> repository.loadHomeArticles
-> APIService 返回文章
-> MainThreadSimulator.run
-> store.replaceArticles
-> render

还有一个点：

private var onSelectArticle: ((Int) -> Void)?

这表示列表页不知道“点击后具体怎么跳转”。

它只暴露一个点击事件：

onSelectArticle?(article.id)

真正打开详情页的逻辑，放到 AppSimulator 里统一协调。

这是一种很简单的“路由 / 协调”思想。
*/
