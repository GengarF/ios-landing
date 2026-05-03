import Foundation

struct Article: Sendable {
    let id: Int
    let title: String
    let content: String

    var summary: String {
        "\(id). \(title)"
    }
}
