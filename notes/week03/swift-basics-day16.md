# Swift Basics Day 16

## 今天学了什么
- 文件拆分
- 按职责组织代码
- 模型文件
- store 文件
- helper 文件
- 主文件只负责流程调度

## 核心理解
- 代码不应该一直堆在一个文件里
- 拆文件要按职责拆，而不是随便拆
- 模型适合单独放文件
- 管理逻辑适合单独放 store 文件
- 小工具函数适合放 helper 文件
- 主文件应该更像入口和流程组织者

## 今天最重要的收获
- 我第一次把一个小练习项目拆成了多个文件
- 这样更清晰，也更像真实开发
- 文件拆分本质上是在减少混乱、增强可维护性

## 现在的文件结构
- Day16FileSplittingAndModules.swift：main 和练习流程
- User.swift：用户模型
- Article.swift：文章模型
- ArticleStore.swift：文章存储和管理逻辑
- FormatHelper.swift：标题格式化 helper

## 以后还可以继续优化的方向
- helper 文件命名更具体
- store 增加更多操作接口
- 文件继续按 Models / Stores / Helpers 目录分类