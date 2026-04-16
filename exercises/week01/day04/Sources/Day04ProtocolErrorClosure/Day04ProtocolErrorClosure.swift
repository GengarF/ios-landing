// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

@main
struct Day04ProtocolErrorClosure {
    static func main() {
        exercise1()
        exercise2()
        exercise3()
        exercise4()
        exercise5()
        exercise6()
    }
}

/*练习1：protocol.定义一个 protocol 并让 struct 遵守*/
protocol Introducible {
    func introduce()
}

struct Teacher: Introducible {
    var name: String
    var subject: String

    func introduce() {
        print("my name is \(name), i teach \(subject)")
    }
}

func exercise1() {
    let teacher = Teacher(name: "Gengar", subject: "Math")
    teacher.introduce()
}

/*练习2：protocol 也可以约束属性*/
protocol Named {
    var name: String { get }
}

struct Pet: Named {
    var name: String
    var kind: String
}

func exercise2() {
    let pet = Pet(name: "Momo", kind: "Cat")
    print("pet.name = \(pet.name)")
}

/*练习3：error handling : 写一个除法函数，处理除 0
throws = 这个函数可能抛错
throw = 真正抛出错误
try = 调用可能失败的函数
do-catch = 捕获错误
*/
enum DivideError: Error {
    case divideByZero
}

func safeDivide(_ a: Int, _ b: Int) throws -> Int {
    if b == 0 {
        throw DivideError.divideByZero
    }
    return a / b
}

func runDivisionExample(_ a: Int, _ b: Int) {
    do {
        let result = try safeDivide(a, b)
        print("the result is \(result)")
    } catch DivideError.divideByZero {
        print("error! divide by zero")
    } catch {
        print("unexpected error: \(error)")
    }
}

func exercise3() {
    runDivisionExample(5, 3)
}

/*练习4：再测试一次失败情况*/
func exercise4() {
    runDivisionExample(5, 0)
}

/*练习5：closure常见用法：排序、过滤、映射、回调、高阶函数
用 closure 排序
*/
func exercise5() {
    let numbers = [5, 1, 8, 3]
    let sortedNumbers = numbers.sorted { a, b in
        a > b
    }

    print("numbers = \(numbers)")
    print("sortedNumbers = \(sortedNumbers)")
}

/*练习6：用 closure + map 处理数组
定义数组 [1, 2, 3, 4]
用 map 把每个元素乘以 10
打印原数组和结果数组
*/
func exercise6() {
    let numbers = [1, 2, 3, 4]
    let newNumbers = numbers.map { number in
        number * 10
    }

    print("numbers = \(numbers)")
    print("newNumbers = \(newNumbers)")
}
