//
//  RFRecommendViewModel.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/10/15.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

class RFRecommendViewModel: RFBaseAnchorViewModel {
    private lazy var hotAnchorModel: RFAnchorModel = RFAnchorModel()
    private lazy var prettyAnchorModel: RFAnchorModel = RFAnchorModel()
    
    lazy var bannerModels: [RFBannerModel] = [RFBannerModel]()
}

// MARK: - 发送网络请求
extension RFRecommendViewModel {
    // MARK: - 推荐
    func requestData(_ completionHandler: @escaping () -> Void) {
        let time = Date.currentTimeInterval()
        
        let dispatchGroup = DispatchGroup()
        
        // 请求0区的热门数据
        dispatchGroup.enter()
        Network.request(urlString: GetbigDataRoomURL, parameters: ["time": time]) { (value, error) in
            guard let value = value else {
                print(error!.localizedDescription)
                return
            }
            
            print(value)
            guard let dic = value as? [String: NSObject] else { return }
            guard let data = dic["data"] as? [[String: NSObject]] else { return }
            
            self.hotAnchorModel.tag_name = "热门"
            self.hotAnchorModel.icon_name = "home_header_hot"
            if !self.hotAnchorModel.roomModels.isEmpty {
                self.hotAnchorModel.roomModels.removeAll()
            }
            for element in data {
                let roomModel = RFRoomModel(dic: element)
                self.hotAnchorModel.roomModels.append(roomModel)
            }
            
            dispatchGroup.leave()
        }
        
        let parameters = ["limit" : 4, "offset" : 0, "time" : time]
        
        // 请求1区的颜值数据
        dispatchGroup.enter()
        Network.request(urlString: GetVerticalRoomURL, parameters: parameters) { (value, error) in
            guard let value = value else {
                print(error!.localizedDescription)
                return
            }
            
            print(value)
            guard let dic = value as? [String: NSObject] else { return }
            guard let data = dic["data"] as? [[String: NSObject]] else { return }
            
            self.prettyAnchorModel.tag_name = "颜值"
            self.prettyAnchorModel.icon_name = "home_header_phone"
            if !self.prettyAnchorModel.roomModels.isEmpty {
                self.prettyAnchorModel.roomModels.removeAll()
            }
            for element in data {
                let roomModel = RFRoomModel(dic: element)
                self.prettyAnchorModel.roomModels.append(roomModel)
            }
            
            dispatchGroup.leave()
        }
        
        // 请求2-12区的游戏数据
        dispatchGroup.enter()
        requestAnchorData(urlString: GetHotCateURL, parameters: parameters) {
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: DispatchQueue.main) {
            self.anchorModels.insert(self.prettyAnchorModel, at: 0)
            self.anchorModels.insert(self.hotAnchorModel, at: 0)
            
            completionHandler()
        }
    }
    
    // MARK: - 无线轮播图
    func requestBannerData(_ completionHandler: @escaping () -> Void) {
        Network.request(urlString: SlideURL, parameters: ["version": "2.300"]) { (value, error) in
            guard let value = value else {
                print(error!.localizedDescription)
                return;
            }
            
            print(value)
            guard let dic = value as? [String: NSObject] else { return }
            guard let data = dic["data"] as? [[String: NSObject]] else { return }
            
            if !self.bannerModels.isEmpty {
                self.bannerModels.removeAll()
            }
            for element in data {
                let bannerModel = RFBannerModel(dic: element)
                self.bannerModels.append(bannerModel)
            }
            
            completionHandler()
        }
    }
}
