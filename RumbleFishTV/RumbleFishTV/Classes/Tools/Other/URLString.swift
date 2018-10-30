//
//  URLString.swift
//  Weibo
//
//  Created by LiDinggui on 2017/9/29.
//  Copyright © 2017年 DAQSoft. All rights reserved.
//

import Foundation

let BaseURLString1 = "http://capi.douyucdn.cn/api/v1/"
let BaseURLString2 = "http://www.douyutv.com/api/v1/"

// MARK: - 首页推荐
// 2-12区游戏
let GetHotCateURL = BaseURLString1 + "getHotCate"
// 1区颜值
let GetVerticalRoomURL = BaseURLString1 + "getVerticalRoom"
// 0区热门
let GetbigDataRoomURL = BaseURLString1 + "getbigDataRoom"
// 无线轮播图
let SlideURL = BaseURLString2 + "slide/6"

// MARK: - 首页游戏
// 所有游戏
let GetColumnDetailURL = BaseURLString1 + "getColumnDetail"

// MARK: - 首页娱乐
// 娱乐
let GetHotRoomURL = BaseURLString1 + "getHotRoom/2"
