//
//  MBMainViewController.swift
//  麦霸微博
//
//  Created by lijingui2010 on 2016/12/11.
//  Copyright © 2016年 MyBar. All rights reserved.
//

import UIKit

class MBMainViewController: UITabBarController {
    
    lazy var composeButton: UIButton = UIButton.cz_imageButton("tabbar_compose_icon_add", backgroundImageName:"tabbar_compose_button")

    override func viewDidLoad() {
        super.viewDidLoad()

        setupChildControllers()
        setupComposeButton()
    }
    

    func composeStatus(sender: AnyObject) {
        if sender.isKind(of: UILongPressGestureRecognizer.self) {
            print("-----UILongPressGestureRecognizer-----\(sender)")
        }else {
            print("-----\(sender)-----")
        }
    }

}

extension MBMainViewController {
    
    func setupComposeButton() {
        
        tabBar.addSubview(composeButton)
        
        let count = CGFloat(childViewControllers.count)
        
        let width = tabBar.bounds.width / count
        
        composeButton.frame = tabBar.bounds.insetBy(dx: 2 * width, dy: 0)
        
        composeButton.addTarget(self, action: #selector(composeStatus(sender:)), for: .touchUpInside)
        
        composeButton.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(composeStatus(sender:))))
        
    }
    
    func setupChildControllers() {
        
        let array = [
            ["clsName": "MBHomeViewController", "title": "首页", "imageName": "home"],
            ["clsName": "MBMessageViewController", "title": "消息", "imageName": "message_center"],
            ["clsName": "UIViewController"],
            ["clsName": "MBDiscoverViewController", "title": "发现", "imageName": "discover"],
            ["clsName": "MBProfileViewController", "title": "我", "imageName": "profile"]
        ]
        
        var arrayM = [UIViewController]()
        
        for dict in array {
            arrayM.append(controller(dict: dict))
        }
        
        viewControllers = arrayM
        
    }
    
    private func controller(dict: [String: String]) -> UIViewController {
        
        guard let clsName = dict["clsName"],
        let title = dict["title"],
        let imageName = dict["imageName"],
        let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? MBBaseViewController.Type
            else {
            return UIViewController()
        }
        
        let vc = cls.init()
        
        vc.title = title
        
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.orange], for: UIControlState.highlighted)
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 12)], for: UIControlState.normal)
        
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
        
        let nav = MBNavigationController(rootViewController: vc)
        
        return nav
    }
}
