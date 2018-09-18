//
//  RFRecommendViewController.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/9/11.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

private let kItemMargin: CGFloat = 10.0
private let kInteritemSpacing: CGFloat = kItemMargin
private let kItemColumnCount: CGFloat = 2
private let kItemWidth: CGFloat = (ScreenWidth - 2 * kItemMargin - (kItemColumnCount - 1) * kInteritemSpacing) / kItemColumnCount
private let kItemHeight: CGFloat = kItemWidth * 3 / 4

private let kHeaderHeight: CGFloat = 50.0
private let kPrettyItemHeight: CGFloat = kItemWidth * 4 / 3

private let kCollectionViewCellId = "RFNormalCollectionViewCell"
private let kCollectionSectionHeaderViewId = "RFRecommendCollectionSectionHeaderView"
private let kPrettyCollectionViewCellId = "RFHighCollectionViewCell"

class RFRecommendViewController: UIViewController {
    
    private lazy var sectionHeaderTitles: [String] = ["热门","颜值","穿越火线","一起看","二次元","户外","科普","美食","LOL","绝地求生","王者荣耀","炉石传说"]
    
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
        collectionView.register(UINib(nibName: "RFHighCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: kPrettyCollectionViewCellId)
//        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kCollectionSectionHeaderViewId)
        collectionView.register(UINib(nibName: "RFRecommendCollectionSectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kCollectionSectionHeaderViewId)
        setAutomaticallyAdjustsScrollViewInsetsFalse(scrollView: collectionView, vc: self)
        return collectionView
        }()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUI()
    }

}

// MARK: - SetUI
extension RFRecommendViewController {
    private func setUI() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(collectionView)
    }
    
    
}

extension RFRecommendViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionHeaderTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            // 热门
            return 8
        }
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            // 颜值
            let cell: RFHighCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCollectionViewCellId, for: indexPath) as! RFHighCollectionViewCell
            cell.contentView.backgroundColor = UIColor.white
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCollectionViewCellId, for: indexPath)
            cell.contentView.backgroundColor = UIColor.white
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kCollectionSectionHeaderViewId, for: indexPath)
//        supplementaryView.backgroundColor = UIColor.green
        return supplementaryView
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