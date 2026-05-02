import Foundation

enum NetworkError: Error {
    case serverError
    case emptyResponse
}

/*
今天先只模拟两个错误：

serverError：服务器错误
emptyResponse：返回结果为空
*/