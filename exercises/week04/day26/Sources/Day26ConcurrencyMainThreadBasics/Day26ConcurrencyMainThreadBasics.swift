// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

@main
struct Day26ConcurrencyMainThreadBasics {
    static func main() {
        runDemo()
    }
}

func runDemo() {
    let simulator = AppSimulator()
    simulator.start()
}

/*
Day 26 主题

并发和主线程认知

今天先用纯 Swift 模拟 iOS 里的一个核心流程：

App 启动
-> 后台任务加载数据
-> 数据加载完成
-> 回到“主线程”更新 UI

今天不是要一下子精通 Swift Concurrency，而是建立这几个直觉：

- 耗时任务不能阻塞主线程
- UI 更新应该发生在主线程
- 异步任务完成后，通常通过 callback / completion 把结果传回来
- 命令行项目里没有真实 UIKit，今天只是模拟这个过程
*/