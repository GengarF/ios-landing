// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

@main
struct Day14ReviewAndRewrite {
    static func main() {
        exercise1()
        exercise2()
        exercise3()
        exercise4()
        exercise5()
        exercise6()
        exercise7()
        exercise8()
    }
}

/*练习 1：Optional 综合复盘
知识点提醒:guard let  ?.  ??

题目
定义：
struct Pet { var name: String }
struct User { var nickname: String?; var pet: Pet? }

再写一个函数：
func printUserInfo(_ user: User)

要求：
用 guard let 先解包 nickname
如果 nickname 是 nil，打印：
"nickname is nil"
然后返回
如果有值，继续打印：
nickname
pet 的名字
pet 的名字要用 ?. 和 ??
没有宠物时输出 "No Pet"

在 exercise1() 里测试：
一个有 nickname 和 pet 的用户
一个 nickname 为 nil 的用户
一个有 nickname 但没有 pet 的用户
*/
struct Pet {
    var name: String
}

struct User {
    var nickname: String?
    var pet: Pet?
}

func printUserInfo(_ user: User) {
    guard let nickname = user.nickname else {
        print("[exercise1] nickname is nil")
        return
    }

    let petName = user.pet?.name ?? "No Pet"
    print("[exercise1] nickname = \(nickname), pet = \(petName)")
}

func exercise1() {
    let user1 = User(nickname: "Gengar", pet: Pet(name: "Momo"))
    let user2 = User(nickname: nil, pet: Pet(name: "Kitty"))
    let user3 = User(nickname: "Fan", pet: nil)

    printUserInfo(user1)
    printUserInfo(user2)
    printUserInfo(user3)
}

/*练习 2：enum + switch 综合复盘
知识点提醒:
associated value enum
switch
模式匹配

题目
定义一个枚举：
enum LoginResult

包含：
success(username: String)
failure(reason: String)

再写一个函数：
func handleLoginResult(_ result: LoginResult)

要求：
如果成功，打印用户名
如果失败，打印失败原因

在 exercise2() 里测试两次：
一次成功
一次失败
*/
enum LoginResult {
    case success(username: String)
    case failure(reason: String)
}

func handleLoginResult(_ result: LoginResult) {
    switch result {
    case .success(let username):
        print("[exercise2] status = success, username = \(username)")
    case .failure(let reason):
        print("[exercise2] status = failure, reason = \(reason)")
    }
}

func exercise2() {
    let result1 = LoginResult.success(username: "Gengar")
    let result2 = LoginResult.failure(reason: "wrong password")

    handleLoginResult(result1)
    handleLoginResult(result2)
}

/*练习 3：值类型 / 引用类型 / inout 复盘
知识点提醒：
struct 值语义
class 引用语义
inout

题目
定义：
struct ScoreBoard
属性：score
方法：mutating func add(_ value: Int)

class Wallet
属性：balance
init(balance: Int)

再写一个函数：
func addBonus(_ value: inout Int)

要求给传入的整数加 50。

在 exercise3() 里：
创建一个 ScoreBoard
复制一份，再改副本
打印两个对象的 score
创建一个 Wallet
复制引用，再改副本
打印两个对象的 balance
再定义一个普通整数 number
用 addBonus(&number) 修改它

*/
struct ScoreBoard {
    var score: Int

    mutating func add(_ value: Int) {
        score += value
    }
}

class Wallet {
    var balance: Int

    init(balance: Int) {
        self.balance = balance
    }
}

func addBonus(to value: inout Int) {
    value += 50
}

func exercise3() {
    let originalBoard = ScoreBoard(score: 100)
    var copiedBoard = originalBoard
    copiedBoard.add(20)

    print("[exercise3] originalBoard.score = \(originalBoard.score)")
    print("[exercise3] copiedBoard.score = \(copiedBoard.score)")

    let sharedWallet = Wallet(balance: 500)
    let sameWalletReference = sharedWallet
    sameWalletReference.balance = 800

    print("[exercise3] sharedWallet.balance = \(sharedWallet.balance)")
    print("[exercise3] sameWalletReference.balance = \(sameWalletReference.balance)")

    var number = 10
    addBonus(to: &number)
    print("[exercise3] number = \(number)")
}

/*练习 4：protocol + extension + 默认实现复盘
知识点提醒:
protocol
protocol extension
默认实现
覆盖默认实现

题目
定义一个协议：
protocol Introducible

要求：
有一个属性 name
有一个方法 introduce()

再写 extension Introducible，给 introduce() 提供默认实现。

然后定义两个类型：

struct StudentProfile
遵守 Introducible
不自己实现 introduce()

struct TeacherProfile
遵守 Introducible
自己实现 introduce()

在 exercise4() 里测试两个对象。
*/
protocol Introducible {
    var name: String { get }
    func introduce()
}

extension Introducible {
    func introduce() {
        print("[exercise4] Hello, I am \(name)")
    }
}

struct StudentProfile: Introducible {
    var name: String
}

struct TeacherProfile: Introducible {
    var name: String

    func introduce() {
        print("[exercise4] Teacher \(name) is introducing")
    }
}

func exercise4() {
    let student = StudentProfile(name: "Gengar")
    let teacher = TeacherProfile(name: "Fan")

    student.introduce()
    teacher.introduce()
}

/*练习 5：init / init? 复盘
知识点提醒：
自定义 init
可失败初始化 init?

题目
定义一个结构体：
struct Product

包含：
name
price

要求：
写一个普通初始化器：
init(name: String, price: Double)

并把名字转成大写保存

再写一个可失败初始化器：
init?(discountedName: String, price: Double)

规则：
名字不能为空
价格必须大于 0
否则返回 nil

在 exercise5() 里测试：

普通初始化
合法的可失败初始化
非法的可失败初始化
*/
struct Product {
    var name: String
    var price: Double

    init(name: String, price: Double) {
        self.name = name.uppercased()
        self.price = price
    }

    init?(validatedName: String, price: Double) {
        guard !validatedName.isEmpty else {
            return nil
        }

        guard price > 0 else {
            return nil
        }

        self.name = validatedName.uppercased()
        self.price = price
    }
}

func exercise5() {
    let product1 = Product(name: "keyboard", price: 199)
    let product2 = Product(validatedName: "mouse", price: 99)
    let product3 = Product(validatedName: "", price: -10)

print("[exercise5] product1.name = \(product1.name), price = \(product1.price)")
print("[exercise5] product2 = \(product2?.name ?? "nil"), price = \(product2?.price.description ?? "nil")")
print("[exercise5] product3 = \(String(describing: product3))")

}

/*练习 6：错误处理 + 高阶函数复盘
知识点提醒:
throws
try?
compactMap
reduce

题目
定义：
enum NumberError: Error

包含：
emptyInput
invalidNumber

再写函数：
func parseNumber(_ text: String) throws -> Int

规则：
空字符串抛 emptyInput
不能转成整数抛 invalidNumber
否则返回整数

在 exercise6() 里：
定义数组：
["10", "", "abc", "30"]
先用 try? + compactMap 取出合法整数
再用 reduce 求和
打印原数组、合法整数数组、总和
*/
enum NumberError: Error {
    case emptyInput
    case invalidNumber
}

func parseNumber(_ text: String) throws -> Int {
    guard !text.isEmpty else {
        throw NumberError.emptyInput
    }

    guard let value = Int(text) else {
        throw NumberError.invalidNumber
    }

    return value
}

func exercise6() {
    let texts = ["10", "", "abc", "30"]

    for text in texts {
        do {
            let number = try parseNumber(text)
            print("[exercise6] parsed \(text) -> \(number)")
        } catch {
            print("[exercise6] failed to parse \(text): \(error)")
        }
    }

    let validNumbers = texts.compactMap { try? parseNumber($0) }
    let sum = validNumbers.reduce(0, +)

    print("[exercise6] texts = \(texts)")
    print("[exercise6] validNumbers = \(validNumbers)")
    print("[exercise6] sum = \(sum)")
}

/*练习 7：Optional + enum + switch 进阶组合
知识点提醒:
Optional
?.
??
enum associated value
switch

题目
定义：
struct Author
struct Article
enum PublishResult

要求：
Author 有属性：
name: String?

Article 有属性：
title: String
content: String
author: Author?

PublishResult 包含：
success(summary: String)
failure(reason: String)

再写一个函数：
func publishArticle(_ article: Article) -> PublishResult

规则：
如果 title 为空，返回 failure，并说明原因
如果 content 少于 10 个字符，返回 failure，并说明原因
如果 author 不存在，或者 author.name 是 nil，
发布时作者名使用 "Anonymous"
如果成功，返回 success，
summary 至少包含 title 和 author name

在 exercise7() 里至少测试 3 次：
一个正常发布的文章
一个 title 为空的文章
一个没有 author 但仍然可以发布的文章

提示：
先区分“必须失败”的条件和“可以给默认值继续执行”的条件。
author?.name ?? "Anonymous" 会很有用。
最后可以用 switch 处理 PublishResult 并打印结果。
*/
struct Author { var name: String? }

struct Article {
    var title: String
    var content: String
    var author: Author?
}

enum PublishResult {
    case success(summary: String)
    case failure(reason: String)
}

func publishArticle(_ article: Article) -> PublishResult {
    guard !article.title.isEmpty else {
        return .failure(reason: "title is empty")
    }

    guard article.content.count >= 10 else {
        return .failure(reason: "content is too short")
    }

    let authorName = article.author?.name ?? "Anonymous"
    return .success(summary: "title: \(article.title), author: \(authorName)")
}

func exercise7() {
    let result1 = publishArticle(
        Article(
            title: "The Great Wall",
            content: "This is great.",
            author: Author(name: "Gengar")
        )
    )

    let result2 = publishArticle(
        Article(
            title: "",
            content: "This is valid content.",
            author: Author(name: "Jeff")
        )
    )

    let result3 = publishArticle(
        Article(
            title: "Love is forever",
            content: "Long enough text.",
            author: nil
        )
    )

    for result in [result1, result2, result3] {
        switch result {
        case .success(let summary):
            print("[exercise7] success: \(summary)")
        case .failure(let reason):
            print("[exercise7] failure: \(reason)")
        }
    }
}



/*练习 8：protocol + init + error handling + 高阶函数进阶组合
知识点提醒:
protocol
throws
try?
init? / init
compactMap
reduce

题目
定义：
protocol Validatable
struct OrderItem
enum InputError: Error

要求：
Validatable 里有方法：
func validate() throws

OrderItem 有属性：
name: String
price: Double
quantity: Int

OrderItem 要遵守 Validatable

InputError 至少包含：
emptyName
invalidPrice
invalidQuantity

你可以选择下面两种方案之一：
给 OrderItem 写普通 init + validate()
或者写可失败初始化器 init?
或者写会抛错的初始化器 init(...)

在 exercise8() 里准备一组原始输入数据，
例如元组数组，或者字符串数组转换后的数据。
原始数据里要同时包含合法项和非法项。

要求：
把原始输入转换成 OrderItem
过滤掉不合法的项
最后计算所有合法商品的总价
总价规则：
price * quantity

最后打印：
合法商品数组
总价

提示：
这题重点是想清楚“初始化”和“校验”分别负责什么。
如果你想保留更具体的错误原因，throws 往往比 init? 更合适。
可以尝试配合 try?、compactMap、reduce 一起完成数据清洗和汇总。
*/
protocol Validatable {
    func validate() throws
}

struct OrderItem: Validatable {
    var name: String
    var price: Double
    var quantity: Int

    init(name: String, price: Double, quantity: Int) {
        self.name = name
        self.price = price
        self.quantity = quantity
    }

    func validate() throws {
        guard !name.isEmpty else {
            throw InputError.emptyName
        }

        guard price > 0 else {
            throw InputError.invalidPrice
        }

        guard quantity > 0 else {
            throw InputError.invalidQuantity
        }
    }
}

func makeOrderItem(name: String, price: Double, quantity: Int) throws -> OrderItem {
    let item = OrderItem(name: name, price: price, quantity: quantity)
    try item.validate()
    return item
}

enum InputError: Error {
    case emptyName
    case invalidPrice
    case invalidQuantity
}


func exercise8() {
    let rawItems = [
        ("Keyboard", 199.0, 2),
        ("", 99.0, 1),
        ("Mouse", -10.0, 3),
        ("Monitor", 899.0, 0),
        ("USB-C Cable", 59.0, 4)
    ]

    let validItems = rawItems.compactMap { name, price, quantity in
        try? makeOrderItem(name: name, price: price, quantity: quantity)
    }

    let total = validItems.reduce(0.0) { partialResult, item in
        partialResult + item.price * Double(item.quantity)
    }

    print("[exercise8] validItems = \(validItems)")
    print("[exercise8] total = \(total)")
}