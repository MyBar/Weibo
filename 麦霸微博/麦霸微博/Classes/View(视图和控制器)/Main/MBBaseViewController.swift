//
//  MBBaseViewController.swift
//  麦霸微博
//
//  Created by lijingui2010 on 2016/12/11.
//  Copyright © 2016年 MyBar. All rights reserved.
//

import UIKit

class MBBaseViewController: UIViewController {
    
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))
    lazy var navItem = UINavigationItem()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var title: String? {
        didSet {
            navItem.title = title
        }
    }
}

extension MBBaseViewController {
    
    func setupUI() {
        
        view.backgroundColor = UIColor.cz_random()
        
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        view.addSubview(navigationBar)
        
        navigationBar.items = [navItem]
        
        navigationBar.barTintColor = UIColor.cz_color(withHex: 0xF6F6F6)
        
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGray]
        
        navigationBar.tintColor = UIColor.orange
    }
}
