# Swift Basics Day 22

## 今天不是新语法，而是 AI 协同 review

## 主战场
- Day21 Student Grade Manager
- 项目路径：`exercises/week03/day21`

## 今天练习了什么
- 让 Codex 解释项目结构
- 让 Codex review 多文件小项目
- 检查 Model / Store / Helper / Main 的职责划分
- 判断 AI 建议是否值得采纳
- 做 2 到 3 个小步优化

## Day21 项目结构回顾

### Student.swift
负责学生数据模型。

### GradeRecord.swift
负责成绩记录模型，包含：
- student
- subject
- score
- isPassed
- summary

### GradeStore.swift
负责管理成绩记录，包含：
- 添加成绩
- 返回所有记录
- 筛选及格记录
- 计算平均分

### FormatHelper.swift
负责格式化输出。

### Day21StudentGradeManager.swift
负责 main 入口和 demo 流程组装。

## 今天最重要的理解

AI 协同开发不是让 AI 直接替我重写项目，而是：

1. 我先写第一版
2. 我先自己 review
3. AI 帮我解释和指出问题
4. 我自己判断哪些建议值得采纳
5. 只做小步优化
6. 最后我自己对代码负责

## Codex 适合做什么
- 解释项目结构
- review 文件职责
- 检查命名是否自然
- 提醒是否有更 Swift 的写法
- 给出小步优化建议

## Codex 不应该替我做什么
- 不应该直接大改项目结构
- 不应该替我决定所有设计
- 不应该为了“高级”而增加复杂抽象
- 不应该把学习项目改成我看不懂的代码

## 今天的收获
- 小项目 review 比单文件 review 更接近真实工作
- AI 的建议需要筛选，不是都要采纳
- 文件拆分、命名、职责边界比单个语法更重要
- 小步优化比大规模重构更适合当前阶段

## 以后继续注意
- Main 文件尽量只做流程组装
- Model 负责表达数据
- Store 负责管理数据
- Helper 负责辅助格式化
- private 用来保护内部状态
- AI review 后要自己判断，不盲从