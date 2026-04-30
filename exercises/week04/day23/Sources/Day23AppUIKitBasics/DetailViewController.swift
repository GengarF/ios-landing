import Foundation

class DetailViewController: ViewController {
    private let article: Article

    init(article: Article) {
        self.article = article
        super.init(title: "Detail")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        printDetail()
    }

    func printDetail() {
        print("[Detail] title = \(article.title)")
        print("[Detail] content = \(article.content)")
    }
}

/*
页面跳转本质上经常伴随数据传递。

首页选中一篇文章，然后把这篇文章传给详情页。

这里重点是：

详情页的数据不是自己凭空来的，而是从首页传过来的。

这就是 iOS 里非常常见的：

列表页传数据给详情页。
*/