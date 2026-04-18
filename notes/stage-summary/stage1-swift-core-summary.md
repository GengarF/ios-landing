# Stage 1 Summary

## 阶段范围
- Day 01 ~ Day 08
- 目标：完成 Swift 核心语法与常见表达方式的第一轮闭环

---

## 这一阶段我学了什么

### Day 01：Swift 基础语法
- let / var
- Int / Double / Bool / String
- 字符串插值
- if / else
- guard
- switch
- 基础函数
- 参数和返回值

### Day 02：Optional / Array / Dictionary / struct / class
- Optional
- nil
- if let
- Array
- Dictionary
- struct
- class
- init
- self

### Day 03：方法 / mutating / enum / extension
- 属性和方法
- mutating
- enum
- switch 匹配 enum
- extension
- 给 enum 增加行为

### Day 04：protocol / error handling / closure 基础
- protocol
- 方法约束
- 属性约束
- throws / try / do-catch
- closure
- sorted
- map

### Day 05：计算属性 / 属性观察器 / extension 进一步使用
- 计算属性
- getter / setter
- willSet / didSet
- extension 给 Int / String 增加能力

### Day 06：Optional / enum / closure 进阶
- guard let
- ??
- ?.
- raw value enum
- associated value enum
- filter

### Day 07：value / reference / inout / static
- struct 的值语义
- class 的引用语义
- inout
- static 属性
- static 方法

### Day 08：Generics / protocol extension / 高阶函数
- Generics
- 泛型函数
- 泛型 + Optional
- protocol extension 默认实现
- compactMap
- reduce

---

## 和 C++ 的关键对应关系

### 变量和类型
- let ≈ const
- var ≈ 普通变量
- Int / Double / Bool / String ≈ C++ 中对应基础类型和 string

### 控制流
- if / else 基本一致
- switch 比 C++ 更安全，不需要 break
- guard 更像前置校验 + 提前 return

### 函数
- func add(_ a: Int, _ b: Int) -> Int ≈ `int add(int a, int b)`
- 参数类型写法和 C++ 相反

### Optional
- Optional ≈ `std::optional<T>`
- nil ≈ `std::nullopt`
- if let / guard let ≈ 判断 optional 是否有值再取 value

### Array / Dictionary
- Array ≈ `std::vector`
- Dictionary ≈ `std::unordered_map`
- Dictionary 取值返回 Optional，因为 key 可能不存在

### struct / class
- struct 更像值类型数据对象
- class 更像引用类型对象
- struct 赋值时复制
- class 赋值时共享对象

### mutating / inout / static
- mutating 表示 struct 方法会修改自身
- inout ≈ C++ 引用参数 `T&`
- static 属性 / 方法 ≈ 静态成员变量 / 静态成员函数

### protocol / extension
- protocol ≈ 抽象接口 / 纯虚基类
- protocol extension ≈ 接口 + 默认实现
- extension 是给已有类型补能力

### closure / 高阶函数
- closure ≈ lambda
- map / filter / compactMap / reduce ≈ 常见 STL / 函数式处理思路

---

## 我现在已经掌握了什么

### 1. 能写基础 Swift 代码
现在已经可以自己写：
- 变量定义
- 条件判断
- switch
- 函数
- struct / class
- enum
- protocol
- extension
- closure 基础表达

### 2. 对 Optional 已经不陌生
已经掌握：
- if let
- guard let
- ??
- ?.

### 3. 已经能理解 Swift 很多核心语义
包括：
- 值语义 vs 引用语义
- mutating
- inout
- static
- 计算属性
- 属性观察器

### 4. 已经能写常见高阶函数
包括：
- map
- filter
- compactMap
- reduce

### 5. 已经有基础工程感
- 会用 Swift Package
- 会用 swift run
- 会用 VS Code 写 Swift
- 会在 GitHub 上按天记录代码、笔记、日志

### 6. 已经开始练 AI 协同开发
- 会让 Codex 做解释
- 会让 Codex 做 review
- 会做小步优化
- 开始培养 vibe coding 的习惯

---

## 这一阶段我觉得最重要的 Swift 特点

### 1. Optional
Swift 很强调“可能为空的值要显式写出来”，这一点和很多语言不同。

### 2. enum
Swift 的 enum 很强，不只是几个常量，还可以有 raw value、associated value、方法和扩展。

### 3. extension
Swift 很喜欢给已有类型补能力，这一点非常常见。

### 4. closure + 高阶函数
Swift 很常见用 closure 配合 map / filter / compactMap / reduce 写数据处理逻辑。

### 5. 值类型和引用类型的区别
这一点会影响后面很多代码理解，是 Swift 非常核心的语义。

---

## 我现在还欠什么

### 1. 真实 iOS 工程语境
虽然 Swift 基础已经铺开，但还没有真正进入：
- UIKit
- ViewController
- 页面组织
- Xcode / Simulator
- 实际 iOS 工程结构

### 2. 对一些语法的熟练度还不够
比如：
- closure 简写
- 高阶函数组合使用
- protocol extension 的更多场景
- enum 和 associated value 的更复杂写法

### 3. 代码风格还需要继续训练
主要是：
- 命名
- 输出一致性
- 更 idiomatic 的 Swift 写法

### 4. AI 协同开发还在初级阶段
现在已经开始用了，但更多还是：
- 解释
- review
- 小优化

后面还要继续练：
- 需求表达
- 任务拆解
- 判断 AI 建议是否值得采纳

---

## 这一阶段我最大的收获

### 1. Swift 已经不再陌生
现在看到 Swift 代码，已经不会像最开始那样完全没感觉了。

### 2. 已经建立了基础语感
能自己写出小练习、跑通代码，并用 GitHub 留痕。

### 3. C++ 类比路线是有效的
通过和 C++ 对照，我能更快理解 Swift 的设计思路。

### 4. 学习方式已经稳定下来
现在的固定流程已经形成：
- 跟着计划学
- 自己先写
- 运行验证
- Codex review
- 写笔记和日志
- commit / push

---

## 下一阶段的重点

下一阶段要逐步从“语言基础”走向“更真实的代码组织和工程表达”。

重点会放在：
- 更自然的 Swift 写法
- 更真实的模型和业务抽象
- 更强的 closure / 协议 / 扩展使用
- 工程感
- 为后面的 UIKit / Xcode 做准备

---

## 我对当前自己的评价

第一阶段已经完成了一个比较完整的 Swift 基础闭环。  
现在的水平还远远不是成熟 iOS 开发，但已经从“完全不会 Swift”进入到了“可以写基础 Swift、理解核心概念、继续往工程方向推进”的阶段。

这个阶段最重要的不是追求学得多快，而是把基础语义和表达方式打稳，为后面的 UIKit / 工程实践 / AI 协同开发做好准备。