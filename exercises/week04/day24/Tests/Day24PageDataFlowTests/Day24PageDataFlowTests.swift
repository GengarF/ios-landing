import Testing
@testable import Day24PageDataFlow

@Test func articleStoreUpdatesArticleStateByID() {
    let store = ArticleStore(
        articles: [
            Article(
                id: 1,
                title: "Swift Data Flow",
                content: "Understand how data moves between pages.",
                likes: 10,
                isFavorite: false
            )
        ]
    )

    store.likeArticle(id: 1)
    store.toggleFavorite(id: 1)

    let article = store.article(id: 1)

    #expect(article?.likes == 11)
    #expect(article?.isFavorite == true)
}

@Test func articleReturnedFromStoreIsASnapshotValue() {
    let store = ArticleStore(
        articles: [
            Article(
                id: 1,
                title: "Swift Data Flow",
                content: "Understand how data moves between pages.",
                likes: 10,
                isFavorite: false
            )
        ]
    )

    let snapshot = store.article(id: 1)

    store.likeArticle(id: 1)
    store.toggleFavorite(id: 1)

    let latestArticle = store.article(id: 1)

    #expect(snapshot?.likes == 10)
    #expect(snapshot?.isFavorite == false)
    #expect(latestArticle?.likes == 11)
    #expect(latestArticle?.isFavorite == true)
}
