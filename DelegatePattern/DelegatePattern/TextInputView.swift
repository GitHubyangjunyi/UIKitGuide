//
//  TextInputView.swift
//  DelegatePattern
//
//  Created by 杨俊艺 on 2021/2/8.
//

import UIKit

class TextInputView: UIView {

    @IBOutlet weak var inputTextField: UITextField!
    
    var onConfirmInputBlock: ((String?) -> Void)?

    @IBAction func confirmButtonPressed(_ sender: UIButton) {
        onConfirmInputBlock?(inputTextField.text)
    }
}
