# Swift Basics Day 10

## 今天学了什么
- private
- private(set)
- internal
- public
- fileprivate
- 封装和文件组织基础

## 和 C++ 的对应关系
- private ≈ C++ private
- private(set) ≈ 对外只给 getter，内部自己控制写入
- internal ≈ 模块内可见（C++ 没有完全等价）
- public ≈ 对外公开 API
- fileprivate ≈ 当前文件内共享 helper

## 核心理解
- private 用来隐藏内部实现
- private(set) 适合“公开读，私有写”
- internal 是默认访问级别
- public 适合对外暴露 API
- fileprivate 适合同文件共享工具函数
- 封装的本质是隐藏内部状态，只暴露必要接口

## 今天最容易混淆的点
- private 和 fileprivate 的区别
- public 在可执行项目里和在库里的意义不同
- 访问控制不是为了复杂，而是为了限制暴露范围