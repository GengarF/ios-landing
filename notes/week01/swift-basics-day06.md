# Swift Basics Day 6

## 今天学了什么
- guard let
- ?? 空合并运算符
- ?. 可选链
- raw value enum
- associated value enum
- filter

## 和 C++ 的对应关系
- guard let ≈ 前置校验 + 提前 return
- ?? ≈ optional 有值就取值，没有值就给默认值
- ?. ≈ 空指针安全访问
- raw value enum ≈ 带固定值的枚举
- associated value enum ≈ 更像 std::variant / tagged union
- filter ≈ 手动遍历数组后筛选满足条件的元素

## 核心理解

### 1. guard let
guard let 更适合做前置校验。
如果 Optional 没有值，就直接 return。
这样主流程会更清晰。

### 2. ??
?? 用来给 Optional 提供默认值。
如果左边有值，就用左边；
如果左边没有值，就用右边默认值。

### 3. ?.
?. 是可选链。
当一个对象可能为 nil 时，可以安全地继续访问它的属性。
如果中间某一层是 nil，整个结果就会变成 nil。

### 4. raw value enum
raw value enum 是“枚举值背后绑定一个固定值”。
例如 HTTP 状态码这种场景就很适合。

### 5. associated value enum
associated value enum 不只是表示“是哪一种情况”，
还能携带额外数据。
比如：
- cash(amount: Int)
- card(number: String)

### 6. filter
filter 用来筛出满足条件的元素，返回一个新数组。
原数组不会被修改。

## 今天最容易混淆的点
- guard let 和 if let 的使用场景不同，guard let 更适合前置校验
- ?. 和 ?? 经常一起出现，但作用不同
- raw value enum 和 associated value enum 不是一回事
- filter 是筛选，不是修改原数组

## 我自己的总结
今天最大的收获是理解了 Optional 的进一步写法。
尤其是 guard let、??、?. 这三个在一起时，
会让 Swift 代码看起来很自然，也很安全。

另外，associated value enum 很有 Swift 的特点，
它比 C++ 里常见的普通 enum 强很多。