// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

@main
struct Day12HigherOrderFunctions {
    static func main() {
        exercise1()
        exercise2()
        exercise3()
        exercise4()
        exercise5()
        exercise6()
    }
}

/*建立总直觉：
map：每个元素都变一下
filter：只留下满足条件的
compactMap：尝试转换，失败的扔掉
reduce：把一堆东西合成一个结果
*/

//第一部分：map
/*知识点 1：map 是“逐个变换”
练习 1：把整数数组全部加 1
题目
在 exercise1() 里：

定义数组 [1, 2, 3, 4]
用 map 把每个元素都加 1
打印原数组和结果数组
*/
func exercise1() {
    let numbers = [1, 2, 3, 4]
    let increased = numbers.map { $0 + 1 }

    print("[exercise1] numbers = \(numbers)")
    print("[exercise1] increased = \(increased)")
}

//第二部分：filter
/*知识点 2：filter 是“按条件留下”
练习 2：筛选大于 10 的数
题目
在 exercise2() 里：

定义数组 [3, 12, 7, 18, 5]
用 filter 筛出大于 10 的元素
打印原数组和结果数组
*/
func exercise2() {
    let numbers = [3, 12, 7, 18, 5]
    let bigNumbers = numbers.filter { $0 > 10 }

    print("[exercise2] numbers = \(numbers)")
    print("[exercise2] bigNumbers = \(bigNumbers)")
}

//第三部分：compactMap
/*知识点 3：compactMap = 转换 + 去掉 nil
练习 3：从字符串里提取有效整数
题目
在 exercise3() 里：

定义数组 ["10", "xx", "25", "hello", "8"]
用 compactMap 转成整数数组
打印原数组和结果数组
*/
func exercise3() {
    let strings = ["10", "xx", "25", "hello", "8"]
    let numbers = strings.compactMap { Int($0) }

    print("[exercise3] strings = \(strings)")
    print("[exercise3] numbers = \(numbers)")
}

//第四部分：reduce
/*知识点 4：reduce 是“累计成一个结果”
练习 4：求数组乘积
题目
在 exercise4() 里：

定义数组 [2, 3, 4]
用 reduce 求乘积
打印原数组和结果
*/
func exercise4() {
    let numbers = [2, 3, 4]
    let product = numbers.reduce(1) { partial, number in
        partial * number
    }

    print("[exercise4] numbers = \(numbers)")
    print("[exercise4] product = \(product)")
}

//第五部分：组合使用
/*知识点 5：高阶函数经常是串起来用的
练习 5：先筛选，再变换
题目
在 exercise5() 里：

定义数组 [1, 2, 3, 4, 5, 6]
先筛出偶数
再把它们乘以 100
打印结果
*/
func exercise5() {
    let numbers = [1, 2, 3, 4, 5, 6]
    let res = numbers.filter{ $0 % 2 == 0 }.map{ $0 * 100 }

    print("[exercise5] numbers = \(numbers)")
    print("[exercise5] result = \(res)")
}

//第六部分：综合一点——解析、筛选、求和
/*知识点 6：把 compactMap、filter、reduce 串起来
练习 6：综合数据处理
题目
在 exercise6() 里：

定义数组 ["10", "abc", "25", "-3", "8"]
用 compactMap 取出能转成整数的值
用 filter 留下正数
用 reduce 求和
打印原数组和最终结果
*/
func exercise6() {
    let strings = ["10", "abc", "25", "-3", "8"]
    let sum = strings
        .compactMap{ Int($0) }
        .filter{ $0 > 0 }
        .reduce(0) { $0 + $1 }
    
    print("[exercise6] strings = \(strings)")
    print("[exercise6] sum = \(sum)")
}