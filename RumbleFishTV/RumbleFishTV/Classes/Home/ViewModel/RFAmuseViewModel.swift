//
//  RFAmuseViewModel.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/10/30.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

class RFAmuseViewModel: RFBaseAnchorViewModel {
    
}

// MARK: - 发送网络请求
extension RFAmuseViewModel {
    func requestAmuseData(_ completionHandler: @escaping () -> Void) {
        requestAnchorData(urlString: GetHotRoomURL, completionHandler: completionHandler)
    }
}
