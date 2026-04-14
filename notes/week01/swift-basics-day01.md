# Swift Basics Day 1

## 今天学了什么
- let / var
- Int / Double / Bool / String
- 字符串插值
- if / else if / else
- switch
- func
- return
- guard

## 和 C++ 的对应关系
- let ≈ const
- var ≈ 普通变量
- func add(_ a: Int, _ b: Int) -> Int ≈ int add(int a, int b)
- guard ... else { return } ≈ C++ 中前置校验 + 提前 return
- switch 比 C++ 更安全，不需要 break
- Double ≈ double

## 今天最容易错的点
- Swift 参数类型写法和 C++ 相反
- switch 不需要 break
- guard 的 else 里通常要 return
- Swift 类型更严格，Int 和 Double 不能随便混用