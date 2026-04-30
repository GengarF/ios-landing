import Foundation

class ViewController {
    let title: String

    init(title: String) {
        self.title = title
    }

    func viewDidLoad() {
        print("[ViewController] \(title) did load")
    }
}

/*
这里的 viewDidLoad() 是 iOS 里非常重要的概念。

可以先理解成：页面加载完成时，系统会调用的方法

真正 UIKit 里也有：override func viewDidLoad()
*/

/*
ViewController 可以先理解成“一个页面的控制器”。

它负责：

管理页面生命周期
准备页面数据
响应用户操作
触发页面跳转
*/