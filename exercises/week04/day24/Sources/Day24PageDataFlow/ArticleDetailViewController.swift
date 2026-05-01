//详情页接收一篇文章，同时也持有 store，这样它可以触发状态更新。
import Foundation

final class ArticleDetailViewController {
    private let article: Article
    private let store: ArticleStore

    init(article: Article, store: ArticleStore) {
        self.article = article
        self.store = store
    }

    func viewDidLoad() {
        print("[Detail] view did load")
        render()
    }

    func render() {
        print("[Detail] rendering article snapshot")
        print("[Detail] title = \(article.title)")
        print("[Detail] content = \(article.content)")
        print("[Detail] likes = \(article.likes)")
        print("[Detail] favorite = \(article.isFavorite)")
    }

    func renderLatestFromStore() {
        guard let latestArticle = store.article(id: article.id) else {
            print("[Detail] latest article not found")
            return
        }

        print("[Detail] rendering latest article from store")
        print("[Detail] title = \(latestArticle.title)")
        print("[Detail] content = \(latestArticle.content)")
        print("[Detail] likes = \(latestArticle.likes)")
        print("[Detail] favorite = \(latestArticle.isFavorite)")
    }

    func tapLikeButton() {
        print("[Detail] user taps like button")
        store.likeArticle(id: article.id)
    }

    func tapFavoriteButton() {
        print("[Detail] user taps favorite button")
        store.toggleFavorite(id: article.id)
    }
}

/*
这里有一个非常重要的点：

详情页里 article 是进入页面时拿到的那份数据。
但点赞后，我们是更新了 store 里的数据。

所以如果你立刻再次调用 render()，它打印的还是旧的 article 副本。

如果想看到 Store 里的最新状态，可以通过 article.id 重新读取：

renderLatestFromStore()

这正好能帮助理解一个 iOS 里的关键问题：

页面数据和真实数据源之间可能会不同步。

所以待会儿我们会在 AppFlowSimulator 里回到列表页重新渲染，观察 Store 里的数据已经变了。
*/
