//
//  MBNavigationController.swift
//  麦霸微博
//
//  Created by lijingui2010 on 2016/12/11.
//  Copyright © 2016年 MyBar. All rights reserved.
//

import UIKit

class MBNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationBar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if childViewControllers.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true
            
            if let vc = viewController as? MBBaseViewController {
                
                var title = "返回"
                
                if childViewControllers.count == 1 {
                    
                    title = childViewControllers.first?.title ?? title
                }
                
                vc.navItem.leftBarButtonItem = UIBarButtonItem(title: title, target: self, action: #selector(popToParent), isBack: true)
            }
            
        }
        
        super.pushViewController(viewController, animated: true)
    }
    
    @objc private func popToParent() {
        popViewController(animated: true)
    }
    
}
