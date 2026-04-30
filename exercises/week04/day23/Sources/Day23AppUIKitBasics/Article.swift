import Foundation

struct Article {
    var id: Int
    var title: String
    var content: String
}

/*
Model 是页面使用的数据。

比如今天的：

struct Article

就是首页和详情页共享的数据模型。
*/