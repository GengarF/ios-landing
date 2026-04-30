# Swift Basics Day 23

## 今天学了什么
- App 启动流程的基本感觉
- ViewController 的基础概念
- 首页和详情页的关系
- 页面之间的数据传递
- 用纯 Swift 模拟 UIKit 页面流程

## 核心理解
- ViewController 可以先理解成“页面控制器”
- Model 负责表示页面需要的数据
- 首页通常展示列表数据
- 详情页通常展示某一个具体对象
- 页面跳转时经常伴随数据传递
- App 启动后会进入一套页面流程

## 今天的文件职责
- Article.swift：文章数据模型
- ViewController.swift：页面基类
- HomeViewController.swift：首页，展示文章列表
- DetailViewController.swift：详情页，展示单篇文章
- AppSimulator.swift：模拟 App 启动和页面跳转
- Day23AppUIKitBasics.swift：程序入口

## 和真实 UIKit 的对应关系
- ViewController 类似 UIKit 里的 UIViewController
- viewDidLoad 类似 UIKit 页面加载完成后的生命周期方法
- HomeViewController 类似列表页
- DetailViewController 类似详情页
- AppSimulator 模拟 App 启动和页面流转

## 今天最重要的收获
- 我开始理解 iOS App 不是只有语法，而是由页面、数据和事件组成
- 页面之间传数据是 iOS 开发里很常见的模式
- ViewController 是理解 UIKit 的关键入口