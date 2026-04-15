// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

@main
struct Day02OptionalArrayStruct {
    static func main() {
        exercise1()
        exercise2()
        exercise3()
        exercise4()
        exercise5()
        exercise6()
        exercise7()
        exercise8()
    }
}

/*练习1：认识optional
定义一个 String? 类型的 nickname
初始值设为 "Gengar"
再定义一个 String? 类型的 emptyNickname
初始值设为 nil
分别打印它们
*/
func exercise1() {
    let nickname: String? = "Gengar"
    let emptyNickname: String? = nil

    print("nickname = \(String(describing: nickname))")
    print("emptyNickname = \(String(describing: emptyNickname))")
}

/*练习2：用if let解包
定义一个 String? 变量 city
值为 "Shanghai"
用 if let 解包
如果有值，打印“城市是 xxx”
否则打印“city 是 nil”
*/
func exercise2() {
    let city: String? = "Shanghai"

    if let realCity = city {
        print("city = \(realCity)")
    } else {
        print("city = nil")
    }
}

/*练习3：Optional 为 nil 的情况
定义一个 Int? 变量 age
值为 nil
用 if let 解包
如果有值打印年龄
否则打印“age 没有值”
*/
func exercise3() {
    let age: Int? = nil

    if let realAge = age {
        print("年龄是 \(realAge)")
    } else {
        print("age 没有值")
    }
}

/*练习4：Array数组基本操作
定义一个 [Int] 数组 scores
初始值为 [80, 90, 75]
追加一个 88
打印整个数组
打印第一个元素
打印数组长度
*/
func exercise4() {
    var scores = [80, 90, 75]
    scores.append(88)
    print(scores)
    print(scores[0])
    print(scores.count)
}

/*练习5：遍历数组
定义一个 [String] 数组 cities
值为 ["Shanghai", "Shenzhen", "Hangzhou"]
用 for in 遍历并逐个打印
*/
func exercise5() {
    let cities = ["Shanghai", "Shenzhen", "Hangzhou"]

    for city in cities {
        print(city)
    }
}

/*练习6：Dictionary字典基本操作
定义一个 [String: Int] 字典 scores
里面放：
"math": 90
"english": 85
打印整个字典
取出 "math" 对应的值
用 if let 解包后打印
*/
func exercise6() {
    let scores: [String: Int] = [
        "math": 90,
        "english": 85
    ]

    print("scores = \(scores)")

    if let mathScore = scores["math"] {
        print("math 分数是 \(mathScore)")
    } else {
        print("没有找到 math 分数")
    }
}

/*练习7：struct 
定义一个 struct Person
里面有两个属性：
name
age
创建一个 Person 实例
打印它的名字和年龄
*/
struct Person {
    var name: String
    var age: Int
}

func exercise7() {
    let person = Person(name: "Gengar", age: 26)
    print("person.name = \(person.name), person.age = \(person.age)")
    print(person)
}

/*练习8：class
写一个 class Car，要求：
有两个属性：
brand
year
写一个 init
在 exercise8() 里创建对象并打印属性
*/
class Car: CustomStringConvertible {
    var brand: String
    var year: Int

    init(brand: String, year: Int) {
        self.brand = brand
        self.year = year
    }

    var description: String {
        "Car(brand: \(brand), year: \(year))"
    }
}


func exercise8() {
    let car = Car(brand: "BYD", year: 5)
    print("car.brand = \(car.brand), car.year = \(car.year)")
    print(car)
}
