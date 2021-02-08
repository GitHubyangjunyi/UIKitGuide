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
