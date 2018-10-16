//
//  RFRoomModel.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/10/15.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

class RFRoomModel: NSObject {
    @objc var room_id: Int = 0
    @objc var vertical_src: String = ""
    /// 0: 电脑直播, 1: 手机直播
    @objc var isVertical: Int = 0
    @objc var room_name: String = ""
    @objc var nickname: String = ""
    @objc var online: Int = 0
    
    @objc var anchor_city: String = ""
    
    init(dic: [String : NSObject]) {
        super.init()
        
        setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
