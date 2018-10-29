//
//  RFGameViewController.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/10/26.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

private let kEdgeInsetMargin: CGFloat = 10.0
private let kItemWidth: CGFloat = (ScreenWidth - 2 * kEdgeInsetMargin) / 3
private let kItemHeight: CGFloat = kItemWidth * 6 / 5
private let kHeaderHeight: CGFloat = 50.0
private let kTopContentViewHeight: CGFloat = 90.0
private let kCellId = "RFRecommendGameCollectionViewCell"
private let kHeaderId = "RFRecommendCollectionSectionHeaderView"

class RFGameViewController: UIViewController {
    
    private lazy var gameViewModel: RFGameViewModel = RFGameViewModel()
    
    private lazy var collectionView: UICollectionView = {[unowned self] in
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.minimumLineSpacing = 0.0
        collectionViewFlowLayout.minimumInteritemSpacing = 0.0
        collectionViewFlowLayout.itemSize = CGSize(width: kItemWidth, height: kItemHeight)
        collectionViewFlowLayout.headerReferenceSize = CGSize(width: ScreenWidth, height: kHeaderHeight)
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: kEdgeInsetMargin, bottom: 0, right: kEdgeInsetMargin)
        //        collectionViewFlowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: collectionViewFlowLayout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = UIColor.clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = true
        collectionView.showsHorizontalScrollIndicator = false
        //        collectionView.bounces = false
        //        collectionView.isPagingEnabled = true
        collectionView.register(UINib(nibName: "RFRecommendGameCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: kCellId)
        collectionView.register(UINib(nibName: "RFRecommendCollectionSectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderId)
        setAutomaticallyAdjustsScrollViewInsetsFalse(scrollView: collectionView, vc: self)
        return collectionView
    }()
    
    private lazy var topHeaderView: RFRecommendCollectionSectionHeaderView = {
        let topHeaderView = RFRecommendCollectionSectionHeaderView.instance()
        topHeaderView.frame = CGRect(x: 0, y: -(kTopContentViewHeight + kHeaderHeight), width: ScreenWidth, height: kHeaderHeight)
        topHeaderView.imageView.image = UIImage(named: "Img_orange")
        topHeaderView.textLabel.text = "常用"
        topHeaderView.moreButton.isHidden = true
        return topHeaderView
    }()
    
    private lazy var gameView: RFRecommendGameView = {
        let gameView = RFRecommendGameView.instance()
        gameView.frame = CGRect(x: 0, y: -kTopContentViewHeight, width: ScreenWidth, height: kTopContentViewHeight)
        return gameView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        
        requestData()
    }

}

// MARK: - SetUI
extension RFGameViewController {
    private func setUI() {
       view.backgroundColor = UIColor.white
        
       view.addSubview(collectionView)
        
       collectionView.addSubview(topHeaderView)
       collectionView.addSubview(gameView)
        
       collectionView.contentInset = UIEdgeInsets(top: kHeaderHeight + kTopContentViewHeight, left: 0, bottom: 0, right: 0)
    }
}

// MARK: - RequestData
extension RFGameViewController {
    private func requestData() {
        gameViewModel.requestAllGamesData {
            self.gameView.anchorModels = Array(self.gameViewModel.gameModels[0..<10])
            
            self.collectionView.reloadData()
        }
    }
}

extension RFGameViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameViewModel.gameModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellId, for: indexPath) as! RFRecommendGameCollectionViewCell
        cell.contentView.backgroundColor = UIColor.white
        cell.lineView.isHidden = false
        
        let gameModel = gameViewModel.gameModels[indexPath.item]
        
        cell.anchorModel = gameModel
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderId, for: indexPath) as! RFRecommendCollectionSectionHeaderView
        view.imageView.image = UIImage(named: "Img_orange")
        view.textLabel.text = "全部"
        view.moreButton.isHidden = true
        return view
    }
}
