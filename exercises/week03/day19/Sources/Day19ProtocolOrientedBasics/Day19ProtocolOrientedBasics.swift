// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

@main
struct Day19ProtocolOrientedBasics {
    static func main() {
        exercise1()
        exercise2()
        exercise3()
        exercise4()
        exercise5()
        exercise6()
    }
}

/*
protocol 描述的是“能做什么”，而不是“是什么”。

比如：

用户和老师都能 introduce()
视频和文章都能 displayTitle()
本地文件和网络资源都能 load()

这里关心的不是它们是不是同一类对象，而是它们有没有共同能力。
*/

//第一部分：最基础的 protocol
/*知识点 1：protocol 可以约束“必须有什么属性、方法”

练习 1：定义一个最基础的协议
题目:定义一个 protocol：

protocol Introducible

要求：

有一个属性 name
有一个方法 introduce()

然后定义一个 struct User，遵守这个协议。
在 exercise1() 里创建对象并调用 introduce()。
*/
protocol Introducible {
    var name: String { get }
    func introduce()
}

struct User: Introducible {
    var name: String

    func introduce() {
        print("[exercise1] Hi, I am \(name)")
    }
}

func exercise1() {
    let user = User(name: "Gengar")
    user.introduce()
}

//第二部分：不同类型也可以遵守同一个 protocol
/*知识点 2：共享的是“能力”，不是“身份”

一个 Student 和一个 Teacher 当然不是同一种对象，
但它们都可以“自我介绍”,这就是 protocol 的价值。

练习 2：两个不同类型共享同一个协议
题目:继续使用 Introducible。
定义两个类型：

struct Student
struct Teacher

它们都遵守 Introducible，但 introduce() 输出不同内容。

在 exercise2() 里分别测试它们。
*/
struct Student: Introducible {
    var name: String

    func introduce() {
        print("[exercise2] Student \(name) is introducing")
    }
}

struct Teacher: Introducible {
    var name: String

    func introduce() {
        print("[exercise2] Teacher \(name) is introducing")
    }
}

func exercise2() {
    let student = Student(name: "Fan")
    let teacher = Teacher(name: "Jeff")

    student.introduce()
    teacher.introduce()
}

//第三部分：protocol 作为参数
/*知识点 3：函数可以接收“任何遵守某协议的类型”
你不一定非要写：
参数是 Student
参数是 Teacher

你也可以写：
参数是“任何 Introducible”
如：
func greet(_ person: Introducible) {
    person.introduce()
}

练习 3：写一个接收 protocol 的函数
题目：写一个函数：

func greet(_ person: Introducible)

要求：
打印一行欢迎语
再调用 introduce()

在 exercise3() 里：

传入一个 Student
再传入一个 Teacher
*/
func greet(_ person: Introducible) {
    print("[exercise3] Welcome")
    person.introduce()
}

func exercise3() {
    let student = Student(name: "Momo")
    let teacher = Teacher(name: "Alice")

    greet(student)
    greet(teacher)
}

//第四部分：protocol 约束属性，不只是约束方法
/*知识点 4：协议也可以只强调“必须有某个数据”
比如你不关心对象具体是谁，只关心它有没有 title。

练习 4：让不同内容类型共享 title
题目:定义一个协议：
protocol Titled

要求：有 title

再定义两个类型：
struct ArticleItem
struct VideoItem
都遵守 Titled。

写一个函数：
func printTitle(_ item: Titled)

要求打印标题。
在 exercise4() 里测试两个对象。

*/
protocol Titled {
    var title: String { get }
}

struct ArticleItem: Titled {
    var title: String
}

struct VideoItem: Titled {
    var title: String
}

func printTitle(_ item: Titled) {
    print("[exercise4] title = \(item.title)")
}

func exercise4() {
    let article = ArticleItem(title: "Swift Protocols")
    let video = VideoItem(title: "Swift Video Intro")

    printTitle(article)
    printTitle(video)
}

//第五部分：protocol + extension 默认实现
/*知识点 5：如果很多类型的默认行为一样，可以在协议扩展里给默认实现

练习 5：给协议提供默认展示行为
题目:定义一个协议：
protocol Displayable

要求：
有 title
有 display()

然后写 extension Displayable，给 display() 默认实现。

再定义一个 struct NoteItem，遵守这个协议但不自己实现 display()。

在 exercise5() 里创建对象并调用 display()。
*/
protocol Displayable {
    var title: String { get }
    func display()
}

extension Displayable {
    func display() {
        print("[exercise5] display title = \(title)")
    }
}

struct NoteItem: Displayable {
    var title: String
}

func exercise5() {
    let note = NoteItem(title: "Protocol Extension Default Display")
    note.display()
}

//第六部分：做一个小综合——协议统一不同资源的加载行为
/*知识点 6：最后一题要感受“同一能力，不同实现”
比如：
本地资源能加载
网络资源也能加载

它们底层不一样，但对外都可以表现成 load()。
这就是 protocol 很适合做的事。

题目:定义一个协议：
protocol Loadable

要求：
有一个属性 source
有一个方法 load()

然后定义两个类型：
struct LocalFile
struct RemoteFile

都遵守 Loadable，但 load() 输出不同。

再写一个函数：
func startLoading(_ item: Loadable)

要求：
先打印开始信息
再调用 load()

在 exercise6() 里分别测试两个对象。
*/
protocol Loadable {
    var source: String { get }
    func load()
}

struct LocalFile: Loadable {
    var source: String

    func load() {
        print("[exercise6] loading local file from \(source)")
    }
}

struct RemoteFile: Loadable {
    var source: String

    func load() {
        print("[exercise6] loading remote file from \(source)")
    }
}

func startLoading(_ item: Loadable) {
    print("[exercise6] start loading")
    item.load()
}

func exercise6() {
    let local = LocalFile(source: "/tmp/data.json")
    let remote = RemoteFile(source: "https://example.com/data.json")

    startLoading(local)
    startLoading(remote)
}
