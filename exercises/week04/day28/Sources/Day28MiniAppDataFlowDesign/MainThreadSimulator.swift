import Foundation

enum MainThreadSimulator {
    static func run(_ task: () -> Void) {
        print("MainThreadSimulator: 模拟切回主线程更新 UI")
        task()
    }
}

/*
真实 iOS 中通常是：

DispatchQueue.main.async {
    // 更新 UI
}

但现在在 Linux CLI 环境里，不是真正跑 UIKit 页面，所以这里用一个同步模拟器。

先理解语义：

网络请求在后台线程完成
页面更新应该回到主线程

Day28 先建立这个意识即可。
*/