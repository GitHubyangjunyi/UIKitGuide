//
//  TextInputView.swift
//  DelegatePatternBetter
//
//  Created by 杨俊艺 on 2021/2/8.
//

import UIKit

class TextInputView: UIView {

    @IBOutlet weak var inputTextField: UITextField!
    
    // 由这个对象负责处理回调
    let onConfirmInputDelegate = Delegate<String?, Void>() // Output是Void的话可以简化理解难度
    
    @IBAction func confirmButtonPressed(_ sender: UIButton) {
        
        onConfirmInputDelegate.call(inputTextField.text)
        
    }
}


class Delegate<Input, Output> {
    
    private var blockStore: ((Input) -> Output?)?
    
    func call(_ input: Input) -> Output? {
        return blockStore?(input)
    }
    
    func delegate<T: AnyObject>(on target: T, block: ((T, Input) -> Output)?) {
        // [weak target] 第一处weak化
        blockStore = { [weak target] input in
            guard let target = target else { return nil }
            return block?(target, input) // 配合第二处的weak化
        }
    }
    
}

extension Delegate where Input == Void {
    func call() -> Output? {
        return call(())
    }
}

// 通过设置block时就将target(通常是 self)做weak化处理并且在调用block时提供一个weak后的target 的变量就可以保证在调用侧不会意外地持有target
// 闭包的输入参数(self, text)和闭包中self.textLabel.text中的self并不是原来的代表controller的self
// 闭包的输入参数(self, text)和闭包中self.textLabel.text中的self并不是原来的代表controller的self
// 闭包的输入参数(self, text)和闭包中self.textLabel.text中的self并不是原来的代表controller的self
// 而是由Delegate把self标为weak后的参数因此直接在闭包中使用这个遮蔽变量self也不会造成循环引用
// 相当于在外部将target和闭包参数(self, text)中的self进行weak化,至于为什么使用self是为了方便使用,相当于遮蔽变量
// 由于使用了遮蔽变量self所以在闭包中的self其实是这个遮蔽变量而非原本的self
// 这样要求我们比较小心否则可能造成意外的循环引用
// 比如
// inputView.onConfirmInput.delegate(on: self) { (_, text) in
//    self.textLabel.text = text
// }
// 上面的代码编译和使用都没有问题但是由于我们把(self, text)换成了(_, text)这导致闭包内部self.textLabel.text中的self直接参照了真正的self
// 这是一个强引用进而内存泄露
// 这种错误和[weak self]声明一样没有办法得到编译器的提示所以也很难完全避免
// 也许一个可行方案是不要用(self, text)这样的隐式遮蔽而是将参数名明确写成不一样的形式比如(weakSelf, text)然后在闭包中只使用weakSelf
// 但这么做其实和self遮蔽差距不大依然摆脱不了用“人为规定”来强制统一代码规则
