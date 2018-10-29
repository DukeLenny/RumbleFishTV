//
//  RFAmuseViewController.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/10/29.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

private let kItemMargin: CGFloat = 10.0
private let kInteritemSpacing: CGFloat = kItemMargin
private let kItemColumnCount: CGFloat = 2
private let kItemWidth: CGFloat = (ScreenWidth - 2 * kItemMargin - (kItemColumnCount - 1) * kInteritemSpacing) / kItemColumnCount
private let kItemHeight: CGFloat = kItemWidth * 3 / 4

private let kHeaderHeight: CGFloat = 50.0

private let kCollectionViewCellId = "RFNormalCollectionViewCell"
private let kCollectionSectionHeaderViewId = "RFRecommendCollectionSectionHeaderView"

class RFAmuseViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {[unowned self] in
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
        //        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kCollectionSectionHeaderViewId)
        collectionView.register(UINib(nibName: "RFRecommendCollectionSectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kCollectionSectionHeaderViewId)
        setAutomaticallyAdjustsScrollViewInsetsFalse(scrollView: collectionView, vc: self)
        return collectionView
        }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }

}

// MARK: - SetUI
extension RFAmuseViewController {
    private func setUI() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(collectionView)
        
        
    }
    
    
}

extension RFAmuseViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCollectionViewCellId, for: indexPath) as! RFNormalCollectionViewCell
        cell.contentView.backgroundColor = UIColor.random()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kCollectionSectionHeaderViewId, for: indexPath) as! RFRecommendCollectionSectionHeaderView
        
        return supplementaryView
    }
}
