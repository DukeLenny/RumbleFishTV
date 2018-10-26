//
//  RFAnchorModel.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/10/15.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

class RFAnchorModel: NSObject {
    @objc private var room_list: [[String : NSObject]]? {
        didSet {
            if let room_list = room_list {
                if !roomModels.isEmpty {
                    roomModels.removeAll()
                }
                for room in room_list {
                    let roomModel = RFRoomModel(dic: room)
                    roomModels.append(roomModel)
                }
            }
        }
    }
    @objc var tag_name: String = ""
    @objc var icon_url: String = ""
    var icon_name: String = "home_header_normal"
    
    lazy var roomModels: [RFRoomModel] = [RFRoomModel]()
    
    override init() {
        
    }
    
    init(dic: [String : NSObject]) {
        super.init()
        
        setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
//    override func setValue(_ value: Any?, forKey key: String) {
//        if key == "room_list" {
//            if let value = value as? [[String : NSObject]] {
//                if !roomModels.isEmpty {
//                    roomModels.removeAll()
//                }
//                for dic in value {
//                    let roomModel = RFRoomModel(dic: dic)
//                    roomModels.append(roomModel)
//                }
//            }
//        }
//    }
}
