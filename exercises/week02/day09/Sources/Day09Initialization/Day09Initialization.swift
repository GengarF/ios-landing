// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

@main
struct Day09Initialization {
    static func main() {
        exercise1()
        exercise2()
        exercise3()
        exercise4()
        exercise5()
        exercise6()
    }
}

//第一部分：struct 的初始化
/*知识点 1：成员初始化（memberwise init）
如果一个 struct 只有存储属性，Swift 通常会自动给你一个“按属性逐个传值”的初始化器。

练习1：成员初始化
定义一个 struct Student，包含：
name
score
在 exercise1() 里：
用成员初始化创建一个对象
打印它的名字和分数
*/
struct Student {
    var name: String
    var score: Int
}

func exercise1() {
    let student = Student(name: "Gengar", score: 95)
    print("[exercise1] name = \(student.name), score = \(student.score)")
}

/*知识点 2：自定义 init
如果你不想按“原样传属性”初始化，而是想在初始化时做点处理，就可以写自己的 init

练习2：自定义初始化时做处理
定义一个 struct Account，包含：
owner
要求写一个自定义 init(owner: String)：
把传入名字转成大写再保存
在 exercise2() 里创建一个对象并打印 owner
*/
struct Account {
    var owner: String

    init(owner: String) {
        self.owner = owner.uppercased()
    }
}

func exercise2() {
    let account = Account(owner: "gengar")
    print("[exercise2] owner = \(account.owner)")
}

//第二部分：默认值和 init()
/*知识点 3：有默认值时，初始化会更轻松
如果属性已经有默认值，你就不一定要每次都手动传

练习 3：默认值 + 空初始化
定义一个 struct TodoItem，包含：

title 默认值 "Untitled"
isDone 默认值 false

在 exercise3() 里：

直接用 TodoItem() 创建对象
打印它的两个属性
*/
struct TodoItem {
    var title: String = "Untitled"
    var isDone: Bool = false
}

func exercise3() {
    let item = TodoItem()
    print("[exercise3] title = \(item.title), isDone = \(item.isDone)")
}

//第三部分：class 的初始化
/*知识点 4：class 初始化时，所有存储属性都要被初始化

练习 4：class 初始化
定义一个 class Book，包含：
title
pages
写一个 init(title: String, pages: Int)。

在 exercise4() 里创建对象并打印属性。
*/
class Book {
    var title: String
    var pages: Int

    init(title: String, pages: Int) {
        self.title = title
        self.pages = pages
    }
}

func exercise4() {
    let book = Book(title: "Swift Basics", pages: 300)
    print("[exercise4] title = \(book.title), pages = \(book.pages)")
}

//第四部分：可失败初始化 init?
/*知识点 5：有些初始化可能失败，所以用 init?
可以先理解成：如果传进来的数据不合法，这个对象根本不该被创建。

练习 5：写一个可失败初始化器
定义一个 struct Score，包含：
value

要求写：
init?(value: Int)

规则：
只有 0...100 之间的值才允许创建
否则返回 nil

在 exercise5() 里：
尝试创建 80
尝试创建 150
打印结果
*/
struct Score {
    var value: Int

    init?(value: Int) {
        guard (0...100).contains(value) else {
            return nil
        }
        self.value = value
    }
}

func exercise5() {
    let score1 = Score(value: 80)
    let score2 = Score(value: 150)

    print("[exercise5] score1 = \(String(describing: score1))")
    print("[exercise5] score2 = \(String(describing: score2))")
}

//第五部分：在 extension 里补充初始化器
/*知识点 6：有时可以在 extension 里补一个更方便的初始化器,复用已有初始化器，而不是重新手写一遍所有赋值。

练习 6：在 extension 里加一个初始化器
定义一个 struct Size，包含：
width
height

然后在 extension Size 里补充：
init(square: Double)

要求：
让正方形的宽高都等于 square

在 exercise6() 里：
用普通初始化创建一个矩形
用 square: 初始化创建一个正方形
打印它们的宽高
*/
struct Size {
    var width: Double
    var height: Double
}

extension Size {
    init(square: Double) {
        self.init(width: square, height: square)
    }
}

func exercise6() {
    let rect = Size(width: 3, height: 5)
    let square = Size(square: 4)

    print("[exercise6] rect = (\(rect.width), \(rect.height))")
    print("[exercise6] square = (\(square.width), \(square.height))")
}