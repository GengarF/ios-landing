// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

@main
struct Day27MemoryManagementARC {
    static func main() {
        runDemo()
    }
}

func runDemo() {
    let simulator = AppSimulator()
    simulator.start()
}

/*
Day 27 主题

ARC / 内存管理 / 引用循环

今天要先建立这条直觉：

对象被 strong 引用 -> ARC 保留对象
strong 引用消失 -> ARC 释放对象
两个对象互相 strong 引用 -> 可能无法释放
weak / [weak self] -> 用来打破循环引用

今天重点不是背术语，而是通过 deinit 观察对象什么时候被释放。
*/
