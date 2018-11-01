//
//  RFFunnyViewModel.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/11/1.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

class RFFunnyViewModel: RFBaseAnchorViewModel {

}

extension RFFunnyViewModel {
    func requestFunnyData(_ completionHandler: @escaping () -> Void) {
        requestAnchorData(urlString: GetColumnRoomURL, parameters: ["limit": 30, "offset": 0], isGroup: false, completionHandler: completionHandler)
    }
}
