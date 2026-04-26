// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

@main
struct Day18PropertiesMethodsComputed {
    static func main() {
        exercise1()
        exercise2()
        exercise3()
        exercise4()
        exercise5()
        exercise6()
    }
}

/*今日总思路：
字段负责“存状态”，方法负责“做动作”，计算属性负责“给出派生结果”。

用 C++ 类比就是：

存储属性 ≈ 成员变量
方法 ≈ 成员函数
计算属性 ≈ getter 风格的派生结果
*/

/*练习 1：最基础的“属性 + 方法”
知识点：一个模型不应该只有字段，也可以有最基础的方法。

题目：定义一个 struct BankAccount，包含：
owner
balance

再写一个方法：
func introduce()

要求打印账户拥有者和余额。
在 exercise1() 里创建对象并调用。
*/
struct BankAccount {
    var owner: String
    var balance: Int

    func introduce() {
        print("[exercise] owner: \(owner), balance: \(balance)")
    }
}

func exercise1() {
    let user = BankAccount(owner: "Gengar", balance: 1000000)
    user.introduce()
}

/*练习 2：mutating 修改自身状态
知识点:如果 struct 的方法要修改属性，就要用 mutating。

题目:继续扩展 BankAccount，增加两个方法：

mutating func deposit(_ amount: Int)
mutating func withdraw(_ amount: Int)

在 exercise2() 里：

创建账户
存 500
取 200
打印最终余额
*/
extension BankAccount {
    mutating func deposit(_ amount: Int) {
        balance += amount
    }
    mutating func withdraw(_ amount: Int) {
        balance -= amount
    }
}

func exercise2() {
    var user2 = BankAccount(owner: "Jeff", balance: 10000)
    user2.deposit(100000)
    user2.withdraw(5000)
    user2.introduce()
}

/*练习 3：计算属性表达“派生信息”
知识点:有些值不需要真的存起来，而是根据已有属性算出来。

题目:定义一个 struct Rectangle，包含：

width
height

再加一个计算属性：
var area: Double

在 exercise3() 里创建对象并打印面积。
*/
struct Rectangle {
    var width: Double
    var height: Double

    var area: Double {
        width * height
    }
}

func exercise3() {
    let rect = Rectangle(width: 3.5, height: 2.0)
    print("[exercise3] area = \(rect.area)")
}

/*练习 4：属性 + 方法 + 计算属性一起用
知识点:真实模型往往不是三选一，而是三者一起存在。

题目:定义一个 struct StudentScore，包含：
name
math
english

再加：
计算属性 total
方法 printSummary()

要求 printSummary() 打印姓名和总分。

在 exercise4() 里测试。
*/
struct StudentScore {
    var name: String
    var math: Int
    var english: Int

    var total: Int {
        math + english
    }

    func printSummary() {
        print("[exercise4] name: \(name), total scores: \(total)")
    }
}

func exercise4() {
    let student = StudentScore(name: "Gengar", math: 148, english: 145)
    student.printSummary()
}

/*练习 5：static 也可以参与模型设计
知识点:有些信息属于“类型本身”，而不是某个实例。

题目:定义一个 struct AppUser，包含：
name

再加：
static var platformName = "iOS Landing"
func printProfile()

要求输出用户名和平台名。

在 exercise5() 里测试。
*/
struct AppUser {
    static let platformName = "iOS Landing"

    var name: String

    func printProfile() {
        print("[exercise5] name = \(name), platform = \(Self.platformName)")
    }
}

func exercise5() {
    let user = AppUser(name: "Gengar")
    user.printProfile()
}

/*练习 6：做一个更像业务对象的小综合
知识点：最后一题，把属性、计算属性、方法、mutating 串起来。

题目：定义一个 struct VideoProgress，包含：
title
watchedSeconds
totalSeconds

再加：
计算属性 progressText
mutating func watch(_ seconds: Int)

要求：
watch(_:) 让观看时长增加
但不要超过总时长
progressText 返回类似 "120/300"

在 exercise6() 里：
创建对象
调用两次 watch(_:)
打印 progressText
*/
struct VideoProgress {
    var title: String
    var watchedSeconds: Int
    var totalSeconds: Int

    var progressText: String {
        "\(watchedSeconds)/\(totalSeconds)"
    }

    mutating func watch(_ seconds: Int) {
        guard (watchedSeconds + seconds) < totalSeconds else {
            watchedSeconds = totalSeconds
            return
        }

        watchedSeconds += seconds
    }
}

func exercise6() {
    var video = VideoProgress(title: "The Great Wall", watchedSeconds: 120, totalSeconds: 300)
    video.watch(50)
    print("[exercise6] title: \(video.title)")
    print("[exercise6] the first time: progressText: \(video.progressText)")
    video.watch(200)
    print("[exercise6] the second time: progressText: \(video.progressText)")
}