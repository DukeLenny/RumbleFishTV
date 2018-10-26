//
//  RFGameViewModel.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/10/26.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

class RFGameViewModel {
    
    lazy var gameModels: [RFGameModel] = [RFGameModel]()
    
}

extension RFGameViewModel {
    func requestAllGamesData(_ completionHandler: @escaping () -> Void) {
        Network.request(urlString: GetColumnDetailURL) { (value, error) in
            guard let value = value else {
                print(error!.localizedDescription)
                return;
            }
            
            print(value)
            guard let dic = value as? [String: Any] else { return }
            guard let data = dic["data"] as? [[String: Any]] else { return }
            
            if !self.gameModels.isEmpty { self.gameModels.removeAll() }
            for element in data {
                let gameModel = RFGameModel(dic: element)
                self.gameModels.append(gameModel)
            }
            
            completionHandler()
        }
    }
}
