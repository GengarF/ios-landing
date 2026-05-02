import Foundation

struct Article {
    let id: Int
    let title: String
    let content: String

    var summary: String {
        "\(id). \(title)"
    }
}