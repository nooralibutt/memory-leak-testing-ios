//
//  ViewController.swift
//  MemoryLeaks
//
//  Created by Noor on 9/16/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        button.setTitle("Tap Me", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(onTap), for: .touchUpInside)
        button.center = view.center
        view.addSubview(button)
    }
    
    @objc private func onTap() {
        present(SecondVC(), animated: true)
    }
}

class WeakReferencedView: UIView {
    weak var vc: UIViewController?
    init(vc: UIViewController) {
        self.vc = vc
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MemoryLeakageView: UIView {
    let vc: UIViewController
    init(vc: UIViewController) {
        self.vc = vc
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SecondVC: UIViewController {
    var myView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.red
        
        // It will create strong cycle, hence memory leakage
        myView = MemoryLeakageView(vc: self)
        
        // It will create weak cycle, hence no memory leakage
//        myView = WeakReferencedView(vc: self)
    }
}

