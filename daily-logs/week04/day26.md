# Day 26

## 今日目标
- 建立并发和主线程的基础认知
- 理解为什么 UI 更新要在主线程
- 用纯 Swift 模拟后台任务和主线程更新
- 初步理解异步任务的直觉
- 跑通 day26 的练习项目

## 今日完成
- 定义了 `Article` 模型
- 定义了 `MockAPIService` 模拟后台加载数据
- 定义了 `MainThreadSimulator` 模拟主线程更新 UI
- 定义了 `AppSimulator` 组织完整异步流程
- 使用 `DispatchQueue.global().asyncAfter` 模拟后台异步任务
- 使用 completion callback 返回异步结果
- 使用 `@escaping` 标记稍后执行的 closure
- 使用 `DispatchSemaphore` 等待异步任务完成
- 跑通了 `swift run`

## 遇到的问题
- `@escaping` 是第一次正式接触，需要继续熟悉
- completion callback 的写法还需要多练几次
- `DispatchSemaphore` 目前只理解为命令行项目中等待异步任务完成的工具
- `MainThreadSimulator` 只是概念模拟，不是真正的 UIKit 主线程机制
- 还需要继续区分“后台加载数据”和“主线程更新 UI”的边界

## 今天印象最深的点
- 异步任务不会阻塞当前流程
- App 可以先展示 loading，再后台加载数据
- 数据加载完成后，通过 completion 把结果传回来
- UI 更新应该回到主线程
- 命令行项目如果不等待，异步任务可能还没完成程序就退出
- `@escaping` 表示 closure 会在函数返回之后才执行

## AI 协同记录
- 今天让 Codex 做了什么：
  - 让 Codex 解释 Day26 项目的异步流程
  - 让 Codex review completion、@escaping、文件职责和命名是否清晰

- Codex 给了哪些建议：
  - 检查异步流程是否清楚
  - 检查 `MockAPIService` 是否只负责模拟数据加载
  - 检查 `AppSimulator` 是否清楚表达 App start -> loading -> data loaded -> UI update
  - 提醒 `MainThreadSimulator` 只是概念模拟，不是真实主线程切换

- 我采纳了哪些：
  - 保留了多文件结构
  - 保留了 `MockAPIService` / `MainThreadSimulator` / `AppSimulator` 的职责划分
  - 保留了用 completion callback 表达异步结果回传的写法

- 我没有采纳哪些：
  - 暂时没有改成 `async/await`
  - 暂时没有引入 `Result<[Article], Error>`
  - 暂时没有做真实网络请求或真实 UIKit 主线程更新

- 为什么：
  - 当前 Day26 的目标是建立并发和主线程直觉
  - 现在不需要把练习复杂化
  - `async/await`、错误处理和真实 UIKit 主线程更新可以后面再学

## 自测问题
- 哪一段代码模拟后台任务？
- 为什么 `fetchArticles` 不能直接 return 文章数组？
- completion 是什么时候被调用的？
- 为什么这里需要 `@escaping`？
- `semaphore.wait()` 和 `semaphore.signal()` 分别做什么？
- `MainThreadSimulator` 是真实主线程切换吗？
- 真实 UIKit 中为什么 UI 更新要回到主线程？

## 明天计划
- 学习 ARC / 内存管理 / 引用循环
- 继续理解 iOS 工程中的常见基础问题