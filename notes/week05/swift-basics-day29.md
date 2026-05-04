# Day29 - AI 协同专场 3：Review Day28 小项目

## 1. Day29 的定位

Day29 不是新语法日，也不是新项目日。

Day29 的目标是对 Day28 的 Mini App Data Flow Design 项目做一次正式 AI review。

重点不是让 Codex 帮我重写代码，而是训练我：

- 怎么让 AI 解释已有代码
- 怎么让 AI review 工程结构
- 怎么判断 AI 建议是否合理
- 怎么控制 AI 不要大改项目
- 怎么把 AI 协同过程记录下来

## 2. 为什么 Day29 很重要

真实工作中，刚入职不会一上来就独立写完整大需求。

更常见的是：

- 看已有代码
- 理解模块职责
- 看懂数据流
- 修小 bug
- 做小改动
- 提交 MR / PR
- 接受 CR
- 根据 review 修改

所以 Day29 模拟的是一种更接近真实工作的能力：

不是“让 AI 替我写”，而是“让 AI 帮我看懂、检查、解释、发现问题”。

## 3. Day28 项目回顾

Day28 项目的核心链路是：

```text
AppSimulator
-> ArticleListViewController.viewDidLoad
-> ArticleRepository.loadHomeArticles
-> ArticleAPIService.fetchArticles
-> MainThreadSimulator.run
-> ArticleStore.replaceArticles
-> ArticleListViewController.render
-> simulateUserTapArticle
-> ArticleDetailViewController
-> ArticleStore.toggleLike
-> render