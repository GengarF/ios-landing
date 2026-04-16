// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

@main
struct Day07ValueReferenceInoutStatic {
    static func main() {
        exercise1()
        exercise2()
        exercise3()
        exercise4()
        exercise5()
        exercise6()
    }
}

/*第一部分：Value Type vs Reference Type
struct 是值类型：struct 赋值给另一个变量时，会复制一份。
class 是引用类型: class 赋值给另一个变量时，不会复制对象本体，而是两个变量指向同一个对象。
*/
/*练习1：验证 struct 的复制行为
定义一个 struct Player，包含：

name
score

在 exercise1() 里：

创建 player1
令 player2 = player1
修改 player2.score
打印 player1.score 和 player2.score

观察它们是不是独立的。
*/
struct Player {
    var name: String
    var score: Int
}

func exercise1() {
    let player1 = Player(name: "Gengar", score: 100)
    var player2 = player1
    player2.score = 99
    print("[exercise1] player1.score: \(player1.score)")
    print("[exercise1] player2.score: \(player2.score)")
}

/*练习2：验证 class 的引用行为
定义一个 class BankCard，包含：

number
balance

在 exercise2() 里：

创建 card1
令 card2 = card1
修改 card2.balance
打印 card1.balance 和 card2.balance

观察两者是否一起变化。
*/
class BankCard {
    var number: String
    var balance: Int

    init(number: String, balance: Int) {
        self.number = number
        self.balance = balance
    }
}

func exercise2() {
    let card1 = BankCard(number: "1234", balance: 1000)
    let card2 = card1
    card2.balance = 2000

    print("[exercise2] card1.balance: \(card1.balance)")
    print("[exercise2] card2.balance: \(card2.balance)")
}

/*第二部分：inout:如果想让函数直接改调用者传进来的变量，就要写 inout。
函数参数写 inout
调用时参数前面要加 &

inout 可以拿来交换两个值
*/
/*练习3：用 inout 让分数加 10
写一个函数：

func addTen(_ score: inout Int)

要求：

把传入的分数加 10

在 exercise3() 里：

定义一个 score = 90
调用 addTen(&score)
打印结果
*/
func addTen(_ score: inout Int) {
    score += 10
}

func exercise3() {
    var num = 10
    print("[exercise3] original num: \(num)")
    addTen(&num)
    print("[exercise3] after addTen: num = \(num)")
}

/*练习4：用 inout 交换两个整数
写一个函数：

func swapValues(_ a: inout Int, _ b: inout Int)

在 exercise4() 里：

定义 x = 3
定义 y = 7
调用交换
打印交换前后
*/
func swapValues(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

func exercise4() {
    var x = 3
    var y = 7

    print("[exercise4] before swap: x = \(x), y = \(y)")
    swapValues(&x, &y)
    print("[exercise4] after swap: x = \(x), y = \(y)")
}


/*第三部分：static: 这个属性属于“类型本身”，而不属于某个具体实例。
Swift static 方法 ≈ C++ 静态成员函数
*/
/*练习5：定义一个 static 属性
定义一个 struct AppConfig，要求：

有一个 static 属性：
appName = "SwiftStarter"

在 exercise5() 里直接通过类型打印它。
*/
struct AppConfig {
    static let appName = "SwiftStarter"
}

func exercise5() {
    print("[exercise5] appName = \(AppConfig.appName)")
}

/*练习6：定义一个 static 方法
定义一个 struct MathTool，要求：

写一个 static func square(_ x: Int) -> Int

在 exercise6() 里：

调用 MathTool.square(6)
打印结果
*/
struct MathTool {
    static func square(_ x: Int) -> Int {
        x * x
    }
}

func exercise6() {
    let result = MathTool.square(6)
    print("[exercise6] square(6) = \(result)")
}
