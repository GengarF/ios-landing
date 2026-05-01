// The Swift Programming Language
// https://docs.swift.org/swift-book

/*
Day 24：页面和数据流

今天重点不是新语法，而是理解：

数据从哪里来，怎么进入页面，用户操作后状态怎么变化。

也就是：

数据模型 → 数据仓库 → 列表页 → 详情页 → 点赞/状态变化
*/

import Foundation

@main
struct Day24PageDataFlow {
    static func main() {
        runDemo()
    }
}

func runDemo() {
    let simulator = AppFlowSimulator()
    simulator.start()
}