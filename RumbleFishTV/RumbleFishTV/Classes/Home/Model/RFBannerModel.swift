//
//  RFBannerModel.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/10/24.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

class RFBannerModel: NSObject {
    @objc var title: String = ""
    @objc var pic_url: String = ""
    @objc private var room: [String: NSObject]? {
        didSet {
            if let room = room {
                roomModel = RFRoomModel(dic: room)
            }
        }
    }
    var roomModel: RFRoomModel?
    
    init(dic: [String: NSObject]) {
        super.init()
        
        setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
