// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation

@main
struct Day20ValueReferenceDeepDive {
    static func main() {
        exercise1()
        exercise2()
        exercise3()
        exercise4()
        exercise5()
        exercise6()
    }
}

/*今日总思路

struct 赋值时更像复制一份数据。
class 赋值时更像复制一个引用，多个变量指向同一个对象。

C++ 类比：
Swift struct ≈ 普通对象值拷贝
Swift class ≈ 多个指针 / 引用指向同一个对象
inout ≈ C++ 引用参数 T&
mutating ≈ 值类型方法显式声明“我要改自己”
*/


/*练习 1：struct 复制后互不影响
题目:定义一个 struct PlayerProfile，包含：
name
level

在 exercise1() 里：
创建 player1
令 player2 = player1
修改 player2.level
打印两个对象的 level
*/
struct PlayerProfile {
    var name: String
    var level: Int
}

func exercise1() {
    let player1 = PlayerProfile(name: "Gengar", level: 10)
    var player2 = player1

    player2.level = 20

    print("[exercise1] player1.level = \(player1.level)")
    print("[exercise1] player2.level = \(player2.level)")
}

/*练习 2：class 赋值后共享对象
题目:定义一个 class SharedAccount，包含：
owner
balance
init(owner: String, balance: Int)

在 exercise2() 里：

创建 account1
令 account2 = account1
修改 account2.balance
打印两个对象的 balance
*/
class SharedAccount {
    var owner: String
    var balance: Int

    init(owner: String, balance: Int) {
        self.owner = owner
        self.balance = balance
    }
}

func exercise2() {
    let account1 = SharedAccount(owner: "Gengar", balance: 1000)
    let account2 = account1

    account2.balance = 3000

    print("[exercise2] account1.balance = \(account1.balance)")
    print("[exercise2] account2.balance = \(account2.balance)")
}

/*练习 3：数组里放 struct
知识点:
数组里放 struct 时，取出来改副本，不会自动改回原数组。
如果要改数组中的元素，通常要通过索引直接改。

题目:定义一个 struct TaskItem，包含：
title
isDone

在 exercise3() 里：

创建数组 [TaskItem]
先把第一个元素取出来给 var firstTask
修改 firstTask.isDone = true
打印数组第一个元素的 isDone
再通过 tasks[0].isDone = true
再打印数组第一个元素的 isDone

*/
struct TaskItem {
    var title: String
    var isDone: Bool
}

func exercise3() {
    var tasks = [
        TaskItem(title: "Learn Swift", isDone: false),
        TaskItem(title: "Write notes", isDone: false)
    ]

    var firstTask = tasks[0]
    firstTask.isDone = true

    print("[exercise3] after changing copy, tasks[0].isDone = \(tasks[0].isDone)")

    tasks[0].isDone = true

    print("[exercise3] after changing array item, tasks[0].isDone = \(tasks[0].isDone)")
}

/*练习 4：数组里放 class
知识点:
数组里放 class 对象时，数组里存的是引用。
你取出一个对象变量再改，它会影响数组里的那个对象。

题目:定义一个 class DownloadTask，包含：

filename
progress
init(filename: String, progress: Int)

在 exercise4() 里：

创建数组 [DownloadTask]
取出第一个对象为 firstDownload
修改 firstDownload.progress = 80
打印数组第一个元素的 progress

*/
class DownloadTask {
    var filename: String
    var progress: Int

    init(filename: String, progress: Int) {
        self.filename = filename
        self.progress = progress
    }
}

func exercise4() {
    let downloads = [
        DownloadTask(filename: "video.mp4", progress: 0),
        DownloadTask(filename: "image.png", progress: 0)
    ]

    let firstDownload = downloads[0]
    firstDownload.progress = 80

    print("[exercise4] downloads[0].progress = \(downloads[0].progress)")
}

/*练习 5：mutating 修改值类型自身
题目:定义一个 struct Counter，包含：

count

再写两个方法：
mutating func increase()
mutating func reset()

在 exercise5() 里：

创建一个 counter
调用两次 increase
打印 count
调用 reset
再打印 count

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

func exercise5() {
    var counter = Counter(count: 0)

    counter.increase()
    counter.increase()

    print("[exercise5] count after increase = \(counter.count)")

    counter.reset()

    print("[exercise5] count after reset = \(counter.count)")
}

/*练习 6：inout 修改外部变量
知识点:
inout 适合这种场景：
函数不是返回一个新值，而是直接修改调用方传进来的变量。

题目:写一个函数：
func levelUp(_ level: inout Int)

要求：
把传入的 level 加 1

再写一个函数：
func resetToZero(_ value: inout Int)

要求：
把传入的值改成 0

在 exercise6() 里：

定义 var level = 5
调用 levelUp(&level)
打印 level
调用 resetToZero(&level)
再打印 level

*/
func levelUp(_ level: inout Int) {
    level += 1
}

func resetToZero(_ value: inout Int) {
    value = 0
}

func exercise6() {
    var level = 5

    levelUp(&level)
    print("[exercise6] level after levelUp = \(level)")

    resetToZero(&level)
    print("[exercise6] level after reset = \(level)")
}