import Testing
@testable import Day25NetworkDataLayerBasics

@Test func apiServiceReturnsArticlesWhenRequestSucceeds() throws {
    let apiService = ArticleAPIService()

    let articles = try apiService.fetchArticles()

    #expect(articles.count == 3)
    #expect(articles.first?.summary == "1. Swift Networking")
}

@Test func apiServiceThrowsServerErrorWhenSimulatedFailureIsEnabled() {
    let apiService = ArticleAPIService(shouldSimulateFailure: true)

    do {
        _ = try apiService.fetchArticles()
        Issue.record("Expected serverError to be thrown")
    } catch NetworkError.serverError {
        return
    } catch {
        Issue.record("Unexpected error: \(error)")
    }
}

@Test func repositoryLoadsArticlesThroughAPIServiceProtocol() throws {
    let apiService = ArticleAPIService()
    let repository = ArticleRepository(apiService: apiService)

    let articles = try repository.loadArticles()

    #expect(articles.map(\.id) == [1, 2, 3])
}
