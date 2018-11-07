//
//  UIDevice+Extension.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/8/31.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

extension UIDevice {
    class func isIPhone() -> Bool {
//        return UI_USER_INTERFACE_IDIOM() == .phone
        return current.userInterfaceIdiom == .phone
    }
    
//    iPhone XR：828px x 1792px @2x
//    iPhone XS Max: 1242px x 2688px @3x
    // IPhoneXSeries包括iPhone X, iPhone XS, iPhone XR, iPhone XS Max
    class func isIPhoneXSeries() -> Bool {
        let screenMaxLength = max(ScreenWidth, ScreenHeight)
        return isIPhone() && (screenMaxLength == 812.0 || screenMaxLength == 896.0)
    }
}
