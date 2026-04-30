import Foundation

class HomeViewController: ViewController {
    private var articles: [Article]

    init(articles: [Article]) {
        self.articles = articles
        super.init(title: "Home")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        printArticles()
    }

    func printArticles() {
        print("[Home] Article List:")

        for article in articles {
            print("- \(article.id): \(article.title)")
        }
    }

    func selectArticle(at index: Int) -> Article? {
        guard articles.indices.contains(index) else {
            print("[Home] invalid article index")
            return nil
        }

        return articles[index]
    }
}

/*
这里几个重点：

HomeViewController 继承 ViewController

articles 是首页的数据

viewDidLoad() 里先调用 super.viewDidLoad()

selectArticle(at:) 模拟用户点击某一篇文章

返回 Article?，因为用户可能点了无效位置
*/