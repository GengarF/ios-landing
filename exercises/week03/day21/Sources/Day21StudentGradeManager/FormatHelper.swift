import Foundation

func formatRecord(_ record: GradeRecord) -> String {
    let status = record.isPassed ? "Passed" : "Failed"
    return "[\(status)] #\(record.student.id) \(record.summary)"
}

func formatAverage(_ average: Double) -> String {
    String(format: "Average score: %.2f", average)
}
