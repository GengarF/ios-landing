//这个类负责模拟完整流程。
import Foundation

final class AppFlowSimulator {
    func start() {
        print("Day 24 Page Data Flow")

        let store = ArticleStore(
            articles: [
                Article(
                    id: 1,
                    title: "Swift Data Flow",
                    content: "Understand how data moves between pages.",
                    likes: 10,
                    isFavorite: false
                ),
                Article(
                    id: 2,
                    title: "List and Detail",
                    content: "A common pattern in iOS apps.",
                    likes: 5,
                    isFavorite: false
                ),
                Article(
                    id: 3,
                    title: "State Update",
                    content: "User actions can change app state.",
                    likes: 20,
                    isFavorite: true
                )
            ]
        )

        let listViewController = ArticleListViewController(store: store)
        listViewController.viewDidLoad()

        print("\n[App] user selects article at index 1")

        guard let selectedArticle = listViewController.selectArticle(at: 1) else {
            return
        }

        let detailViewController = ArticleDetailViewController(
            article: selectedArticle,
            store: store
        )

        detailViewController.viewDidLoad()

        print("\n[App] user interacts on detail page")
        detailViewController.tapLikeButton()
        detailViewController.tapFavoriteButton()

        print("\n[App] detail page renders its original article snapshot")
        detailViewController.render()

        print("\n[App] detail page reads latest article from store")
        detailViewController.renderLatestFromStore()

        print("\n[App] back to list page and render again")
        listViewController.render()
    }
}

/*
这个流程模拟的是：

App 创建 Store
Store 保存文章数据
列表页读取 Store 并展示
用户点击文章
详情页展示选中的文章
用户点赞 / 收藏
状态更新回 Store
详情页原始 article 副本还是旧状态
详情页也可以通过 Store 重新读取最新状态
列表页重新渲染，看到最新状态

这就是今天的核心：

Model -> Store -> List Page -> Detail Page -> Store Update -> Detail Store Read -> List Refresh
*/
