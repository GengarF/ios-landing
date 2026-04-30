// The Swift Programming Language
// https://docs.swift.org/swift-book


/*
Day 23 主题

App / UIKit / ViewController 基础认知

App 启动 → 首页 ViewController → 列表数据 → 点击文章 → 跳转详情页

今天重点理解：

App 是怎么启动的
ViewController 是什么
页面为什么需要数据模型
首页 / 详情页是什么关系
页面之间怎么传数据
为什么 iOS 里经常有“列表页 → 详情页”


| iOS 概念                          | 今天的模拟类                       | 作用      |
| ------------------------------- | ---------------------------- | ------- |
| App 启动入口                        | `Day23AppUIKitBasics.main()` | 程序入口    |
| AppDelegate / SceneDelegate 的感觉 | `AppSimulator`               | 管理启动流程  |
| UIViewController                | `ViewController`             | 页面基类    |
| 首页                              | `HomeViewController`         | 展示文章列表  |
| 详情页                             | `DetailViewController`       | 展示单篇文章  |
| Model                           | `Article`                    | 页面使用的数据 |

*/


import Foundation

@main
struct Day23AppUIKitBasics {
    static func main() {
        runDemo()
    }
}

func runDemo() {
    let app = AppSimulator()
    app.start()
}

/*
Day23AppUIKitBasics.main()
-> runDemo()
-> AppSimulator.start()
-> 创建 articles
-> 创建 HomeViewController
-> HomeViewController.viewDidLoad()
-> 打印文章列表
-> 模拟点击第二篇文章
-> HomeViewController.selectArticle(at: 1)
-> 创建 DetailViewController
-> DetailViewController.viewDidLoad()
-> 打印文章详情

*/