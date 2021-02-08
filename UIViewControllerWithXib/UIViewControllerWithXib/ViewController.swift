//
//  ViewController.swift
//  UIViewControllerWithXib
//
//  Created by 杨俊艺 on 2021/2/8.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let hvc = HomeViewController()
        
        self.navigationController?.pushViewController(hvc, animated: true)
        
        
        
    }


}


class HomeViewController: UIViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: "HomeController", bundle: nil)
        print("HomeViewController的initNib()")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


