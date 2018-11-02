//
//  RFBaseAnchorViewController.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/10/30.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

private let kItemMargin: CGFloat = 10.0
private let kInteritemSpacing: CGFloat = kItemMargin
private let kItemColumnCount: CGFloat = 2
let kItemWidth: CGFloat = (ScreenWidth - 2 * kItemMargin - (kItemColumnCount - 1) * kInteritemSpacing) / kItemColumnCount
let kItemHeight: CGFloat = kItemWidth * 3 / 4

private let kHeaderHeight: CGFloat = 50.0

private let kCollectionViewCellId = "RFNormalCollectionViewCell"
let kPrettyCollectionViewCellId = "RFHighCollectionViewCell"
private let kCollectionSectionHeaderViewId = "RFRecommendCollectionSectionHeaderView"

class RFBaseAnchorViewController: BaseViewController {
    
    var baseAnchorViewModel: RFBaseAnchorViewModel!
    
    lazy var collectionView: UICollectionView = {[unowned self] in
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.minimumLineSpacing = 0.0
        collectionViewFlowLayout.minimumInteritemSpacing = kInteritemSpacing
        collectionViewFlowLayout.itemSize = CGSize(width: kItemWidth, height: kItemHeight)
        collectionViewFlowLayout.headerReferenceSize = CGSize(width: ScreenWidth, height: kHeaderHeight)
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
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
        //        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kCollectionViewCellId)
        collectionView.register(UINib(nibName: "RFNormalCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: kCollectionViewCellId)
        collectionView.register(UINib(nibName: "RFHighCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: kPrettyCollectionViewCellId)
        //        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kCollectionSectionHeaderViewId)
        collectionView.register(UINib(nibName: "RFRecommendCollectionSectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kCollectionSectionHeaderViewId)
        setAutomaticallyAdjustsScrollViewInsetsFalse(scrollView: collectionView, vc: self)
        return collectionView
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestData()
    }

}

// MARK: - SetUI
extension RFBaseAnchorViewController {
    override func setUI() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(collectionView)
        
        contentView = collectionView
        
        super.setUI()
    }
    
    
}

// MARK: - RequestData
extension RFBaseAnchorViewController {
    @objc func requestData() {
        
    }
}

extension RFBaseAnchorViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if baseAnchorViewModel == nil {
            return 1
        }
        
        return baseAnchorViewModel.anchorModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if baseAnchorViewModel == nil {
            return 20
        }
        
        let anchorModel = baseAnchorViewModel.anchorModels[section]
        return anchorModel.roomModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCollectionViewCellId, for: indexPath) as! RFNormalCollectionViewCell
        cell.contentView.backgroundColor = UIColor.white
        
        if baseAnchorViewModel == nil {
            return cell
        }
        
        let anchorModel = baseAnchorViewModel.anchorModels[indexPath.section]
        let roomModel = anchorModel.roomModels[indexPath.item]
        
        cell.roomModel = roomModel
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kCollectionSectionHeaderViewId, for: indexPath) as! RFRecommendCollectionSectionHeaderView
        
        if baseAnchorViewModel == nil {
            return supplementaryView
        }
        
        let anchorModel = baseAnchorViewModel.anchorModels[indexPath.section]
        
        supplementaryView.anchorModel = anchorModel
        
        return supplementaryView
    }
}
