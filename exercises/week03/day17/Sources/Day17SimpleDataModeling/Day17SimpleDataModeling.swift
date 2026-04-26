// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

@main
struct Day17SimpleDataModeling {
    static func main() {
        exercise1()
        exercise2()
        exercise3()
        exercise4()
        exercise5()
        exercise6()
    }
}

//第一部分：最基础的数据模型
/*知识点 1：先把“一个对象”表达清楚
练习 1：定义一个视频模型
*/
struct Video {
    var title: String
    var duration: Int
    var isPublished: Bool
}

func exercise1() {
    let video = Video(title: "Swift Intro", duration: 300, isPublished: true)
    print("[exercise1] title = \(video.title), duration = \(video.duration), isPublished = \(video.isPublished)")
}

//第二部分：避免把数字和状态都写成字符串
/*知识点 2：字段类型要尽量贴近真实含义
比如：
点赞数应该是 Int
价格应该是 Double
是否在线应该是 Bool

练习 2：定义一个用户资料模型
*/
struct UserProfile {
    var name: String
    var age: Int
    var isOnline: Bool
}

func exercise2() {
    let user = UserProfile(name: "Gengar", age: 26, isOnline: true)
    print("[exercise2] name = \(user.name), age = \(user.age), isOnline = \(user.isOnline)")
}

//第三部分：模型嵌套模型
/*知识点 3：真实业务数据常常不是平铺的
比如文章不只是：标题、作者名字字符串
而是作者本身也可以是一个模型。

练习 3：定义作者和文章模型
*/
struct Author {
    var name: String
    var level: Int
}

struct Article {
    var title: String
    var author: Author
}

func exercise3() {
    let author = Author(name: "Fan", level: 3)
    let article = Article(title: "Swift Modeling", author: author)

    print("[exercise3] title = \(article.title), author = \(article.author.name)")
}

//第四部分：数组属性也是模型设计的一部分
/*知识点 4：一个模型可以包含多个子项,模型不是只放单个值，也可以放集合。
比如视频下有多个标签,或者订单里有多个商品。

练习 4：给模型加数组属性
*/
struct Course {
    var name: String
    var tags: [String]
}

func exercise4() {
    let course = Course(name: "iOS Landing", tags: ["swift", "ios", "practice"])
    print("[exercise4] name = \(course.name), tags = \(course.tags)")
}

//第五部分：给模型补一点“展示友好性”
/*知识点 5：模型可以有计算属性，帮助展示
模型不一定只放裸数据，也可以放一点轻量展示逻辑。

练习 5：给模型加一个 summary
*/
struct VideoStats {
    var views: Int
    var likes: Int

    var summary: String {
        "views = \(views), likes = \(likes)"
    }
}

func exercise5() {
    let stats = VideoStats(views: 1200, likes: 320)
    print("[exercise5] \(stats.summary)")
}

//第六部分：组合成一个更像业务的数据模型
/*知识点 6：最后把多个小模型拼成一个大一点的模型
这一步最像真实业务代码。
比如一个视频详情页的数据，可以包含：
视频标题
作者信息
标签
统计信息

练习 6：设计一个视频详情模型
*/
struct VideoDetail {
    var title: String
    var author: Author
    var tags: [String]
    var stats: VideoStats
}

func exercise6() {
    let author = Author(name: "Gengar", level: 5)
    let stats = VideoStats(views: 5000, likes: 860)

    let detail = VideoDetail(
        title: "Swift Data Modeling",
        author: author,
        tags: ["swift", "model", "ios"],
        stats: stats
    )

    print("[exercise6] title = \(detail.title)")
    print("[exercise6] author = \(detail.author.name)")
    print("[exercise6] tags = \(detail.tags)")
    print("[exercise6] stats = \(detail.stats.summary)")
}
