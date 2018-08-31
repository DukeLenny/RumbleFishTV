//
//  UIDevice+Extension.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/8/31.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

extension UIDevice {
    // #define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    class func isIPhone() -> Bool {
        return UI_USER_INTERFACE_IDIOM() == .phone
    }
    
    // #define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
    // #define IS_IPHONE_X (IS_IPHONE && SCREEN_MAX_LENGTH == 812.0)
    class func isIPhoneX() -> Bool {
        let screenMaxLength = max(ScreenWidth, ScreenHeight)
        return isIPhone() && screenMaxLength == 812.0
    }
}
