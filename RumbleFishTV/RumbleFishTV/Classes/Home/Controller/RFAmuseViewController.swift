//
//  RFAmuseViewController.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/10/29.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

class RFAmuseViewController: RFBaseAnchorViewController {
    
    private lazy var amuseViewModel: RFAmuseViewModel = RFAmuseViewModel()

}

// MARK: - RequestData
extension RFAmuseViewController {
    override func requestData() {
        baseAnchorViewModel = amuseViewModel
        amuseViewModel.requestAmuseData {
           self.collectionView.reloadData()
        }
    }
}
