# Day29 学习日志

## 今日主题

AI 协同专场 3：Review Day28 小项目的数据流设计

## 今日目标

- 重新运行 Day28 小项目
- 让 Codex 解释 Day28 项目结构
- 让 Codex review APIService / Repository / Store / ViewController 的职责
- 让 Codex 指出命名、抽象、数据流方面的问题
- 不让 Codex 大改结构
- 自己判断哪些建议采纳，哪些暂不采纳
- 整理 AI 协同记录

## 今日任务

- [×] 重新运行 Day28 项目
- [×] 完成 Codex 解释型 review
- [×] 完成 Codex 工程型 review
- [×] 完成 Codex 小步优化建议收集
- [×] 整理 notes/week04/swift-basics-day29.md

## 今日 Codex Review 记录

### 我让 Codex 做了什么

- 让 Codex review Day28 Swift 小项目的数据流设计，但先不要直接改代码。
- review 范围限定在 APIService / Repository / Store / ListViewController / DetailViewController 的职责、命名、数据流清晰度，以及哪些地方更接近真实 iOS 工程。
- 要求 Codex 不引入 UIKit、不引入 async/await、不引入复杂架构、不为了高级而抽象。
- 在 review 后，让 Codex 只给 2 到 3 个最小优化建议。
- 最后采纳其中两个建议，让 Codex 按最小修改方案改代码，并用 `swift build` 和 `swift run` 验证。

### Codex 给了哪些建议

- 数据流整体清楚：`APIService -> Repository -> Store -> ViewController` 的方向是对的。
- `Repository` 现在只是透传 APIService 数据，但作为学习项目是合理的；真实工程里它可以逐步承担缓存、错误处理、DTO 转 Model 等职责。
- `Store` 作为统一状态源是合理的，`private(set)` 可以避免外部随意改状态。
- `DetailViewController` 只保存 `articleID + store`，不保存独立 Article 副本，这一点比较接近真实工程里的状态同步思路。
- 小步优化建议包括：让 APIService 的异步模拟更真实、给 Repository 增加最小错误意识、列表跳详情时只传 `articleID`。

### 我采纳了哪些建议

- 采纳了“Repository 增加最小错误意识”。
  - 把 `loadHomeArticles` 的 completion 从 `[Article]` 改成 `Result<[Article], Error>`。
  - 当前 APIService 仍然只返回成功，但上层已经开始具备处理成功 / 失败两条路径的意识。
- 采纳了“列表跳详情时只传 `articleID`”。
  - `ArticleListViewController` 的点击回调从 `(Article) -> Void` 改成 `(Int) -> Void`。
  - `AppSimulator` 根据 `articleID` 从 `Store` 中重新取最新 Article，再打开详情页。

### 我没有采纳哪些建议

- 没有采纳“通过 `DispatchQueue.global().asyncAfter` 模拟异步网络请求”。

### 为什么没有采纳

- 当前项目使用 Swift 6，`DispatchQueue.global().asyncAfter` 的闭包会涉及 `@Sendable` 检查。
- 如果在这个阶段强行模拟后台线程，就会把学习重点从 App 数据流转移到 Swift 并发隔离、闭包捕获和 Sendable 上。
- Day28 的核心目标是先理解数据如何从服务层进入 App、如何进入 Store、如何被列表页和详情页共同使用。
- 所以暂时保留 completion 风格的数据返回，不做真正后台线程模拟，是更适合当前学习阶段的取舍。

## 今日理解

- 学习项目不是越接近真实工程越好，而是要看当前阶段最重要的学习目标是什么。
- `Repository` 的价值不是当前写了多少逻辑，而是让 ViewController 不直接依赖 APIService 的细节。
- `Store` 可以作为统一状态源，避免列表页和详情页各自保存一份数据后出现状态不同步。
- 页面跳转时传 `id` 比传完整对象更稳定，详情页需要展示时再从统一状态源取最新数据。
- AI 给出的建议也需要自己判断，不适合当前学习阶段的建议可以暂时不采纳。

## 今日遇到的问题

- 想用 `DispatchQueue.global().asyncAfter` 模拟异步请求时，遇到了 Swift 6 的 `@Sendable` 检查问题。
- `swift run` 能打印完整正确流程，但当前环境下命令最后返回了 `139`；直接运行 `.build/debug/Day28MiniAppDataFlowDesign` 可以正常结束。
- 这说明项目业务流程本身没问题，但本地 Swift 工具链或运行环境可能还有额外问题需要以后再排查。

## 明天计划

进入 Day30，开始 Objective-C 基础 1 / 或根据当前统一计划进入下一阶段主题。
