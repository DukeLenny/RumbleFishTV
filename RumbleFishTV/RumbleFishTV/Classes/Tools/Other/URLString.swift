//
//  URLString.swift
//  Weibo
//
//  Created by LiDinggui on 2017/9/29.
//  Copyright © 2017年 DAQSoft. All rights reserved.
//

import Foundation

let BaseURLString = "http://capi.douyucdn.cn/api/v1/"
let BaseImageURLString = "http://www.douyutv.com/api/v1/"

// MARK: - 首页推荐
// 2-12区游戏
let GetHotCateURL = BaseURLString + "getHotCate"
// 1区颜值
let GetVerticalRoomURL = BaseURLString + "getVerticalRoom"
// 0区热门
let GetbigDataRoomURL = BaseURLString + "getbigDataRoom"
// 无线轮播图
let SlideURL = BaseImageURLString + "slide/6"

// MARK: - 首页游戏
// 所有游戏
let GetColumnDetailURL = BaseURLString + "getColumnDetail"

// MARK: - 首页娱乐
// 娱乐
let GetHotRoomURL = BaseURLString + "getHotRoom/2"

// MARK: - 首页趣玩
// 趣玩
let GetColumnRoomURL = BaseURLString + "getColumnRoom/2"
