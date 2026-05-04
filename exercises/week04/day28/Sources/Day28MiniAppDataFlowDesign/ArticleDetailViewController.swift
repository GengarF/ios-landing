import Foundation

final class ArticleDetailViewController {
    private let articleID: Int
    private let store: ArticleStore

    init(article: Article, store: ArticleStore) {
        self.articleID = article.id
        self.store = store
    }

    func viewDidLoad() {
        print("")
        print("DetailViewController: viewDidLoad，详情页开始展示")
        render()
    }

    func render() {
        guard let article = store.article(id: articleID) else {
            print("DetailViewController: 找不到文章，无法展示")
            return
        }

        print("")
        print("====== 文章详情页 ======")
        print("标题：\(article.title)")
        print("作者：\(article.author)")
        print("摘要：\(article.summary)")
        print("状态：\(article.likeText)")
        print("=======================")
        print("")
    }

    func simulateTapLikeButton() {
        print("DetailViewController: 用户点击点赞按钮")
        store.toggleLike(articleID: articleID)
        render()
    }
}

/*
这里有个非常重要的设计点：

详情页没有保存一份独立的 Article 副本，而是保存：

private let articleID: Int
private let store: ArticleStore

为什么？

因为如果详情页自己持有一份 Article：

private var article: Article

那么点赞后可能只改了详情页自己的数据，列表页不知道。

现在详情页通过 store.toggleLike(articleID:) 修改统一状态源，列表页再 render 时就能看到最新状态。

这就是今天的核心思想：

Store 是统一状态源。
*/