/*
练习 3：把“管理逻辑”也拆出去
知识点提醒：模型和管理器最好分开。

例子
Article：数据
ArticleStore：存储和操作这些数据

这就已经很像真实工程里的分层雏形了
*/

import Foundation

class ArticleStore {
    private var articles: [Article] = []

    func add(_ article: Article) {
        articles.append(article)
    }

    func listTitles() -> [String] {
        articles.map { $0.title }
    }
}