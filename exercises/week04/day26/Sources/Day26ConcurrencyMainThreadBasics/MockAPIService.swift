import Foundation
import Dispatch

final class MockAPIService {
    func fetchArticles(completion: @escaping @Sendable ([Article]) -> Void) {
        print("[API] start loading articles in background")

        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {  //模拟后台加载数据
            let articles = [
                Article(
                    id: 1,
                    title: "Concurrency Basics",
                    content: "Learn background tasks."
                ),
                Article(
                    id: 2,
                    title: "Main Thread",
                    content: "UI updates should happen on main thread."
                ),
                Article(
                    id: 3,
                    title: "Completion",
                    content: "Use completion to return async results."
                )
            ]

            completion(articles) //表示数据加载完成后，把结果交给外部。
        }
    }
}