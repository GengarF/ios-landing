import Foundation

struct Article: Equatable {
    let id: Int
    let title: String
    let author: String
    let summary: String
    var isLiked: Bool

    var likeText: String {
        isLiked ? "已点赞" : "未点赞"
    }
}