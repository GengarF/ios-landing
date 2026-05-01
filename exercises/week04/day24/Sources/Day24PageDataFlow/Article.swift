import Foundation

struct Article {
    let id: Int
    let title: String
    let content: String
    var likes: Int
    var isFavorite: Bool

    var summary: String {
        "\(title) - likes: \(likes), favorite: \(isFavorite)"
    }
}

/*
这里注意：

id、title、content 用 let，表示文章基础信息不随便改。
likes、isFavorite 用 var，表示用户操作后会变。
summary 是计算属性，用于展示。

这就是页面数据流里很常见的模型设计：

一部分数据稳定，一部分状态会变化。
*/