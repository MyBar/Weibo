//
//  UIBarButtonItem+Extensions.swift
//  麦霸微博
//
//  Created by lijingui2010 on 2017/1/1.
//  Copyright © 2017年 MyBar. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    convenience init(title: String, fontSize: CGFloat = 16, target: AnyObject, action: Selector, isBack: Bool = false) {
        
        let btn: UIButton = UIButton.cz_textButton(title, fontSize: fontSize, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
        
        if isBack {
            let imageNamed = "navigationbar_back_withtext"
            
            btn.setImage(UIImage(named: imageNamed), for: .normal)
            btn.setImage(UIImage(named: imageNamed + "_highlighted"), for: .highlighted)
            
            btn.sizeToFit()
        }
        
        btn.addTarget(target, action: action, for: .touchUpInside)
        
        self.init(customView: btn)
    }
    
}
