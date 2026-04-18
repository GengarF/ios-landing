// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation

@main
struct Day08GenericsProtocolExtensionHOF {
    static func main() {
        exercise1()
        exercise2()
        exercise3()
        exercise4()
        exercise5()
        exercise6()
    }
}

//第一部分：Generics 泛型 = 先别把类型写死，让一套逻辑适配多种类型。
/*练习1：泛型函数  Swift 泛型函数 ≈ C++ 模板函数
题目：写一个泛型打印函数
要求：

把传入的值打印两次

在 exercise1() 里：

传一个 Int
再传一个 String
*/
func printTwice<T>(_ value: T) {
    print(value)
    print(value)
}

func exercise1() {
    printTwice(42)
    printTwice("Swift")
}

/*练习2：泛型 + Optional 返回值
题目：写一个泛型取首元素函数
要求：

如果数组有元素，返回第一个
如果没有元素，返回 nil

在 exercise2() 里：

传一个 [1, 2, 3]
再传一个空数组 []
*/
func firstElement<T>(_ array: [T]) -> T? {
    array.first
}

func exercise2() {
    let numbers = [1, 2, 3]
    let empty: [Int] = []

    print("[exercise2] first of numbers = \(String(describing: firstElement(numbers)))")
    print("[exercise2] first of empty = \(String(describing: firstElement(empty)))")
}

//第二部分：protocol extension 给协议里的要求提供默认实现
/*练习3：给 protocol 提供默认实现
题目：定义一个 protocol：

protocol Greetable

要求：

有一个属性 name
有一个方法 greet()

再写一个 protocol extension，给 greet() 提供默认实现。

然后定义一个 struct UserProfile：

有 name
遵守 Greetable

在 exercise3() 里创建一个实例并调用 greet()。

*/
protocol Greetable {
    var name: String { get }
    func greet()
}

extension Greetable {
    func greet() {
        print("Hello, \(name)")
    }
}

struct UserProfile: Greetable {
    var name: String
}

func exercise3() {
    let user = UserProfile(name: "Gengar")
    user.greet()
}

/*练习4：类型可以覆盖默认实现
题目

继续使用 Greetable。
定义一个 struct AdminUser：

有 name
遵守 Greetable
自己实现 greet()

在 exercise4() 里创建实例并调用 greet()。
*/
struct AdminUser: Greetable {
    var name: String

    func greet() {
        print("Admin \(name) says hello")
    }
}

func exercise4() {
    let admin = AdminUser(name: "Boss")
    admin.greet()
}

//第三部分：高阶函数再进一层
/*练习：compactMap: 一边转换，一边把 nil 去掉。
题目: 字符串转整数
在 exercise5() 里：

定义数组：
["1", "2", "abc", "4"]
用 compactMap 转成 [Int]
打印原数组和新数组
*/
func exercise5() {
    let strings = ["1", "2", "abc", "4"]
    let numbers = strings.compactMap{Int($0)}

    print("[exercise5] strings = \(strings)")
    print("[exercise5] numbers = \(numbers)")
}

/*练习：reduce: 把一组元素按某种规则累计成一个结果。
题目: 求和

在 exercise6() 里：

定义数组 [1, 2, 3, 4, 5]
用 reduce 求和
打印原数组和求和结果
*/
func exercise6() {
    let numbers = [1, 2, 3, 4, 5]
    let sum = numbers.reduce(0) { partial, number in
        partial + number
    }

    print("[exercise6] numbers = \(numbers)")
    print("[exercise6] sum = \(sum)")
}