// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

@main
struct Day13ErrorHandlingAdvanced {
    static func main() {
        exercise1()
        exercise2()
        exercise3()
        exercise4()
        exercise5()
        exercise6()
    }
}

//第一部分：一个错误类型里放多个错误情况
/*知识点 1：错误类型不一定只有一个 case,Swift 的错误类型可以像 enum 一样，把多种失败情况装在一起。

练习 1：写一个会抛多种错误的登录函数
*/
enum LoginError: Error {
    case emptyUsername
    case wrongPassword
}

func login(username: String, password: String) throws {
    guard !username.isEmpty else {
        throw LoginError.emptyUsername
    }

    guard password == "123456" else {
        throw LoginError.wrongPassword
    }

    print("[exercise1] login success for \(username)")
}

func exercise1() {
    do {
        try login(username: "Gengar", password: "123456")
    } catch {
        print("[exercise1] unexpected error: \(error)")
    }
}

//第二部分：catch 精确匹配不同错误
/*知识点 2：catch 不一定只写一个,可以按错误类型和具体 case 分开处理。

练习 2：针对不同错误分别提示
*/
func exercise2() {
    do {
        try login(username: "", password: "123456")
    } catch LoginError.emptyUsername {
        print("[exercise2] username is empty")
    } catch LoginError.wrongPassword {
        print("[exercise2] wrong password")
    } catch {
        print("[exercise2] other error: \(error)")
    }

    do {
        try login(username: "Gengar", password: "000000")
    } catch LoginError.emptyUsername {
        print("[exercise2] username is empty")
    } catch LoginError.wrongPassword {
        print("[exercise2] wrong password")
    } catch {
        print("[exercise2] other error: \(error)")
    }
}

//第三部分：更像真实输入校验的错误处理
/*知识点 3：同一个函数里可以有多种校验失败

练习 3：写一个解析分数函数
题目
定义：
enum ScoreError: Error

包含：
emptyInput
invalidNumber
outOfRange

再写：
func parseScore(_ text: String) throws -> Int

规则：
如果输入为空，抛 emptyInput
如果不能转成整数，抛 invalidNumber
如果不在 0...100，抛 outOfRange
否则返回分数

在 exercise3() 里测试：
"85"
""
"abc"
"150"
*/
enum ScoreError: Error {
    case emptyInput
    case invalidNumber
    case outOfRange
}

func parseScore(_ text: String) throws -> Int {
    guard !text.isEmpty else {
        throw ScoreError.emptyInput
    }

    guard let value = Int(text) else {
        throw ScoreError.invalidNumber
    }

    guard (0...100).contains(value) else {
        throw ScoreError.outOfRange
    }

    return value
}

func exercise3() {
    let inputs = ["85", "", "abc", "150"]

    for input in inputs {
        do {
            let score = try parseScore(input)
            print("[exercise3] input = \(input), score = \(score)")
        } catch ScoreError.emptyInput {
            print("[exercise3] input is empty")
        } catch ScoreError.invalidNumber {
            print("[exercise3] invalid number")
        } catch ScoreError.outOfRange {
            print("[exercise3] score out of range")
        } catch {
            print("[exercise3] other error: \(error)")
        }
    }
}

//第四部分：try?
/*知识点 4：try? 会把错误转成 nil。 try? 的意思是：我不想写 do-catch，如果失败就直接给我 nil。
try? = 把抛错调用变成 Optional 风格。

练习 4：用 try? 简化错误处理
题目
在 exercise4() 里：

用 try? parseScore("90")
用 try? parseScore("abc")
打印结果
*/
func exercise4() {
    let score1 = try? parseScore("90")
    let score2 = try? parseScore("abc")

    print("[exercise4] score1 = \(String(describing: score1))")
    print("[exercise4] score2 = \(String(describing: score2))")
}

//第五部分：抛错函数可以继续调用抛错函数
/*知识点 5：错误可以往上抛, 底层函数发现问题，就抛；上层函数如果不处理，也可以继续往外抛。

练习 5：计算平均分
题目
写一个函数：
func averageScore(_ texts: [String]) throws -> Double

要求：
用 parseScore 把字符串数组转成分数数组
再计算平均值
如果中间有任何解析失败，就继续把错误抛出去

在 exercise5() 里测试：
一组合法输入 ["80", "90", "100"]
一组非法输入 ["80", "abc", "100"]
*/
func averageScore(_ texts: [String]) throws -> Double {
    let score = try texts.map{ try parseScore($0) }
    let sum = score.reduce( 0, + )

    return Double(sum) / Double(score.count)
}

func exercise5() {
    do {
        let avg = try averageScore(["80", "90", "100"])
        print("[exercise5] average = \(avg)")
    } catch {
        print("[exercise5] error in valid case: \(error)")
    }

    do {
        let avg = try averageScore(["80", "abc", "100"])
        print("[exercise5] average = \(avg)")
    } catch {
        print("[exercise5] invalid case error: \(error)")
    }
}

//第六部分：defer
/*知识点 6：defer 表示“离开作用域前一定执行”
即使中间：return或者 throw, defer 里的代码也会执行。

练习 6：观察 defer 在成功和失败时都会执行
题目
写一个函数：
func processTask(shouldFail: Bool) throws

要求：
先打印 "start task"
写一个 defer，打印 "cleanup task"
如果 shouldFail == true，抛一个错误
否则打印 "task succeeded"

在 exercise6() 里：
测试一次成功
测试一次失败
观察输出顺序
*/
enum TaskError: Error {
    case failed
}

func processTask(shouldFail: Bool) throws {
    print("[exercise6] start task")

    defer {
        print("[exercise6] cleanup task")
    }

    if shouldFail {
        throw TaskError.failed
    }

    print("[exercise6] task succeeded")
}

func exercise6() {
    do {
        try processTask(shouldFail: false)
    } catch {
        print("[exercise6] unexpected error: \(error)")
    }

    do {
        try processTask(shouldFail: true)
    } catch {
        print("[exercise6] caught error: \(error)")
    }
}