//
//  RFAmuseMenuView.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/10/31.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

private let kCellId = "RFAmuseMenuCollectionViewCell"

class RFAmuseMenuView: UIView {

    
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    class func instance() -> RFAmuseMenuView {
        return Bundle.main.loadNibNamed("RFAmuseMenuView", owner: nil, options: nil)?.first as! RFAmuseMenuView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        autoresizingMask = UIViewAutoresizing()
        
        collectionView.register(UINib(nibName: "RFAmuseMenuCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: kCellId)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let collectionViewFlowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        collectionViewFlowLayout.itemSize = collectionView.bounds.size
    }
    
    var anchorModels: [RFAnchorModel]? {
        didSet {
            collectionView.reloadData()
        }
    }

}

extension RFAmuseMenuView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var number: Int = 0
        if let models = anchorModels {
            if !models.isEmpty {
                number = (models.count - 1) / 8 + 1
            }
        }
        pageControl.numberOfPages = number
        return number
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellId, for: indexPath) as! RFAmuseMenuCollectionViewCell
        cell.contentView.backgroundColor = UIColor.white
        
        setDataWithCell(cell, indexPath: indexPath)
        
        return cell
    }
    
    private func setDataWithCell(_ cell: RFAmuseMenuCollectionViewCell, indexPath: IndexPath) {
        let models = anchorModels!
        /*
         item 0: index 0~7
         item 1: index 8~15
         item 2: index 16~23
         ...
         */
        let startIndex = indexPath.item * 8
        var endIndex = (indexPath.item + 1) * 8 - 1
        if endIndex >= models.count {
            endIndex = models.count - 1
        }
        cell.anchorModels = Array(models[startIndex...endIndex])
    }
    
    // UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let models = anchorModels else { return }
        if models.isEmpty { return }
        
        let offsetX = scrollView.contentOffset.x
        let width = scrollView.bounds.width
        var currentIndex: Int = 0
        if offsetX < 0 {
            currentIndex = 0
        } else {
            let expectedOffsetX = offsetX + width / 2.0
            currentIndex = Int(expectedOffsetX / width)
        }
        let count = pageControl.numberOfPages
        if currentIndex >= count {
            currentIndex = count - 1
        }
        
        pageControl.currentPage = currentIndex
    }
}
