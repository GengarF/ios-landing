// The Swift Programming Language
// https://docs.swift.org/swift-book


/*
做一个简单的成绩管理器：

一个学生有 id、name
一条成绩记录包含 student、subject、score
一个 GradeStore 负责保存和管理成绩记录
能添加成绩
能列出所有成绩
能筛选及格成绩
能计算平均分
能格式化输出
*/
import Foundation

@main
struct Day21StudentGradeManager {
    static func main() {
        runDemo()
    }

    private static func runDemo() {
        print("Day 21 Student Grade Manager")

        let student1 = Student(id: 1, name: "Gengar")
        let student2 = Student(id: 2, name: "Fan")
        let student3 = Student(id: 3, name: "Momo")

        let record1 = GradeRecord(student: student1, subject: "Swift", score: 95)
        let record2 = GradeRecord(student: student2, subject: "Math", score: 58)
        let record3 = GradeRecord(student: student3, subject: "English", score: 82)

        let store = GradeStore()
        store.add(record1)
        store.add(record2)
        store.add(record3)

        print("\nAll Records (\(store.allRecords.count)):")
        for record in store.allRecords {
            print(formatRecord(record))
        }

        print("\nPassed Records (\(store.passedRecords.count)):")
        for record in store.passedRecords {
            print(formatRecord(record))
        }

        print("\nSummary:")
        print(formatAverage(store.averageScore))
    }
}
