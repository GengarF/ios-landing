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
        print("[exercise2] login success: \(username)")
    case .failure(let reason):
        print("[exercise2] login failed: \(reason)")
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

func addBonus(_ value: inout Int) {
    value += 50
}

func exercise3() {
    var board1 = ScoreBoard(score: 100)
    var board2 = board1
    board2.add(20)

    print("[exercise3] board1.score = \(board1.score)")
    print("[exercise3] board2.score = \(board2.score)")

    let wallet1 = Wallet(balance: 500)
    let wallet2 = wallet1
    wallet2.balance = 800

    print("[exercise3] wallet1.balance = \(wallet1.balance)")
    print("[exercise3] wallet2.balance = \(wallet2.balance)")

    var number = 10
    addBonus(&number)
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

    init?(discountedName: String, price: Double) {
        guard !discountedName.isEmpty else {
            return nil
        }

        guard price > 0 else {
            return nil
        }

        self.name = discountedName.uppercased()
        self.price = price
    }
}

func exercise5() {
    let product1 = Product(name: "keyboard", price: 199)
    let product2 = Product(discountedName: "mouse", price: 99)
    let product3 = Product(discountedName: "", price: -10)

    print("[exercise5] product1 = \(product1)")
    print("[exercise5] product2 = \(String(describing: product2))")
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

    let validNumbers = texts.compactMap { try? parseNumber($0) }
    let sum = validNumbers.reduce(0, +)

    print("[exercise6] texts = \(texts)")
    print("[exercise6] validNumbers = \(validNumbers)")
    print("[exercise6] sum = \(sum)")
}
