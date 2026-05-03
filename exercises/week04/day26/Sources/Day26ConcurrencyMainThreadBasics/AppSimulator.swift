import Foundation
import Dispatch

final class AppSimulator {
    private let apiService = MockAPIService()
    private let mainThreadSimulator = MainThreadSimulator()

    func start() {
        print("Day 26 Concurrency Main Thread Basics")
        print("[App] show loading")

        let semaphore = DispatchSemaphore(value: 0)
        let mainThreadSimulator = mainThreadSimulator

        apiService.fetchArticles { articles in
            print("[App] data loaded")

            mainThreadSimulator.runOnMainThread {
                print("[UI] render articles")

                for article in articles {
                    print("- \(article.summary)")
                }
            }

            semaphore.signal()
        }

        semaphore.wait()
        print("[App] finished")
    }
}