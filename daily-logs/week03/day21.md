# Day 21

## 今日目标
- 完成第一个纯 Swift 命令行小项目
- 综合使用 struct / store / Array / 高阶函数 / 计算属性
- 练习从“单题练习”过渡到“小项目组织”

## 今日完成
- 完成了 Student Grade Manager 小项目
- 定义了 Student 模型
- 定义了 GradeRecord 模型
- 定义了 GradeStore 管理成绩记录
- 定义了 FormatHelper 做输出格式化
- 实现了所有成绩列表
- 实现了及格成绩筛选
- 实现了平均分计算
- 跑通了 swift run

## 遇到的问题
- 需要继续适应多文件项目组织
- 需要继续体会 Model / Store / Helper 的职责边界
- 小项目比单题练习更考验结构感

## 今天印象最深的点
- GradeStore 用 private 管理 records，让外部不能乱改数据
- filter 和 reduce 在真实一点的小项目里很自然
- Main 文件只负责组装流程，代码会清楚很多


## 明天计划
- 做 Day 22 AI 协同专场
- 让 Codex review 小项目并进行小步优化