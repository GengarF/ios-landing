import Foundation

final class ArticleStore {
    private(set) var articles: [Article] = []

    func replaceArticles(_ newArticles: [Article]) {
        articles = newArticles
        print("Store: 已保存文章列表，当前共 \(articles.count) 篇")
    }

    func article(id: Int) -> Article? {
        articles.first { $0.id == id }
    }

    func toggleLike(articleID: Int) {
        guard let index = articles.firstIndex(where: { $0.id == articleID }) else {
            print("Store: 没有找到 id 为 \(articleID) 的文章，无法点赞")
            return
        }

        articles[index].isLiked.toggle()

        let article = articles[index]
        print("Store: 已更新文章《\(article.title)》点赞状态：\(article.likeText)")
    }

    func printCurrentState() {
        print("")
        print("====== Store 当前状态 ======")

        if articles.isEmpty {
            print("暂无文章")
        } else {
            for article in articles {
                print("[\(article.id)] \(article.title) - \(article.likeText)")
            }
        }

        print("==========================")
        print("")
    }
}

/*
这里要重点看：

private(set) var articles: [Article] = []

意思是：

外部可以读 articles
但外部不能直接改 articles
只能通过 Store 提供的方法修改

这是很重要的工程习惯。

不要让外部到处直接改数据，否则项目大了之后，状态会乱。
*/