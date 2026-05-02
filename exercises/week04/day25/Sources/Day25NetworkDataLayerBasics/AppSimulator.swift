//这个类模拟 App 调用数据层。

import Foundation

final class AppSimulator {
    private let successRepository: ArticleRepository
    private let failureRepository: ArticleRepository

    init(successRepository: ArticleRepository, failureRepository: ArticleRepository) {
        self.successRepository = successRepository
        self.failureRepository = failureRepository
    }

    func start() {
        print("Day 25 Network Data Layer Basics")

        loadSuccessCase()
        loadFailureCase()
    }

    private func loadSuccessCase() {
        print("\n[App] load success case")

        do {
            let articles = try successRepository.loadArticles()

            print("[App] loaded articles:")
            for article in articles {
                print("- \(article.summary)")
            }
        } catch NetworkError.serverError {
            print("[App] server error")
        } catch NetworkError.emptyResponse {
            print("[App] empty response")
        } catch {
            print("[App] unknown error: \(error)")
        }
    }

    private func loadFailureCase() {
        print("\n[App] load failure case")

        do {
            let articles = try failureRepository.loadArticles()

            print("[App] loaded articles:")
            for article in articles {
                print("- \(article.summary)")
            }
        } catch NetworkError.serverError {
            print("[App] server error")
        } catch NetworkError.emptyResponse {
            print("[App] empty response")
        } catch {
            print("[App] unknown error: \(error)")
        }
    }
}

/*
这里模拟两个场景：

成功加载文章
请求失败并进入错误处理
*/
