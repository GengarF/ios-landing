# Swift Basics Day 13

## 今天学了什么
- 一个错误类型里多个 case
- 多个 catch 分支
- 输入校验型错误处理
- try?
- 抛错函数继续调用抛错函数
- defer

## 和 C++ 的对应关系
- throws / throw / do-catch ≈ 异常机制
- 多个错误 case ≈ 多种错误码 / 多种异常语义
- try? ≈ 把异常包装成 optional 风格结果
- 错误向上传递 ≈ 下层抛异常，上层继续往外传
- defer ≈ finally / RAII 收尾逻辑

## 核心理解
- 一个错误类型可以表示多种失败情况
- 多个 catch 分支能让错误处理更清晰
- try? 会把错误转成 Optional
- 抛错函数内部调用抛错函数时，可以继续往外抛
- defer 表示离开作用域前一定执行

## 今天最容易混淆的点
- do-catch 和 try? 的使用场景不同
- 一个错误类型里多个 case 和多个 catch 的关系
- defer 在 throw 发生时也会执行