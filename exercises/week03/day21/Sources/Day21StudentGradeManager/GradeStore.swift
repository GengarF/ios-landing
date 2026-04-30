import Foundation

final class GradeStore {
    private var records: [GradeRecord] = []

    init(records: [GradeRecord] = []) {
        self.records = records
    }

    func add(_ record: GradeRecord) {
        records.append(record)
    }

    var allRecords: [GradeRecord] {
        records
    }

    var passedRecords: [GradeRecord] {
        records.filter { $0.isPassed }
    }

    var averageScore: Double {
        guard !records.isEmpty else {
            return 0
        }

        let total = records.reduce(0) { partial, record in
            partial + record.score
        }

        return Double(total) / Double(records.count)
    }
}

/*
records 用 private，外部不能随便改
外部只能通过 add() 添加数据
passedRecords() 用 filter
averageScore() 用 reduce
GradeStore 用 class 是合理的，因为它像一个“共享管理器”
*/
