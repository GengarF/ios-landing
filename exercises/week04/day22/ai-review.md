# Day 22 AI Review

## 主战场项目
`exercises/week03/day21`

## Step 1: 自我 Review

### 我自己先发现的问题
1. 需要确认 Day21 的文件拆分是否清楚。
2. 需要确认 GradeStore 的接口是否自然。
3. 需要确认 Main 文件是否只负责流程组装。
4. 需要确认 FormatHelper 是否适合单独放一个文件。

## Step 2: Codex 解释结果

Codex 对项目结构的解释重点包括：

- `Student.swift` 负责学生模型。
- `GradeRecord.swift` 负责成绩记录模型。
- `GradeStore.swift` 负责成绩数据管理。
- `FormatHelper.swift` 负责格式化输出。
- `Day21StudentGradeManager.swift` 负责主流程和 demo 组装。

它认为这个项目相比之前单文件练习，更接近真实工程，因为它开始有：
- 文件拆分
- 模型层
- 数据管理层
- helper 工具函数
- main 流程入口

## Step 3: Codex Review 结果

Codex 主要关注了：

1. 文件拆分是否合理
2. 模型设计是否清晰
3. `GradeStore` 的接口是否自然
4. `records` 是否应该保持 private
5. 输出格式是否统一

整体判断：
- 当前项目结构适合作为第一个 Swift 小项目。
- 不需要过早引入复杂抽象。
- 可以继续保持小步优化。

## Step 4: 我决定采纳的建议

我采纳了以下建议：

1. 保持 `records` 为 `private`。
2. 保持 `GradeStore` 作为数据管理入口。
3. 保持 `FormatHelper` 负责格式化输出。
4. 只做命名和输出层面的小优化。

## Step 5: 我没有采纳的建议及原因

我没有采纳大规模重构建议。

原因：
- 当前阶段重点是学习小项目组织，不是追求复杂架构。
- 过早抽象会增加理解成本。
- 我更需要先把 Model / Store / Helper / Main 的基本职责边界练熟。

## Step 6: 最终修改总结

今天主要完成了：

- 对 Day21 小项目做 AI review
- 理解了每个文件的职责
- 检查了模型设计和 Store 设计
- 练习了筛选 AI 建议
- 做了少量小步优化

今天最大的收获是：

AI 可以帮助我解释和 review 项目，但最终是否修改、如何修改，仍然应该由我自己判断。