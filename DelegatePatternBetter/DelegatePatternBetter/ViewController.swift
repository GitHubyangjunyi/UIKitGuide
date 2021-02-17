//
//  ViewController.swift
//  DelegatePatternBetter
//
//  Created by 杨俊艺 on 2021/2/8.
//

import UIKit

class ViewController: UIViewController {

    let viewe = vvv()
    
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textInputView = Bundle.main.loadNibNamed("TextInputView", owner: nil, options: nil)?[0] as! TextInputView
        textInputView.frame = CGRect.init(x: 20, y: 100, width: 345, height: 50)
        
        // 第二处weak化 遮蔽变量
        textInputView.onConfirmInputDelegate.delegate(on: self) { (self, input) in
            self.textLabel.text = input
        }
        view.addSubview(textInputView)
        
        viewe.vv = self.viewe
    }


}

class vvv: UIView {
    var vv = UIView()
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
