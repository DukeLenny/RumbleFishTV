//
//  UIColor+Extension.swift
//  Weibo
//
//  Created by LiDinggui on 2017/9/29.
//  Copyright © 2017年 DAQSoft. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }
    
    static func random(alpha: CGFloat = 1.0) -> UIColor {
        return rgb(CGFloat(arc4random_uniform(256)), CGFloat(arc4random_uniform(256)), CGFloat(arc4random_uniform(256)), alpha: alpha)
    }
    
    static func hex(_ hex: Int, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor.rgb(CGFloat((hex & 0xFF0000) >> 16), CGFloat((hex & 0x00FF00) >> 8), CGFloat(hex & 0x0000FF), alpha: alpha)
    }
}
