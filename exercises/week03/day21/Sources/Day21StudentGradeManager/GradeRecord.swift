import Foundation

struct GradeRecord {
    var student: Student
    var subject: String
    var score: Int

    var isPassed: Bool {
        score >= 60
    }

    var summary: String {
        "\(student.name) - \(subject): \(score)"
    }
}
/*
isPassed 是计算属性，不需要真的存
summary 也是计算属性，用来生成展示文字

存储属性负责状态，计算属性负责派生结果。
*/