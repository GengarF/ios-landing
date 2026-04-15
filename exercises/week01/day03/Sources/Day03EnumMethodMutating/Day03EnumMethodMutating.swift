// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

@main
struct Day03EnumMethodMutating {
    static func main() {
        exercise1()
        exercise2()
        exercise3()
        exercise4()
        exercise5()
        exercise6()
    }
}


/*练习1：给struct Student加方法
定义一个 struct Student，要求：
属性：
name
score
方法：
introduce()，打印名字和分数
然后在 exercise1() 里：
创建一个 Student
调用它的 introduce(）
*/
struct Student {
    var name: String
    var score: Int

    func introduce() {
        print("我的名字是\(name), 分数是\(score)")
    }
}

func exercise1() {
    let student = Student(name: "Gengar", score: 150)
    student.introduce()
}

/*练习2：mutating 写一个可增长的计数器
定义一个 struct Counter，要求：
属性：
count
方法：
increase()：让 count + 1
reset()：把 count 设回 0

注意：
这两个方法都要真正修改属性。

然后在 exercise2() 里：

创建一个 Counter
连续调用两次 increase()
打印当前值
再 reset()
再打印一次

*/
struct Counter {
    var count: Int

    mutating func increase() {
        count += 1
    }

    mutating func reset() {
        count = 0
    }
}

func exercise2() {
    var counter = Counter(count: 0)
    counter.increase()
    counter.increase()
    print("当前count值为\(counter.count)")
    counter.reset()
    print("reset后count值为\(counter.count)")
}

/*练习3：enum 定义一个星期枚举
定义一个 enum Weekday，要求有 7 个 case：

monday
tuesday
wednesday
thursday
friday
saturday
sunday

然后在 exercise3() 里：

定义一个 today
设为 .wednesday
打印这个值
*/
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday

    var chineseName: String {
        switch self {
        case .monday:
            return "周一"
        case .tuesday:
            return "周二"
        case .wednesday:
            return "周三"
        case .thursday:
            return "周四"
        case .friday:
            return "周五"
        case .saturday:
            return "周六"
        case .sunday:
            return "周日"
        }
    }
}

func exercise3() {
    let today: Weekday = .wednesday
    print("今天是 \(today.chineseName)")
}


/*练习4：switch 匹配 enum
续使用你刚才的 Weekday，写 exercise4()：

定义一个 today
用 switch 判断今天是星期几
每个 case 打印对应中文

比如：

.monday -> 今天是周一

尽量把 7 个 case 写全。
先不要写 default。
*/
func exercise4() {
    let today: Weekday = .monday

    switch today{
    case .monday:
        print("今天是周一")
    case .tuesday:
        print("今天是周二")
    case .wednesday:
        print("今天是周三")
    case .thursday:
        print("今天是周四")
    case .friday:
        print("今天是周五")
    case .saturday:
        print("今天是周六")
    case .sunday:
        print("今天是周日")
    }
}

/*练习5：给 enum 加方法:给 Weekday 加一个判断是否周末的方法
要求：

如果是 .saturday 或 .sunday，返回 true
否则返回 false

然后在 exercise5() 里：

定义一个 day
调用 isWeekend()
打印结果
*/
extension Weekday {
    func isWeekend() -> Bool {
        switch self {
        case .saturday, .sunday:
            return true
        default:
            return false
        }
    }
}

func exercise5() {
    let day: Weekday = .saturday
    print("isWeekend = \(day.isWeekend())")
}

/*练习6：账户余额修改
定义一个 struct BankAccount，要求：

属性：
owner
balance
方法：
deposit(_ amount: Int)：存钱
withdraw(_ amount: Int)：取钱
这两个方法都要修改余额

然后在 exercise6() 里：

创建账户
存 200
取 100
打印最终余额
*/
struct BankAccount {
    var owner: String
    var balance: Int

    mutating func deposit(_ amount: Int) {
        balance += amount
    }

    mutating func withdraw(_ amount: Int) {
        balance -= amount
    }
}

func exercise6() {
    var account = BankAccount(owner: "Gengar", balance: 1000000)
    account.deposit(500000)
    account.withdraw(100)
    print("\(account.owner)的银行账户余额为\(account.balance)")
}
