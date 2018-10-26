//
//  BaseModel.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/10/26.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

class BaseModel: NSObject {
    
    override init() {
        
    }
    
    init(dic: [String : Any]) {
        super.init()
        
        setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}

}
