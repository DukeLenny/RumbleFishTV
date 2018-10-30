//
//  RFBaseAnchorViewModel.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/10/30.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

class RFBaseAnchorViewModel {
    lazy var anchorModels: [RFAnchorModel] = [RFAnchorModel]()
}

// MARK: - 发送网络请求
extension RFBaseAnchorViewModel {
    func requestAnchorData(urlString: String, parameters: [String: Any]? = nil, completionHandler: @escaping () -> Void) {
        Network.request(urlString: urlString, parameters: parameters) { (value, error) in
            guard let value = value else {
                print(error!.localizedDescription)
                return
            }
            guard let dic = value as? [String: Any] else { return }
            guard let data = dic["data"] as? [[String: Any]] else { return }
            
            if !self.anchorModels.isEmpty { self.anchorModels.removeAll() }
            for element in data {
                let anchorModel = RFAnchorModel(dic: element)
                self.anchorModels.append(anchorModel)
            }
            
            completionHandler()
        }
    }
}
