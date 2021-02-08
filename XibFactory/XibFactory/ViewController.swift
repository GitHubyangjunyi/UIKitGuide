//
//  ViewController.swift
//  XibFactory
//
//  Created by 杨俊艺 on 2021/2/8.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let normal = ToolBar.createToolBar(withType: .normal)
        normal?.frame.origin = .init(x: 0, y: 100)
        
        let edit = ToolBar.createToolBar(withType: .edit)
        edit?.frame.origin = .init(x: 0, y: 200)
        
        view.addSubview(normal!)
        view.addSubview(edit!)
        
    }

}

class ToolBar: UIView {
    enum ToolBarType {
        case normal
        case edit
    }
    
    class func createToolBar(withType type: ToolBarType) -> ToolBar? {
        switch type {
        case .normal:
            return Bundle.main.loadNibNamed("ToolBar", owner: nil, options: nil)?[0] as? ToolBar
        case .edit:
            return Bundle.main.loadNibNamed("ToolBar", owner: nil, options: nil)?[1] as? ToolBar
        }
    }

    func handleEvent() {
        // 子类重写方法进行自定义
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // 有几个独立的xib就会被调用几次是个大坑
        print("\(type(of: self))     awakeFromNib")
        handleEvent()
    }
    
}

class ToolBarNormal: ToolBar {
    override func handleEvent() {
        backgroundColor = .gray
    }
}

class ToolBarEdit: ToolBar {
    override func handleEvent() {
        backgroundColor = .darkGray
    }
}

// 创建Empty模版的ToolBar.xib
// ToolBar.xib分别添加两个UIView并设置各自的Custom Class为ToolBarNormal和ToolBarEdit
