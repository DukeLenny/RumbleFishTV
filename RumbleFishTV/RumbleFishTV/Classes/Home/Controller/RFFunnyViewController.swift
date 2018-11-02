//
//  RFFunnyViewController.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/11/1.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

class RFFunnyViewController: RFBaseAnchorViewController {
    
    private lazy var funnyViewModel: RFFunnyViewModel = RFFunnyViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

}

// MARK: - SetUI
extension RFFunnyViewController {
    override func setUI() {
        super.setUI()
        
        let collectionViewFlowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        collectionViewFlowLayout.headerReferenceSize = CGSize.zero
        
        collectionView.contentInset = UIEdgeInsets(top: 8.0, left: 0, bottom: 0, right: 0)
    }
}

// MARK: - RequestData
extension RFFunnyViewController {
    override func requestData() {
        baseAnchorViewModel = funnyViewModel
        funnyViewModel.requestFunnyData {
            self.collectionView.reloadData()
            
            self.hideAnimationImageView()
        }
    }
}
