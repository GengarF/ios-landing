// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

@main
struct Day16FileSplittingAndModules {
    static func main() {
        exercise1()
        exercise2()
        exercise3()
        exercise4()
        exercise5()
        exercise6()
    }
}

func exercise1() {
    let user = User(name: "Gengar", age: 26)
    print("[exercise1] name = \(user.name), age = \(user.age)")
}

func exercise2() {
    let article = Article(title: "Swift File Splitting", author: "Gengar")
    print("[exercise2] title = \(article.title), author = \(article.author)")
}

func exercise3() {
    let store = ArticleStore()
    store.add(Article(title: "Swift Basics", author: "A"))
    store.add(Article(title: "File Organization", author: "B"))

    print("[exercise3] titles = \(store.listTitles())")
}

func exercise4() {
    let formatted = formatTitle("Swift Modules")
    print("[exercise4] \(formatted)")
}

//练习 5：主文件只负责“组装流程”：主文件不再写一堆类型定义，只负责把外部类型组装起来运行。
func exercise5() {
    let user = User(name: "Fan", age: 26)
    let article = Article(title: "Swift Practice", author: user.name)
    let formatted = formatTitle(article.title)

    print("[exercise5] \(user.name) wrote \(formatted)")
}

//一个小模块的最小雏形就是：模型 + store + helper + main 流程。
func exercise6() {
    let store = ArticleStore()
    store.add(Article(title: "Day16 Intro", author: "Gengar"))
    store.add(Article(title: "Small Modules", author: "Fan"))

    let formattedTitles = store.listTitles().map { formatTitle($0) }
    print("[exercise6] formattedTitles = \(formattedTitles)")
}