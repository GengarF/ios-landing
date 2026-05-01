import Foundation

final class ArticleStore {
    private var articles: [Article]

    init(articles: [Article]) {
        self.articles = articles
    }

    func allArticles() -> [Article] {
        articles
    }

    func article(at index: Int) -> Article? {
        guard articles.indices.contains(index) else {
            return nil
        }

        return articles[index]
    }

    func article(id: Int) -> Article? {
        articles.first { $0.id == id }
    }

    func likeArticle(id: Int) {
        guard let index = articles.firstIndex(where: { $0.id == id }) else {
            return
        }

        articles[index].likes += 1
    }

    func toggleFavorite(id: Int) {
        guard let index = articles.firstIndex(where: { $0.id == id }) else {
            return
        }

        articles[index].isFavorite.toggle()
    }
}

/*
这里是今天的重点。

Article 是 struct，所以它是值类型。
如果详情页拿到一篇文章副本，直接改副本，不会自动改回 Store。
所以我们让状态变化通过 ArticleStore 来完成：

store.likeArticle(id: article.id)
store.toggleFavorite(id: article.id)

这就模拟了真实 App 里的一个重要思路：

页面展示数据，但真正的数据状态应该由一个统一的数据源管理。

*/
