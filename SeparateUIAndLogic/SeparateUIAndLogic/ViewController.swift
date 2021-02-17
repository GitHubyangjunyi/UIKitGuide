//
//  ViewController.swift
//  SeparateUIAndLogic
//
//  Created by 杨俊艺 on 2021/2/8.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let avc = ActionViewController.init(nibName: "ActionViewController", bundle: nil)
        //let avc = ActionViewController.init()
        
        navigationController?.pushViewController(avc, animated:true)
        
    }

}


class ActionViewController: UIViewController {
    
    @IBOutlet weak var holdBtn: UIButton!
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(nibName: "ActionViewController", bundle: nil)
        print("ActionViewController的init()")
    }
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("ActionViewController的initNib()")
    }
    
    override func loadView() {
        super.loadView()
        print("ActionViewController的loadView()")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ActionViewController的viewDidLoad()")
    }
    
    @IBAction func logicHandle(_ sender: UIButton) {
        print("业务逻辑处理")
    }
    
}

class ActionView: UIView {
    
    @IBOutlet weak var holdBtn: UIButton!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("ActionView的initCoder()")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("ActionView的awakeFromNib()")
    }
    @IBAction func uiUpdate(_ sender: UIButton) {
        print("UI更新")
        self.holdBtn.setTitleColor(.black, for: .normal)
    }
    
}


// 建立Empty模版ActionViewController.xib
// 拖入UIView
// UIView的Custom Class -> ActionView
// ActionViewController.xib的File's Owner为ActionViewController
// 连接File's Owner的view到画布上拖入的UIView

// 关于初始化方法
// 因为UIViewController使用了协议NSCoding必须实现init(coder)
// 自定义的UIViewcontroller子类要么继承init(coder)要么显示实现并标记为required
// 因为实现了初始化器所以丧失了初始化器的继承所以必须实现init(doder)并将其标记为required
// 可以让Xcode插入崩溃实现或者实现一个最小的有意义的实现super.init(coder: coder)
