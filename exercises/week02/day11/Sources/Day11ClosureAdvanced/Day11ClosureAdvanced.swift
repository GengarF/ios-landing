// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation

@main
struct Day11ClosureAdvanced {
    static func main() {
        exercise1()
        exercise2()
        exercise3()
        exercise4()
        exercise5()
        exercise6()
    }
}

//第一部分： closure作为参数
/*知识点1：函数可以接收 closure：函数不只是接收 Int、String，也可以接收“一段行为”。
Swift closure 参数 ≈ C++ 的 lambda / std::function 参数

练习1：传一个最简单的 closure
题目
写一个函数：
func runAction(action: () -> Void)

要求：
先打印 "before action"
再执行 action
最后打印 "after action"

在 exercise1() 里调用它，并传一个 closure，打印 "hello from closure"。
*/
func runAction(action: () -> Void) {
    print("[exercise1] before action")
    action()
    print("[exercise1] after action")
}

func exercise1() {
    runAction(action: {
        print("[exercise1] hello from closure")
    })
}

//第二部分：trailing closure
/*知识点 2：如果 closure 是最后一个参数，可以写到括号外面

练习 2：用 trailing closure 重写调用
题目
继续使用刚才的 runAction(action:)。
在 exercise2() 里用 trailing closure 调用它，打印一条新消息。
*/
func exercise2() {
    runAction {
        print("[exercise2] using trailing closure")
    }
}

//第三部分：closure 接收参数
/*知识点 3：closure 也可以接收参数并返回值
练习 3：用 closure 排序，完整参数写法
题目
在 exercise3() 里：
定义数组 [5, 1, 8, 3]
用 sorted 和 closure 按降序排序

用完整参数写法：
{ (a: Int, b: Int) -> Bool in ... }
打印原数组和排序后数组
*/
func exercise3() {
    let numbers = [5, 1, 8, 3]

    let sortedNumbers = numbers.sorted { (a: Int, b: Int) -> Bool in
        a > b
    }

    print("[exercise3] numbers = \(numbers)")
    print("[exercise3] sortedNumbers = \(sortedNumbers)")
}

//第四部分：参数简写 $0
/*知识点 4：closure 参数可以简写成 $0、$1
练习 4：用 $0 $1 重写排序
题目
在 exercise4() 里：

定义数组 [9, 2, 7, 4]
用 sorted { $0 < $1 } 按升序排序
打印原数组和结果
*/
func exercise4() {
    let numbers = [9, 2, 7, 4]
    let sortedNumbers = numbers.sorted { $0 < $1 }

    print("[exercise4] numbers = \(numbers)")
    print("[exercise4] sortedNumbers = \(sortedNumbers)")
}

//第五部分：自己写一个接收 closure 的变换函数
/*知识点 5：高阶函数本质上就是“函数接收函数

练习 5：自定义 transform 函数
题目
写一个函数：
func transformNumbers(_ numbers: [Int], using transform: (Int) -> Int) -> [Int]

要求：
遍历数组
把每个元素经过 transform
返回新数组

在 exercise5() 里：
传 [1, 2, 3]
用 closure 把每个数乘以 10
打印结果
*/
func transformNumbers(_ numbers: [Int], using transform: (Int) -> Int) -> [Int] {
    var result: [Int] = []

    for number in numbers {
        result.append(transform(number))
    }

    return result
}

func exercise5() {
    let numbers = [1, 2, 3]
    let transformed = transformNumbers(numbers) { $0 * 10 }

    print("[exercise5] numbers = \(numbers)")
    print("[exercise5] transformed = \(transformed)")
}

//第六部分：更像回调的 closure
/*知识点 6：closure 很适合表达“做完之后执行什么”，iOS 里经常看到的 completion 风格
练习 6：写一个最简单的 completion 风格函数
题目
写一个函数：
func fetchMessage(completion: (String) -> Void)

要求：
在函数内部定义一个字符串 "Swift closure callback"
调用 completion

在 exercise6() 里：
用 trailing closure 接收消息
打印消息
*/
func fetchMessage(completion: (String) -> Void) {
    let message = "Swift closure callback"
    completion(message)
}

func exercise6() {
    fetchMessage { message in
        print("[exercise6] message = \(message)")
    }
}