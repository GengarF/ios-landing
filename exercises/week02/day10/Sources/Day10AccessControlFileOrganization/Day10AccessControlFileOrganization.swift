// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

@main
struct Day10AccessControlFileOrganization {
    static func main() {
        exercise1()
        exercise2()
        exercise3()
        exercise4()
        exercise5()
        exercise6()
    }
}

/*第一部分：访问控制整体直觉
1.private:最小范围
通常表示：这个东西只想在当前类型/当前作用域内部用。

2. fileprivate:文件内可见
通常表示：这个东西不想暴露到整个模块，只想在这个 Swift 文件里共享。

3. internal:默认级别
通常表示：这个东西在当前模块里都能用。

4. public:对模块外公开
通常表示：这个东西是我要暴露出去的 API。
*/

/*练习 1：private 属性
知识点:最常见场景：把某个内部细节藏起来，只给外界提供方法访问。

题目
定义一个 struct PasswordBox，要求：
有一个 private 属性 password
写一个 init(password: String)

写一个方法：
func verify(_ input: String) -> Bool
用来检查输入是否等于密码

在 exercise1() 里：
创建一个对象
测试一次正确密码
测试一次错误密码
*/
struct PasswordBox {
    private var password: String

    init(password: String) {
        self.password = password
    }

    func verify(_ input: String) -> Bool {
        input == password
    }
}

func exercise1() {
    let box = PasswordBox(password: "123456")
    print("[exercise1] correct = \(box.verify("123456"))")
    print("[exercise1] wrong = \(box.verify("000000"))")
}

//第二部分：private(set):外部可以读这个属性，但不能直接改；只有类型内部自己能改。
/*练习2：定义一个 struct StepCounter
要求：
有一个属性：
private(set) var totalSteps: Int = 0

写一个方法：
mutating func addSteps(_ count: Int)

把步数累加进去

在 exercise2() 里：
创建对象
调用两次 addSteps
打印 totalSteps
*/
struct StepCounter {
    private(set) var totalSteps: Int = 0

    mutating func addSteps(_ count: Int) {
        totalSteps += count
    }
}

func exercise2() {
    var counter = StepCounter()
    counter.addSteps(1000)
    counter.addSteps(2500)

    print("[exercise2] totalSteps = \(counter.totalSteps)")
}

//第三部分：internal（默认访问级别）Swift 默认就是 internal
/*练习3：定义一个 struct Note，
包含：
title
content

不要写任何访问控制关键字。
在 exercise3() 里创建对象并打印内容。

*/
struct Note {
    var title: String
    var content: String
}

func exercise3() {
    let note = Note(title: "Swift", content: "Access control basics")
    print("[exercise3] title = \(note.title), content = \(note.content)")
}

//第四部分：public：这个东西是我愿意给模块外部使用的。
/*练习4：定义一个：
public struct PublicGreeter

要求：
有一个 public var name
有一个 public init(name: String)
有一个 public func greet()

在 exercise4() 里创建对象并调用 greet()。

*/
public struct PublicGreeter {
    public var name: String

    public init(name: String) {
        self.name = name
    }

    public func greet() {
        print("Hello, \(name)")
    }
}

func exercise4() {
    let greeter = PublicGreeter(name: "Gengar")
    greeter.greet()
}

/*第五部分：fileprivate
这个东西不想给整个模块用，但希望当前这个 Swift 文件里的多个类型都能共享。

这在真实项目里常见于：
文件内共享的 helper
日志格式化函数
文件内辅助常量
*/
/*练习5：写一个：
fileprivate func formatLog(_ message: String) -> String

要求：
返回形如 "[LOG] xxx" 的字符串
然后定义一个 struct Logger，有一个方法：
func log(_ message: String)
它内部调用 formatLog(_:) 并打印结果。

在 exercise5() 里调用它。

*/
fileprivate func formatLog(_ message: String) -> String {
    "[LOG] \(message)"
}

struct Logger {
    func log(_ message: String) {
        print(formatLog(message))
    }
}

func exercise5() {
    let logger = Logger()
    logger.log("day10 started")
}

/*第六部分：访问控制 + 文件组织思路
一个类型只暴露必要的 API，把内部存储藏起来，这就是文件组织和封装的开始。

比如一个存储器：
内部数组不想暴露
外部只能通过方法添加和读取
*/
/*练习6：定义：
struct Article
包含：title

class ArticleStore
包含：
一个 private 的数组 articles
一个方法：func add(_ article: Article)
一个方法：func listTitles() -> [String]

在 exercise6() 里：
创建 ArticleStore
加两篇文章
打印标题列表
*/
struct Article {
    var title: String
}

class ArticleStore {
    private var articles: [Article] = []

    func add(_ article: Article) {
        articles.append(article)
    }

    func listTitles() -> [String] {
        articles.map{$0.title}
    }
}

func exercise6() {
    let store = ArticleStore()
    store.add(Article(title: "Swift Access Control"))
    store.add(Article(title: "File Organization"))

    print("[exercise6] titles = \(store.listTitles())")
}
