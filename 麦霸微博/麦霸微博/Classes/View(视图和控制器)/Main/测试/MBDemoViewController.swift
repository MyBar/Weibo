//
//  MBDemoViewController.swift
//  麦霸微博
//
//  Created by lijingui2010 on 2017/1/1.
//  Copyright © 2017年 MyBar. All rights reserved.
//

import UIKit

class MBDemoViewController: MBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showNext() {
        let vc = MBDemoViewController()
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension MBDemoViewController {
    
    override func setupUI() {
        super.setupUI()
        
        navItem.rightBarButtonItem = UIBarButtonItem(title: "下一个", target: self, action: #selector(showNext))
    }
}
