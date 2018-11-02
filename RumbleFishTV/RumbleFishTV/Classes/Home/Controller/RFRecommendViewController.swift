//
//  RFRecommendViewController.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/9/11.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

private let kPrettyItemHeight: CGFloat = kItemWidth * 4 / 3
private let kCycleViewHeight: CGFloat = ScreenWidth * 3 / 8
private let kGameViewHeight: CGFloat = 90.0

class RFRecommendViewController: RFBaseAnchorViewController {
    
    private lazy var recommendViewModel: RFRecommendViewModel = RFRecommendViewModel()
    
    private lazy var cycleView: RFRecommendCycleView = {
        let cycleView = RFRecommendCycleView.instance()
        cycleView.frame = CGRect(x: 0, y: -(kCycleViewHeight + kGameViewHeight), width: ScreenWidth, height: kCycleViewHeight)
        return cycleView;
    }()
    
    private lazy var gameView: RFRecommendGameView = {
        let gameView = RFRecommendGameView.instance()
        gameView.frame = CGRect(x: 0, y: -kGameViewHeight, width: ScreenWidth, height: kGameViewHeight)
        return gameView
    }()

}

// MARK: - SetUI
extension RFRecommendViewController {
    override func setUI() {
        super.setUI()
        
        collectionView.addSubview(cycleView)
        collectionView.addSubview(gameView)
        collectionView.contentInset = UIEdgeInsets(top: kCycleViewHeight + kGameViewHeight, left: 0, bottom: 0, right: 0)
    }
    
    
}

// MARK: - 请求数据
extension RFRecommendViewController {
    override func requestData() {
        baseAnchorViewModel = recommendViewModel
        
        recommendViewModel.requestBannerData {
            self.cycleView.bannerModels = self.recommendViewModel.bannerModels
        }
        
        recommendViewModel.requestData {
            
            var anchorModels = self.recommendViewModel.anchorModels
            anchorModels.removeFirst()
            anchorModels.removeFirst()
            let anchorModel = RFAnchorModel()
            anchorModel.tag_name = "更多"
            anchorModels.append(anchorModel)
            self.gameView.anchorModels = anchorModels
            
            self.collectionView.reloadData()
            
            self.hideAnimationImageView()
        }
    }
}

extension RFRecommendViewController: UICollectionViewDelegateFlowLayout {
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            // 颜值
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCollectionViewCellId, for: indexPath) as! RFHighCollectionViewCell
            cell.contentView.backgroundColor = UIColor.white
            let anchorModel = recommendViewModel.anchorModels[indexPath.section]
            let roomModel = anchorModel.roomModels[indexPath.item]
            cell.roomModel = roomModel
            return cell
        } else {
            return super.collectionView(collectionView, cellForItemAt: indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            // 颜值
            return CGSize(width: kItemWidth, height: kPrettyItemHeight)
        } else {
            return CGSize(width: kItemWidth, height: kItemHeight)
        }
    }
}
