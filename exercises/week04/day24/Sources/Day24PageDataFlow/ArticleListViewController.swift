//列表页负责展示所有文章，并模拟用户点击某一篇文章。
import Foundation

final class ArticleListViewController {
    private let store: ArticleStore

    init(store: ArticleStore) {
        self.store = store
    }

    func viewDidLoad() {
        print("[List] view did load")
        render()
    }

    func render() {
        print("[List] Articles:")

        let articles = store.allArticles()

        for (index, article) in articles.enumerated() {
            print("- index \(index): \(article.summary)")
        }
    }

    func selectArticle(at index: Int) -> Article? {
        guard let article = store.article(at: index) else {
            print("[List] invalid selection")
            return nil
        }

        print("[List] selected article: \(article.title)")
        return article
    }
}

/*
这里你要理解：

ListViewController 不自己保存文章数组。
它依赖 ArticleStore。
展示时从 store.allArticles() 读取。
点击时通过 store.article(at:) 获取文章。

这就是一种很简化的数据流：

Store -> List Page
*/