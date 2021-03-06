//
//  Constant.swift
//  Weibo
//
//  Created by LiDinggui on 2017/9/29.
//  Copyright © 2017年 DAQSoft. All rights reserved.
//

import UIKit

let NavigationBarTintColor = UIColor.darkGray
let NavigationBarHighlightedTintColor = UIColor.orange
let NavigationBarBarTintColor = UIColor.hex(0xF6F6F6)
let NavigationBarBackImageName = "navigationbar_back_withtext"
let NavigationBarBackHighlightedImageName = "navigationbar_back_withtext_highlighted"
let TabBarTintColor = UIColor.black
let BarButtonItemFont = UIFont.systemFont(ofSize: 16.0)
let BarButtonItemTitle = ""

let ScreenWidth = UIScreen.main.bounds.size.width
let ScreenHeight = UIScreen.main.bounds.size.height

let Application = UIApplication.shared
let APPDELEGATE = Application.delegate
let Window = APPDELEGATE?.window

let StatusBarHeight = Application.statusBarFrame.size.height
let TopBarHeight = StatusBarHeight + navigationBarHeight()

let HomeIndicatorHeight: CGFloat = UIDevice.isIPhoneXSeries() ? 34.0 : 0.0
let BottomBarHeight = tabBarHeight() + HomeIndicatorHeight

let SystemVersion = UIDevice.current.systemVersion

let DocumentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
		
