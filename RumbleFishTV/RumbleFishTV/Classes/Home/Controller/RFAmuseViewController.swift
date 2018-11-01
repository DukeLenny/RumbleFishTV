//
//  RFAmuseViewController.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/10/29.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

private let kMenuViewHeight: CGFloat = 200.0

class RFAmuseViewController: RFBaseAnchorViewController {
    
    private lazy var amuseViewModel: RFAmuseViewModel = RFAmuseViewModel()
    
    private lazy var menuView: RFAmuseMenuView = {
        let menuView = RFAmuseMenuView.instance()
        menuView.frame = CGRect(x: 0, y: -kMenuViewHeight, width: ScreenWidth, height: kMenuViewHeight)
        return menuView
    }()

}

// MARK: - SetUI
extension RFAmuseViewController {
    override func setUI() {
        super.setUI()
        
        collectionView.addSubview(menuView)
        
        collectionView.contentInset = UIEdgeInsets(top: kMenuViewHeight, left: 0, bottom: 0, right: 0)
    }
}

// MARK: - RequestData
extension RFAmuseViewController {
    override func requestData() {
        baseAnchorViewModel = amuseViewModel
        amuseViewModel.requestAmuseData {
            self.collectionView.reloadData()
            
            var models = self.amuseViewModel.anchorModels
            models.removeFirst()
            self.menuView.anchorModels = models
        }
    }
}
