// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

@main
struct Day05PropertyObserverComputedExtension {
    static func main() {
        exercise1()
        exercise2()
        exercise3()
        exercise4()
        exercise5()
        exercise6()
    }
}

/*练习1：计算属性
存储属性 = 真正存数据
计算属性 = 不直接存数据，而是现算出来

题目：矩形面积
定义一个 struct Rectangle，要求：
存储属性：
width
height
计算属性：
area

在 exercise1() 里：
创建一个矩形
打印宽、高、面积
*/
struct Rectangle {
    var width: Double
    var height: Double

    var area: Double {
        width * height
    }
}

func exercise1() {
    let rectangle = Rectangle(width: 5.2, height: 6.6)
    print("[exercise1] width: \(rectangle.width), height: \(rectangle.height), area: \(rectangle.area)")
}

/*练习2：带 setter 的计算属性
题目: 定义一个 struct Temperature，
要求：
存储属性：
celsius
计算属性：
fahrenheit
get：根据摄氏度算华氏度
set：根据新的华氏度反推摄氏度

在 exercise2() 里：
创建一个 Temperature
打印当前摄氏度和华氏度
再把 fahrenheit 设成 212
再打印一次 celsius
*/
struct Temperature {
    var celsius: Double

    var fahrenheit: Double {
        get {
            celsius * 9 / 5 + 32
        }
        set {
            celsius = (newValue - 32) * 5 / 9
        }
    }
}

func exercise2() {
    var temperature = Temperature(celsius: 22)
    print("[exercise2] before change: celsius = \(temperature.celsius), fahrenheit = \(temperature.fahrenheit)")
    temperature.fahrenheit = 212
    print("[exercise2] after setting fahrenheit to 212: celsius = \(temperature.celsius), fahrenheit = \(temperature.fahrenheit)")

}

/*练习3：属性观察器：willSet 和 didSet
题目：分数变化提醒
定义一个 struct GameScore，要求：

存储属性：
score
给 score 加 didSet
每次分数变化时打印：
旧值
新值

在 exercise3() 里：

创建一个对象
把 score 从 0 改到 10，再改到 20
*/
struct GameScore {
    var score: Int = 0 {
        didSet {
            print("[exercise3] didSet: oldValue = \(oldValue), newValue = \(score)")
        }
    }

}

func exercise3() {
    var game = GameScore()
    game.score = 10
    game.score = 20
}

/*练习4：willSet + didSet 一起用
题目：账户余额观察器
定义一个 struct Wallet，要求：

属性：
balance
给它加：
willSet
didSet

在 exercise4() 里：

创建一个 Wallet
修改两次 balance
观察输出
*/
struct Wallet {
    var balance: Int = 0 {
        willSet {
            print("[exercise4] willSet: balance will change to \(newValue)")
        }
        didSet {
            print("[exercise4] didSet: balance changed from \(oldValue) to \(balance)")
        }
    }
}

func exercise4() {
    var wallet = Wallet()
    wallet.balance = 100
    wallet.balance = 200
}

/*练习5：extension: 给一个已有类型“追加功能”，但不改它原本定义的位置。
题目：给 Int 加扩展
给 Int 写一个 extension，要求：

计算属性：
squared
计算属性：
isEven

在 exercise5() 里：

定义一个整数
打印它的平方
打印它是不是偶数
*/
extension Int {
    var squared: Int {
        self * self
    }

    var isEven: Bool {
        self % 2 == 0
    }
}

func exercise5() {
    let number = 5
    print("[exercise5] number: \(number)")
    print("[exercise5] number.squared = \(number.squared)")
    print("[exercise5] number.isEven = \(number.isEven)")
}

/*练习6：
给 String 写一个 extension，要求：

方法：
shout() -> String
返回值规则：
全部大写
末尾加 !

在 exercise6() 里：

定义一个字符串
调用 shout()
打印结果
*/
extension String {
    func shout() -> String {
        self.uppercased() + "!"
    }
}

func exercise6() {
    let string = "Gengar"
    print("[exercise6] original string: \(string)")
    print("[exercise6] shouted string: \(string.shout())")
}
