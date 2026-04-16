// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

@main
struct Day06OptionalEnumClosureAdvance {
    static func main() {
        exercise1()
        exercise2()
        exercise3()
        exercise4()
        exercise5()
        exercise6()
    }
}

//第一部分： optional进阶
/*练习1：guard let：如果这个 Optional 有值，就解包继续；没有值，就提前返回。
题目：用 guard let 解包
写一个函数：

func printCity(_ city: String?)

要求：

如果 city 是 nil，打印 "city is nil" 并返回
否则打印 "city = xxx"

在 exercise1() 里调用两次：

一次传 "Shanghai"
一次传 nil
*/
func printCity(_ city: String?) {
    guard let city = city else {
        print("[exercise1] city is nil, early return")
        return
    }

    print("[exercise1] unwrapped city: \(city)")
}

func exercise1() {
    printCity("Shanghai")
    printCity(nil)
}

/*练习2：?? 空合并运算符
题目：给 Optional 一个默认值
在 exercise2() 里：

定义一个 String? 类型的 nickname
值设为 nil
用 ?? 得到一个 displayName
默认值是 "Anonymous"
打印结果

再测试一次：

把 nickname 改成 "Gengar"
再打印一次
*/
func exercise2() {
    var nickname: String? = nil
    var displayName = nickname ?? "Anonymous"
    print("[exercise2] nickname is nil, displayName = \(displayName)")

    nickname = "Gengar"
    displayName = nickname ?? "Anonymous"
    print("[exercise2] nickname has value, displayName = \(displayName)")
}

/*练习3：可选链 ?.
题目：可选链 + 默认值
定义：

struct Pet { var name: String }
struct User { var pet: Pet? }

在 exercise3() 里：

创建一个有宠物的用户
创建一个没有宠物的用户
分别用 ?. 和 ?? 打印宠物名字
没宠物时输出 "No Pet"
*/
struct Pet { var name: String }
struct User { var pet: Pet? }

func exercise3() {
    let user1 = User(pet: Pet(name: "Gengar"))
    let user2 = User(pet: nil)
    print("[exercise3] user1 pet name: \(user1.pet?.name ?? "No Pet")")
    print("[exercise3] user2 pet name: \(user2.pet?.name ?? "No Pet")")
}

//enum进阶
/*练习4：带原始值的 enum ： Swift raw value enum ≈ 带固定值的枚举。
题目：HTTP 状态码
定义一个 enum HTTPStatus: Int，包含：

ok = 200
notFound = 404
serverError = 500

在 exercise4() 里：

定义一个状态为 .notFound
打印它的名字和 rawValue
*/
enum HTTPStatus: Int {
    case ok = 200
    case notFound = 404
    case serverError = 500
}

func exercise4() {
    let status = HTTPStatus.notFound
    print("[exercise4] status: \(status), rawValue: \(status.rawValue)")
}

/*练习5：带关联值的 enum & 用 switch 解构关联值
题目：支付方式
定义一个 enum Payment，包含：

cash(amount: Int)
card(number: String)

在 exercise5() 里：

创建一个 Payment.cash(amount: 100)
用 switch 匹配
打印对应信息

然后你可以再自己改成 .card(...) 测试一次。
*/
enum Payment {
    case cash(amount: Int)
    case card(number: String)
}

func printPayment(_ payment: Payment) {
        switch payment {
        case .cash(let amount):
            print("[exercise5] payment is .cash, amount = \(amount)")
        case .card(let number):
            print("[exercise5] payment is .card, number = \(number)")
    }
}

func exercise5() {
    let cashPayment = Payment.cash(amount: 100)
    let cardPayment = Payment.card(number: "1344066813")

    printPayment(cashPayment)
    printPayment(cardPayment)

}


//closure进阶：1.filter 2.把 closure 作为参数传给函数
/*练习6：filter
题目：筛选偶数
在 exercise6() 里：

定义数组 [1, 2, 3, 4, 5, 6]
用 filter 筛出偶数
打印原数组和结果数组
*/
func exercise6() {
    let numbers = [1, 2, 3, 4, 5, 6]
    let evenNumbers = numbers.filter{
        $0 % 2 == 0
    }

    print("[exercise6] numbers: \(numbers)")
    print("[exercise6] evenNumbers: \(evenNumbers)")

}
