# Swift Basics Day 26

## 今日主题

并发和主线程认知。

今天用纯 Swift 命令行项目模拟 iOS 中非常常见的一条流程：

```text
App 启动
-> 展示 loading
-> 后台加载数据
-> 数据加载完成
-> 回到主线程更新 UI
```

今天不是为了彻底学完 Swift 并发，而是先建立 iOS 开发里的关键直觉：

- 耗时任务不要阻塞主线程
- 数据加载可以放到后台执行
- 异步任务完成后，需要把结果传回来
- UI 更新应该回到主线程
- completion callback 是异步结果回传的一种常见方式

---

## 1. 同步任务和异步任务

### 同步任务

同步任务就是代码按顺序执行。

```swift
print("A")
print("B")
print("C")
```

输出一定是：

```text
A
B
C
```

同步任务的特点是：

> 上一行代码没有执行完，下一行代码不会开始。

这种方式最容易理解，但如果某一行代码很耗时，比如网络请求、图片处理、文件读写，就可能把当前线程卡住。

---

### 异步任务

异步任务是：

> 把任务交出去，让它稍后执行；当前代码继续往下走。

例如：

```swift
print("A")

DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
    print("B")
}

print("C")
```

输出通常是：

```text
A
C
B
```

原因是：

- `A` 先打印
- `B` 被放到后台队列，1 秒后才执行
- 当前代码不会等 `B`，所以先继续打印 `C`

这说明异步任务不会阻塞当前流程。

---

## 2. DispatchQueue.global()

`DispatchQueue.global()` 可以先理解成：

> 系统提供的后台队列。

在 iOS 开发中，耗时任务通常不应该直接放在主线程执行，例如：

- 网络请求
- 图片解码
- 文件读写
- 大量计算
- 数据解析

如果这些任务放在主线程，用户界面可能会卡顿。

常见写法是：

```swift
DispatchQueue.global().async {
    // 后台执行任务
}
```

Day26 里我们用的是：

```swift
DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
    // 延迟 1 秒后执行
}
```

它表示：

> 把任务放到后台队列，并且延迟 1 秒执行。

今天我们用它模拟“后台加载数据”。

---

## 3. asyncAfter

`asyncAfter` 表示延迟一段时间后异步执行任务。

```swift
DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
    print("task finished")
}
```

可以理解成：

> 1 秒后，在后台队列执行 closure 中的代码。

Day26 里它模拟的是：

```text
网络请求 / 后台数据加载需要一点时间
```

虽然我们没有真的请求网络，但这个延迟能帮助理解真实 App 中的异步流程。

---

## 4. completion callback

异步任务不会立刻返回结果，所以不能简单写成：

```swift
let articles = fetchArticles()
```

因为文章数据可能 1 秒后才加载完成。

所以我们会把“数据加载完成后要做的事情”作为 closure 传进去：

```swift
func fetchArticles(completion: @escaping ([Article]) -> Void) {
    DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
        let articles = [
            Article(id: 1, title: "Concurrency Basics", content: "Learn background tasks.")
        ]

        completion(articles)
    }
}
```

这里的 `completion` 可以理解成：

> 任务完成后要执行的回调。

`completion(articles)` 的意思是：

> 数据加载完成了，现在把文章数组传回给外部。

也就是说，异步函数不是直接 `return` 结果，而是在未来某个时间点通过 `completion` 把结果交出去。

---

## 5. @escaping

Day26 里会看到这样的函数签名：

```swift
func fetchArticles(completion: @escaping ([Article]) -> Void)
```

这里的 `@escaping` 表示：

> 这个 closure 可能会在当前函数返回之后才执行。

为什么这里需要 `@escaping`？

因为 `fetchArticles` 函数本身会很快执行完，但是里面的异步任务会在 1 秒后才执行：

```swift
DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
    completion(articles)
}
```

也就是说：

```text
fetchArticles 已经结束了
但是 completion 还会在稍后被调用
```

所以 Swift 要求显式标记为 `@escaping`。

可以先这样记：

> 如果 closure 会被保存起来，或者会在函数返回之后才执行，通常就需要 `@escaping`。

---

## 6. 为什么 UI 要在主线程更新

iOS 的 UI 系统不是线程安全的。

真实 UIKit 中，下面这些 UI 操作应该在主线程执行：

```swift
label.text = "Loaded"
tableView.reloadData()
view.backgroundColor = .red
```

如果在后台线程直接更新 UI，可能导致：

- UI 显示异常
- 随机 bug
- 崩溃
- 难以复现的问题

真实 UIKit 中常见写法是：

```swift
DispatchQueue.main.async {
    // update UI here
}
```

或者使用 Swift Concurrency 里的：

```swift
@MainActor
```

Day26 里还没有真正使用 UIKit，所以用了一个 `MainThreadSimulator` 来表达这个概念。

注意：

> `MainThreadSimulator` 只是概念模拟，不是真正的主线程切换。

---

## 7. DispatchSemaphore

Swift 命令行程序和 iOS App 不一样。

iOS App 会一直运行，等待用户操作。  
但命令行程序如果主流程执行完，就会直接退出。

问题是：

```text
异步任务可能还没执行完，程序就结束了。
```

所以 Day26 使用：

```swift
let semaphore = DispatchSemaphore(value: 0)
```

在主流程末尾等待：

```swift
semaphore.wait()
```

在异步任务完成后通知：

```swift
semaphore.signal()
```

可以先理解成：

> 让命令行程序等异步任务完成后再退出。

但是要特别注意：

> 真实 iOS App 中，不要随便用 semaphore 阻塞主线程。

今天用 `DispatchSemaphore` 只是为了让命令行项目能完整看到异步输出。

---

## 8. Day26 项目文件职责

### `Article.swift`

定义文章数据模型。

```swift
struct Article {
    let id: Int
    let title: String
    let content: String

    var summary: String {
        "\(id). \(title)"
    }
}
```

这里 `Article` 是普通数据模型，用 `struct` 很合适。

---

### `MockAPIService.swift`

模拟后台加载文章数据。

它负责：

- 打印开始加载
- 使用 `DispatchQueue.global().asyncAfter` 模拟后台任务
- 生成 mock 文章数据
- 通过 `completion(articles)` 把结果传回去

核心逻辑：

```swift
func fetchArticles(completion: @escaping ([Article]) -> Void) {
    DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
        let articles = [...]
        completion(articles)
    }
}
```

---

### `MainThreadSimulator.swift`

模拟“这里应该回到主线程更新 UI”。

它负责：

- 打印主线程更新提示
- 执行传进来的 UI 更新 action

```swift
func runOnMainThread(_ action: () -> Void) {
    print("[MainThreadSimulator] simulate UI update on main thread")
    action()
}
```

今天它只是概念模拟。真实 UIKit 中应该使用 `DispatchQueue.main.async` 或 `@MainActor`。

---

### `AppSimulator.swift`

组织完整流程。

它负责：

1. App 启动
2. 展示 loading
3. 调用 `MockAPIService` 加载数据
4. 数据加载完成后进入 completion
5. 调用 `MainThreadSimulator` 模拟主线程更新 UI
6. 渲染文章列表
7. 使用 `DispatchSemaphore` 等待异步任务完成
8. 打印结束

---

### `Day26ConcurrencyMainThreadBasics.swift`

程序入口。

它只负责创建 `AppSimulator` 并启动 demo：

```swift
func runDemo() {
    let simulator = AppSimulator()
    simulator.start()
}
```

---

## 9. Day26 核心流程

完整流程是：

```text
App 启动
-> 展示 loading
-> 调用 fetchArticles
-> 后台队列开始加载数据
-> 1 秒后生成文章数据
-> completion 回传文章数组
-> 模拟回到主线程更新 UI
-> 渲染文章列表
-> semaphore signal
-> 命令行程序结束
```

对应代码大概是：

```swift
print("[App] show loading")

apiService.fetchArticles { articles in
    print("[App] data loaded")

    self.mainThreadSimulator.runOnMainThread {
        print("[UI] render articles")

        for article in articles {
            print("- \(article.summary)")
        }
    }

    semaphore.signal()
}

semaphore.wait()
```

---

## 10. 今日核心理解

今天最重要的不是背下所有 API，而是理解这些关系：

### 后台任务

```swift
DispatchQueue.global().asyncAfter
```

用来模拟耗时任务，比如网络请求。

### completion

```swift
completion(articles)
```

用来把异步结果传回外部。

### @escaping

因为 completion 会在函数返回之后才执行，所以需要 `@escaping`。

### 主线程更新 UI

真实 UIKit 中，UI 更新应该回到主线程。

### DispatchSemaphore

今天只用于命令行项目，防止程序在异步任务完成前退出。

---

## 11. 今天还没有深入的内容

Day26 只是建立并发和主线程的直觉，还没有正式深入：

- `async / await`
- `Task`
- `MainActor`
- `Result`
- 异步错误处理
- 真实 `URLSession`
- UIKit 中真实 UI 更新
- 线程安全问题
- 数据竞争

这些会在后面继续学。

---

## 12. 自测问题

1. `DispatchQueue.global().asyncAfter` 模拟了什么？

它模拟了一个“后台异步任务”。

```swift
DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
    ...
}
```

含义是：把 `{ ... }` 里的代码放到后台队列，等 1 秒后再执行。

在真实 App 里，这通常对应：

- 网络请求
- 读取文件
- 解析大 JSON
- 数据库查询
- 图片处理

这些任务可能比较耗时，不应该卡住主线程，所以通常会放到后台执行。

2. 为什么 `fetchArticles` 不能直接 `return [Article]`？

因为文章数据不是立刻准备好的。

同步函数可以直接返回：

```swift
func fetchArticles() -> [Article] {
    return articles
}
```

但当前练习模拟的是异步加载：

```text
1 秒后才拿到 articles
```

当 `fetchArticles` 被调用时，函数本身很快就结束了，真正的数据要等后台 closure 执行时才产生。

所以不能直接：

```swift
return articles
```

而要使用：

```swift
completion(articles)
```

意思是：等数据准备好了，再把结果交回调用方。

3. `completion` 是什么时候被调用的？

`completion` 是在后台任务完成后调用的。

代码位置：

```swift
DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
    let articles = [...]
    completion(articles)
}
```

执行流程：

```text
fetchArticles 被调用
-> 打印 start loading
-> 安排一个 1 秒后的后台任务
-> fetchArticles 函数先结束
-> 1 秒后创建 articles
-> 调用 completion(articles)
```

所以 `completion` 不是马上调用，而是大约 1 秒后调用。

4. `@escaping` 为什么需要出现在这里？

因为 `completion` 会“逃出” `fetchArticles` 函数本身的执行范围。

```swift
func fetchArticles(completion: @escaping @Sendable ([Article]) -> Void) {
    DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
        completion(articles)
    }
}
```

`fetchArticles` 调用后会很快结束，但 `completion` 要等 1 秒后才执行。

也就是说，`completion` 被异步 closure 保存起来，晚点再用。这种情况必须写：

```swift
@escaping
```

如果 closure 只是立刻执行，就不需要 `@escaping`：

```swift
func doSomething(action: () -> Void) {
    action()
}
```

5. `semaphore.wait()` 和 `semaphore.signal()` 分别做什么？

`semaphore.wait()` 表示等待：

```swift
semaphore.wait()
```

它会卡住当前线程，直到有人发出 signal。

`semaphore.signal()` 表示通知可以继续：

```swift
semaphore.signal()
```

它告诉等待中的地方：“异步任务完成了，可以继续执行了。”

在当前项目里的作用是：

```text
start()
-> 发起异步加载
-> semaphore.wait() 等着
-> completion 执行完后 semaphore.signal()
-> wait 放行
-> print("[App] finished")
```

这里使用 semaphore 是为了命令行 demo 不要在异步任务完成前直接退出。

注意：真实 iOS App 里通常不要用 `semaphore.wait()` 卡主线程。主线程如果被卡住，界面会冻结。

6. `MainThreadSimulator` 今天到底是真主线程切换，还是概念模拟？

它是概念模拟，不是真正的主线程切换。

当前代码：

```swift
func runOnMainThread(_ action: () -> Void) {
    print("[MainThreadSimulator] simulate UI update on main thread")
    action()
}
```

它只是打印一句提示，然后直接执行 `action()`。

它没有使用：

```swift
DispatchQueue.main.async
```

也没有使用：

```swift
@MainActor
```

所以它不是真的把代码切回主线程。它今天的价值是帮助理解这个流程：

```text
后台加载数据
-> 数据完成
-> 回到主线程更新 UI
```

7. 真实 UIKit 里，为什么 UI 更新要回到主线程？

因为 UIKit 不是线程安全的。

这些 UI 操作都应该在主线程执行：

```swift
label.text = "Hello"
tableView.reloadData()
view.backgroundColor = .red
navigationController?.pushViewController(...)
```

如果后台线程也去改 UI，可能出现：

- 界面状态错乱
- 偶发 crash
- 刷新不及时
- 动画异常
- 数据和 UI 不一致

所以真实 UIKit 常见写法是：

```swift
api.fetchArticles { articles in
    DispatchQueue.main.async {
        // update UI here
    }
}
```

或者使用 Swift Concurrency：

```swift
@MainActor
func render(_ articles: [Article]) {
    // update UI here
}
```

8. 如果后台任务失败了，以后应该怎么把错误传回来？

可以让 completion 传回一个 `Result`。

当前 completion 是：

```swift
([Article]) -> Void
```

它只能表达“成功拿到文章”。

以后可以改成：

```swift
(Result<[Article], Error>) -> Void
```

示例：

```swift
func fetchArticles(
    completion: @escaping @Sendable (Result<[Article], Error>) -> Void
) {
    DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
        let success = true

        if success {
            let articles = [...]
            completion(.success(articles))
        } else {
            completion(.failure(APIError.networkFailed))
        }
    }
}
```

调用方可以这样处理：

```swift
apiService.fetchArticles { result in
    switch result {
    case .success(let articles):
        print("render articles:", articles)

    case .failure(let error):
        print("show error:", error)
    }
}
```

这样异步结果就从“只会成功”升级成：

```text
成功：拿到 [Article]
失败：拿到 Error
```


---

## 13. 今日总结

Day26 第一次系统建立了并发和主线程的基础认知。

知道：

- 同步任务按顺序执行
- 异步任务不会阻塞当前流程
- 后台任务可以用 `DispatchQueue.global()` 模拟
- 异步结果可以通过 completion callback 回传
- `@escaping` 表示 closure 会在函数返回之后执行
- UI 更新应该回到主线程
- 命令行项目里可以用 `DispatchSemaphore` 等待异步任务完成

今天的核心收获是：

> App 可以先展示 loading，再后台加载数据，最后回到主线程更新 UI。