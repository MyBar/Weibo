//
//  Bundle.swift
//  麦霸微博
//
//  Created by lijingui2010 on 2016/12/11.
//  Copyright © 2016年 MyBar. All rights reserved.
//

import Foundation

extension Bundle {
    
    var namespace: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
