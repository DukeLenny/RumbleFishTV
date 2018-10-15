//
//  RFRecommendViewModel.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/10/15.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

class RFRecommendViewModel {
    private lazy var anchorModels: [RFAnchorModel] = [RFAnchorModel]()
}

// MARK: - 发送网络请求
extension RFRecommendViewModel {
    func requestData() {
        let parameters = ["limit" : 4, "offset" : 0, "time" : Date.currentTimeInterval()]
        Network.request(urlString: GetHotCateURL, parameters: parameters) { (value, error) in
            guard let value = value else {
                print(error!.localizedDescription)
                return
            }
            
            print(value)
            guard let dic = value as? [String : NSObject] else { return }
            guard let data = dic["data"] as? [[String : NSObject]] else { return }
            if self.anchorModels.count > 0 { self.anchorModels.removeAll() }
            for element in data {
                let anchorModel = RFAnchorModel(dic: element)
                self.anchorModels.append(anchorModel)
            }
            
            for anchorModel in self.anchorModels {
                for roomModel in anchorModel.roomModels {
                    print(roomModel.room_name)
                }
            }
        }
    }
}
