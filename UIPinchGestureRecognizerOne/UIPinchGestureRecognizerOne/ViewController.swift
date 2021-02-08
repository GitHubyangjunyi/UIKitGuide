//
//  ViewController.swift
//  UIPinchGestureRecognizerOne
//
//  Created by 杨俊艺 on 2021/2/8.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    var vv = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vv = UIView.init(frame: .init(x: 100, y: 100, width: 200, height: 400))
        vv.backgroundColor = .red
        
        
        let pinGes = UIPinchGestureRecognizer.init(target: self, action: #selector(actionPin(gesture:)))
        vv.addGestureRecognizer(pinGes)
        self.view.addSubview(vv)
        
    }

    @objc func actionPin(gesture: UIPinchGestureRecognizer) {
        print("****响应拖动手势操作\(NSData.init())")
        vv.transform = CGAffineTransform.init(scaleX: gesture.scale, y: gesture.scale)
        
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}

