//
//  MBMainViewController.swift
//  麦霸微博
//
//  Created by lijingui2010 on 2016/12/11.
//  Copyright © 2016年 MyBar. All rights reserved.
//

import UIKit

class MBMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupChildControllers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MBMainViewController {
    
    func setupChildControllers() {
        
        let array = [
            ["clsName": "MBHomeViewController", "title": "首页", "imageName": ""],
            ["clsName": "MBMessageViewController", "title": "消息", "imageName": ""],
            ["clsName": "MBDiscoverViewController", "title": "发现", "imageName": ""],
            ["clsName": "MBProfileViewController", "title": "我", "imageName": ""]
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
        
        let nav = MBNavigationController(rootViewController: vc)
        
        return nav
    }
}
