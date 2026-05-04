# Stage4 Summary - Week4：iOS 工程表达与 App 数据流认知

## 0. 阶段定位

Stage4 对应 Week4，是从 Swift 语法练习转向 iOS 工程认知的一周。

这一阶段的核心不是继续堆语法点，而是开始理解一个 App 中“页面、数据、状态、事件、异步、内存管理”如何共同工作。

阶段关键词：

```text
App 生命周期
事件驱动
ViewController
页面数据流
APIService
Repository
Store
统一状态源
异步回调
主线程更新 UI
ARC
weak self
AI Review
```

一句话总结：

> Stage4 让我从“会写一些 Swift 代码”，开始过渡到“能看懂一个简单 iOS 模块的数据流和职责划分”。

---

## 1. 本阶段目标

本阶段希望建立这些基础工程直觉：

1. App 不是从上到下执行完就结束的脚本，而是由生命周期、用户事件、网络返回和状态变化驱动。
2. ViewController 可以先理解为页面控制者，负责连接页面展示、用户事件、数据加载和页面跳转。
3. 列表页和详情页之间的数据传递要考虑状态同步，不能随意复制数据。
4. 网络请求、数据获取、状态保存、页面展示应该有基本分层，不能全部塞进 ViewController。
5. Store 可以作为统一状态源，减少列表页和详情页状态不一致的问题。
6. 异步任务完成后，UI 更新要回到主线程。
7. ARC 会自动管理对象生命周期，但 strong 引用循环、closure 捕获 self、delegate 持有关系仍然需要开发者理解。
8. AI 可以辅助解释和 review 代码，但不能替代自己的判断。

---

## 2. 每日主题速览

| Day | 主题 | 核心收获 |
| --- | --- | --- |
| Day23 | App / ViewController 基本认知 | App 是事件驱动的，ViewController 是页面控制者 |
| Day24 | 页面和数据流概念 | 列表页和详情页要考虑传对象还是传 id，以及状态同步问题 |
| Day25 | 网络与数据层认知 | APIService、Repository、Store 各自承担不同职责 |
| Day26 | 并发和主线程认知 | 网络等耗时任务异步执行，UI 更新回主线程 |
| Day27 | ARC / 内存管理 / 引用循环 | strong、weak、closure 捕获 self、delegate weak 是 iOS 基础意识 |
| Day28 | 小项目 2：设计版 App 数据流 | 用纯 Swift 模拟 App 启动、加载、展示、点击、详情、点赞的数据流 |
| Day29 | AI 协同 Review | 训练让 Codex 解释、review、小步优化，而不是直接重写项目 |

---

## 3. 核心知识图谱

Day28 小项目的数据流可以概括为：

```text
AppSimulator
-> ArticleListViewController.viewDidLoad
-> ArticleRepository.loadHomeArticles
-> ArticleAPIService.fetchArticles
-> MainThreadSimulator.run
-> ArticleStore.replaceArticles
-> ArticleListViewController.render
-> 用户点击文章
-> AppSimulator.openDetail
-> ArticleDetailViewController
-> ArticleStore.toggleLike
-> Detail render / List render
```

更抽象地看：

```text
用户事件
-> ViewController
-> Repository
-> APIService
-> 异步回调
-> 主线程语义
-> Store 更新状态
-> ViewController 根据状态刷新页面
```

这条链路是 Stage4 最重要的复习对象。

---

## 4. 核心概念总结

### 4.1 App 不是脚本，而是事件驱动系统

CLI 程序通常是：

```text
main 开始
执行代码
打印结果
程序结束
```

iOS App 更像是：

```text
App 启动
页面展示
等待用户操作
响应点击、滑动、输入
发起异步任务
网络返回
刷新页面
进入下一页面
继续等待事件
```

所以读 App 代码时，不应该只找 `main`，而要找事件入口：

- `viewDidLoad`
- `viewWillAppear`
- button action
- table / collection selection
- network completion
- notification callback
- delegate callback

### 4.2 ViewController 是页面控制者

当前阶段可以先这样理解：

```text
Model：描述数据
View：展示内容
ViewController：连接数据、页面、用户事件和跳转
```

ViewController 常见职责：

- 初始化页面
- 发起数据加载
- 接收用户事件
- 更新 UI
- 管理页面跳转
- 处理页面生命周期

但它不应该承担所有职责。网络请求、缓存、复杂状态管理如果都堆在 ViewController 里，代码会很快变重。

### 4.3 列表页和详情页的数据传递

列表页进入详情页时，常见两种方式：

```swift
openDetail(article: article)
```

传完整对象简单，但如果详情页修改了状态，列表页里的对象副本可能不同步。

```swift
openDetail(articleID: article.id)
```

传 id 后，详情页可以从统一状态源读取最新数据，更适合点赞、收藏、关注这类状态会变化的场景。

核心问题不是“能不能传”，而是：

> 修改发生后，谁是最新、可信、唯一的数据来源？

### 4.4 APIService、Repository、Store 的职责

Stage4 的分层可以先记成：

```text
APIService：怎么请求数据
Repository：为业务获取什么数据
Store：保存和修改当前模块状态
ViewController：展示状态并响应用户事件
Model：描述数据结构
```

在 Day28 中：

- `ArticleAPIService` 模拟异步网络请求
- `ArticleRepository` 隐藏数据获取细节
- `ArticleStore` 保存文章列表和点赞状态
- `ArticleListViewController` 负责列表展示和点击
- `ArticleDetailViewController` 负责详情展示和点赞
- `AppSimulator` 负责组装对象和协调跳转

### 4.5 Store 是统一状态源

如果列表页和详情页各自保存一份 `Article`，就可能出现：

```text
列表页 Article：未点赞
详情页 Article：已点赞
```

有了 Store 后：

```text
列表页从 Store 读数据
详情页从 Store 读数据
详情页点赞时修改 Store
列表页重新 render 时读到最新状态
```

这就是统一状态源的价值。

`private(set)` 的意义：

```swift
private(set) var articles: [Article] = []
```

外部可以读，但不能直接乱改，只能通过 `replaceArticles`、`toggleLike`、`article(id:)` 等方法修改状态。这样状态变化路径更清楚。

### 4.6 异步、completion、@escaping 和主线程

网络请求不是立刻返回的，所以需要异步机制：

```swift
func fetchArticles(completion: @escaping ([Article]) -> Void)
```

我的理解：

```text
completion：异步任务结束后通知调用方
@escaping：closure 会在函数返回后，未来某个时刻再执行
主线程：真实 UIKit 更新 UI 的线程
```

典型 iOS 流程：

```text
后台线程请求数据
数据返回
切回主线程
更新 UI
```

Day28 的 `MainThreadSimulator` 不是真正的主线程切换，它只是帮助建立“UI 更新要回到主线程”的意识。

### 4.7 ARC、weak self 和 delegate weak

ARC 的基本模型：

```text
class 对象被 strong 引用时不会释放
strong 引用消失后引用计数减少
引用计数为 0 时触发 deinit
```

需要重点警惕：

- 两个对象互相 strong 持有
- closure 强捕获 self
- delegate 被 strong 持有
- timer / notification / callback 没有释放

closure 捕获 self 的典型风险：

```text
ViewController strong -> closure
closure strong -> ViewController
```

常见处理方式：

```swift
repository.loadHomeArticles { [weak self] articles in
    self?.render()
}
```

delegate 常用 `weak`，是因为 delegate 通常只是回调通知关系，不应该拥有对方。

### 4.8 AI 协同 Review 的正确姿势

Day29 的重点不是让 Codex 重写项目，而是训练真实工作里更常见的协同方式：

```text
我先写第一版
AI 帮我解释
AI 帮我 review
我判断建议是否合理
我只做小步、安全、能解释的修改
```

推荐 prompt：

```text
请先解释这个模块，不要修改代码。
请说明每个文件的职责。
请画出数据流。
请指出用户点击后的调用链。
请指出网络返回后 UI 在哪里刷新。
```

Review prompt：

```text
请 review 这个学习项目的职责划分和数据流。
只给小步优化建议。
不要引入 UIKit、async/await 或复杂架构。
不要重写整个项目。
```

AI 的价值：

- 加速理解陌生代码
- 帮忙发现命名、职责、边界问题
- 帮忙列出小步优化建议
- 帮忙训练自己讲清楚代码

AI 的风险：

- 过度设计
- 引入当前阶段不该学的技术
- 大范围重构
- 解释看似合理但没有证据

---

## 5. Stage4 最重要的 10 个结论

1. App 是事件驱动的，不是线性脚本。
2. ViewController 是页面控制者，但不应该什么都干。
3. 页面之间传数据要考虑状态同步，不只是考虑传参方便。
4. 状态会变化时，详情页保存 id 并从 Store 读取，通常比保存对象副本更稳。
5. APIService 负责请求细节，Repository 负责业务数据获取入口。
6. Store 是统一状态源，可以让多个页面共享最新状态。
7. 异步任务通过 completion 等机制把结果返回给调用方。
8. UIKit UI 更新要回到主线程。
9. ARC 自动管理内存，但 strong 引用循环仍然需要开发者处理。
10. AI 应该用于解释、review、小步优化，而不是替自己盲目决策。

---

## 6. 入职工作迁移

Stage4 对入职后的帮助很直接。以后看一个页面，可以按这个顺序问：

```text
1. 这个页面展示什么？
2. 页面对应的 Model 是什么？
3. 数据从哪里来？
4. 是谁发起请求？
5. Repository / ViewModel / Store 分别在哪里？
6. 状态保存在哪里？
7. 用户点击事件在哪里？
8. 页面跳转在哪里？
9. 网络返回后在哪里刷新 UI？
10. closure 里有没有 self？是否有生命周期风险？
```

如果修“点赞后列表页没更新”这类 Bug，可以按这个链路排查：

```text
1. 详情页点击事件有没有触发？
2. toggleLike 有没有执行？
3. 修改的是 Store，还是详情页自己的副本？
4. 列表页和详情页是不是同一个 Store？
5. 列表页返回后有没有重新 render / reloadData？
6. UI 更新是否在主线程？
```

---

## 7. 仍然薄弱的地方

后续还需要继续补强：

- `@escaping` 的更多使用场景
- `[weak self]` 什么时候必须用，什么时候不一定需要
- Repository、Store、ViewModel 在真实项目中的边界
- UIKit 中真实的 `reloadData`、页面跳转、cell 配置
- URLSession、JSON、Codable、错误处理、loading / empty / error 状态
- AI Review 的判断力：如何识别过度设计，如何只采纳小步建议

这些不是 Stage4 必须全部解决的问题。Stage4 的任务是先建立工程直觉，后面再通过真实 UIKit 和网络项目补细节。

---

## 8. 复习自测题

### 8.1 App / ViewController

1. App 和 CLI 程序最大的区别是什么？

   App 不是从上到下一次性执行完的程序，而是长期运行、等待生命周期事件、用户操作和异步回调；CLI 程序通常按固定顺序执行，执行完就退出。

2. 为什么说 App 是事件驱动的？

   因为 App 的大部分代码是在事件发生时被系统或用户触发的，例如页面加载、按钮点击、网络返回、页面跳转、App 进入后台等。

3. ViewController 的核心职责是什么？

   ViewController 负责管理一个页面的展示、用户交互和页面生命周期，把用户行为转成对数据层或状态层的调用，再根据状态刷新 UI。

4. 真实项目里为什么不能把所有逻辑都塞进 ViewController？

   因为 ViewController 如果同时负责 UI、网络、状态、业务规则和数据处理，会很快变得臃肿、难测试、难复用，也更容易产生状态混乱和 Bug。

### 8.2 页面数据流

1. 列表页进入详情页时，传完整对象和传 id 有什么区别？

   传完整对象是把当前那一份数据副本交给详情页；传 id 是只告诉详情页要展示哪条数据，详情页再从统一状态源中读取最新数据。

2. 什么情况下传 id 更合适？

   当数据可能被多个页面修改，或者需要保证详情页始终读取最新状态时，传 id 更合适，例如点赞、收藏、评论数变化等场景。

3. 状态不同步通常是怎么发生的？

   通常是因为列表页和详情页各自保存了一份数据副本，一个页面改了自己的副本，另一个页面没有同步更新。

4. Store 为什么可以减少状态不同步？

   Store 把状态集中保存成统一来源，列表页和详情页都从同一个地方读取和修改数据，减少多份副本互相不一致的问题。

### 8.3 网络与数据层

1. APIService 负责什么？

   APIService 负责表达“怎么请求数据”，例如调用接口、模拟网络返回、处理请求参数和原始响应。

2. Repository 负责什么？

   Repository 负责隐藏数据来源细节，对上层提供更稳定的数据获取入口；真实项目中还可能负责缓存、DTO 转 Model、错误转换等。

3. Store 负责什么？

   Store 负责保存 App 当前状态，并提供修改状态的方法，让页面可以读取、更新和共享同一份数据。

4. 为什么 Repository 和 APIService 在小项目中看起来很像，但真实项目中会逐渐分化？

   小项目里数据来源单一、逻辑很少，所以 Repository 可能只是转发 APIService；真实项目中会加入缓存、兜底、数据转换、分页、错误处理等职责，两者边界会变清楚。

### 8.4 异步和主线程

1. completion callback 是什么？

   completion callback 是任务完成后执行的闭包，常用于异步操作结束时把结果传回调用方。

2. 为什么异步 completion 通常需要 `@escaping`？

   因为异步任务的 completion 往往会在函数返回之后才执行，closure 需要逃逸出当前函数作用域，所以要标记 `@escaping`。

3. 为什么 UI 更新要回到主线程？

   因为 iOS 的 UI 系统主要在主线程工作，如果在后台线程更新 UI，可能导致显示错乱、竞争问题或崩溃。

4. Day28 的 `MainThreadSimulator` 模拟了什么？

   它模拟了真实 iOS 中“网络或异步任务完成后，把 UI 更新切回主线程执行”的动作。

### 8.5 ARC 和 weak self

1. ARC 是什么？

   ARC 是 Automatic Reference Counting，自动引用计数。它会根据对象的强引用数量自动决定 class 实例什么时候释放。

2. 什么是 strong 引用？

   strong 引用表示持有对象，会让对象的引用计数增加；只要还有 strong 引用，对象通常就不会被释放。

3. 什么是引用循环？

   引用循环是两个或多个对象互相 strong 持有，导致它们的引用计数都无法归零，从而不能释放。

4. closure 捕获 self 为什么可能造成内存问题？

   如果对象 strong 持有 closure，而 closure 又 strong 捕获 self，就会形成“对象持有 closure，closure 持有对象”的循环引用。

5. delegate 为什么通常是 weak？

   因为 delegate 通常是反向通知关系，被代理对象不应该强持有它的 delegate；用 weak 可以避免两个对象互相持有造成引用循环。

### 8.6 AI 协同

1. 为什么不能一上来让 Codex 大改项目？

   因为大改容易引入超出当前学习目标的抽象和复杂度，也会让自己失去判断代码变化的能力。更适合先让 Codex 解释、review，再小步采纳。

2. 解释型 review 和工程 review 的区别是什么？

   解释型 review 重点是帮我看懂代码在做什么；工程 review 重点是检查职责边界、命名、数据流、潜在 Bug 和可维护性问题。

3. 如何判断 AI 建议是否过度设计？

   看它是否解决当前真实问题，是否明显增加文件、抽象和概念负担，是否超出当前阶段学习目标。如果收益不清楚，就可能是过度设计。

4. 为什么 AI 给出建议后仍然要自己验证？

   因为 AI 可能误判上下文、引入不适合当前阶段的方案，甚至给出不能运行的代码。最终是否采纳、是否正确、是否符合目标，都需要自己验证。

---

## 9. 我应该能脱稿说清楚的话

Stage4 结束后，我应该能用自己的话说清楚：

1. App 的代码不是线性执行，而是由生命周期、用户事件和异步回调驱动。
2. ViewController 管理页面展示和用户行为，但复杂数据获取和状态保存应该拆出去。
3. APIService 表达网络请求，Repository 隐藏数据获取细节，Store 保存统一状态。
4. 列表页和详情页共享 Store，可以避免点赞状态不同步。
5. 详情页保存 articleID，再从 Store 读取最新 Article，比保存独立 Article 副本更适合状态会变化的场景。
6. 异步请求完成后，真实 iOS 中 UI 更新应该回到主线程。
7. `@escaping` 表示 closure 可能在函数返回后才执行。
8. ARC 自动管理 class 对象，但 strong 引用循环、closure 捕获 self、delegate 持有关系仍然需要关注。
9. Codex 适合帮我解释、review、列小步优化建议，但最终判断和交付责任在我。

---

## 10. 后续行动

进入下一阶段前，优先确认：

- Day28 项目可以正常运行
- 能画出 Day28 的完整数据流
- 能说清楚 Store 为什么是统一状态源
- 能说清楚 `@escaping`、`[weak self]` 和引用循环的基本关系
- 能用 AI 做一次解释型 review，并判断建议是否值得采纳

下一阶段重点：

- 继续推进 Week5 内容
- 后续借助 Mac / Xcode 进入真实 UIKit
- 把当前的 CLI 数据流认知迁移到 ViewController、tableView、网络请求和页面跳转中
