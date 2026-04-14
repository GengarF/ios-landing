// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
@main
struct Day01Basics {
    static func main() {
        exercise1()
        exercise2()
        exercise3()
        exercise4()
        exercise5()
        exercise6()
        exercise7()
        exercise8()
        exercise9()
        exercise10()
    }
}

//练习1：自我介绍
func exercise1() {
    let name = "Gengar"
    let age = "26"
    let city = "Shanghai"
    let company = "Poizon"
    let direction = "ios开发"

    print("我叫\(name), 今年\(age)岁，即将去\(city)的\(company)参加工作，岗位是\(direction)。")
}

//练习2：let 和 var
func exercise2() {
    let day = 1
    var studyHours = 2

    studyHours = 3

    print("第\(day)天学习，计划学习\(studyHours)小时。")
}

//练习3： 奇偶判断
func exercise3() {
    let number = 8

    if number % 2 == 0 {
        print("\(number)是偶数。")
    } else {
        print("\(number)是奇数。")
    }
}

//练习4：定义成绩score，>=60及格，否则打印不及格，输出里分数也要打出
func exercise4() {
    let score = 75

    if score >= 60 {
        print("该同学得分\(score)，及格")
    } else {
        print("该同学得分\(score)，不及格")
    }
}

/*练习5：定义一个成绩 score
按下面规则打印等级：
90 及以上：A
80 到 89：B
70 到 79：C
60 到 69：D
60 以下：F
同样，把分数和等级一起打印出来。*/

func exercise5() {
    let score: Int = 85

    if score >= 90 {
        print("分数是\(score)，等级是A。")
    } else if score >= 80 {
        print("分数是\(score)，等级是B。")
    } else if score >= 70 {
        print("分数是\(score)，等级是C。")
    } else if score >= 60 {
        print("分数是\(score)，等级是D。")
    } else {
        print("分数是\(score)，等级是F。")
    }
}

/*练习6：
定义一个整数 day
用 switch 判断：
1 → Monday
2 → Tuesday
3 → Wednesday
4 → Thursday
5 → Friday
6 → Saturday
7 → Sunday
其他 → 无效日期*/

func exercise6() {
    let day: Int = 3

    switch day {
    case 1:
        print("1 对应 Monday")
    case 2:
        print("2 对应 Tuesday")
    case 3:
        print("3 对应 Wednesday")
    case 4:
        print("4 对应 Thursday")
    case 5:
        print("5 对应 Friday")
    case 6:
        print("6 对应 Saturday")
    case 7:
        print("7 对应 Sunday")
    default:
        print("无效日期")
    }
}

//练习7：求和函数
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func exercise7() {
    let res = add(5, 3)
    print("3 + 5 = \(res)")
}

//练习8：求最大值函数
func maxOf(_ a: Int, _ b: Int) -> Int {
    if a > b {
        return a
    } else {
        return b
    }
}

func exercise8() {
    let result = maxOf(10, 7)
    print("max = \(result)")
}

//练习9：摄氏度转华氏度
func celsiusToFahrenheit(_ celsius: Double) -> Double {
    return celsius * 9 / 5 + 32
}

func exercise9() {
    let fahrenheit = celsiusToFahrenheit(25.0)
    print("25 摄氏度 = \(fahrenheit) 华氏度")
}

//练习10：guard 的使用: 前置检查 + 提前返回
func printAge(_ age: Int) {
    guard age >= 0 else {
        print("非法年龄")
        return
    }

    print("年龄是 \(age)")
}

func exercise10() {
    printAge(26)
    printAge(-1)
}


