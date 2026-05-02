// The Swift Programming Language
// https://docs.swift.org/swift-book


/*
Day 25：网络与数据层概念

今天重点理解：页面里的数据通常不是凭空来的，而是从数据层 / 服务层获取。

Day 24 理解了：

Model -> Store -> List Page -> Detail Page -> User Action -> Store Update

Day 25 往前走一步：

调用方向：

App -> Repository -> APIService

数据返回方向：

APIService -> Repository -> App

App 通过 Repository 获取数据，Repository 再调用 APIService，APIService 模拟网络返回。
Article 是在这些层之间流动的数据模型。
*/
import Foundation

@main
struct Day25NetworkDataLayerBasics {
    static func main() {
        runDemo()
    }
}

func runDemo() {
    let successAPIService = ArticleAPIService()
    let failureAPIService = ArticleAPIService(shouldSimulateFailure: true)

    let successRepository = ArticleRepository(apiService: successAPIService)
    let failureRepository = ArticleRepository(apiService: failureAPIService)

    let simulator = AppSimulator(
        successRepository: successRepository,
        failureRepository: failureRepository
    )

    simulator.start()
}
