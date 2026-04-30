import Foundation

final class AppSimulator {
    func start() {
        print("[App] start")

        let articles = [
            Article(id: 1, title: "Swift Basics", content: "Learn variables, functions, and structs."),
            Article(id: 2, title: "UIKit Intro", content: "Understand ViewController and app flow."),
            Article(id: 3, title: "Data Modeling", content: "Use structs to model app data.")
        ]

        let homeViewController = HomeViewController(articles: articles)
        homeViewController.viewDidLoad()

        print("[App] user taps article at index 1")

        if let selectedArticle = homeViewController.selectArticle(at: 1) {
            let detailViewController = DetailViewController(article: selectedArticle)
            detailViewController.viewDidLoad()
        }
    }
}

/*
App 启动后不是直接乱跑代码，而是进入一套页面流程。

今天的 AppSimulator 就是在模拟这个流程。
这里模拟的是：

App 启动
准备数据
创建首页
首页加载
用户点击文章
创建详情页
详情页加载

这就是非常简化版的 App 流程。
*/