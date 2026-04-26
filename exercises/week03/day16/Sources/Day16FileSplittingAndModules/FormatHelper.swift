/*
有些逻辑不属于某个模型，也不属于某个 store，
那就适合做 helper。

比如格式化函数：

不需要存状态
只是做一个小功能
可能会被多个地方调用
*/

import Foundation

func formatTitle(_ title: String) -> String {
    "[TITLE] \(title)"
}