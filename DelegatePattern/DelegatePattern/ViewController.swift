//
//  ViewController.swift
//  DelegatePattern
//
//  Created by 杨俊艺 on 2021/2/8.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let textInputView = Bundle.main.loadNibNamed("TextInputView", owner: nil, options: nil)?[0] as! TextInputView
        textInputView.frame = CGRect.init(x: 20, y: 100, width: 345, height: 50)
        
        // 必须使用[weak self]否则会导致内存泄漏
        textInputView.onConfirmInputBlock = { [weak self] text in
            self?.textLabel.text = text
        }
        view.addSubview(textInputView)
        
        
    }


}

