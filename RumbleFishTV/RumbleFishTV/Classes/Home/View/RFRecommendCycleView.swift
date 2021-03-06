//
//  RFRecommendCycleView.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/10/17.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

private let kCellId = "RFRecommendBannerCollectionViewCell"

class RFRecommendCycleView: UIView {

    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var pageControl: UIPageControl!
    
    private var timer: Timer?
    
    class func instance() -> RFRecommendCycleView {
        return Bundle.main.loadNibNamed("RFRecommendCycleView", owner: nil, options: nil)?.first as! RFRecommendCycleView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        autoresizingMask = UIViewAutoresizing()
        
//        collectionView.bounces = true
        collectionView.register(UINib(nibName: "RFRecommendBannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: kCellId)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let collectionViewFlowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        collectionViewFlowLayout.itemSize = collectionView.bounds.size
    }
    
    var bannerModels: [RFBannerModel]? {
        didSet {
            collectionView.reloadData()
            if let bannerModels = bannerModels {
                if !bannerModels.isEmpty {
                    collectionView.scrollToItem(at: IndexPath(item: bannerModels.count * 100, section: 0), at: .left, animated: false)
                }
            }
            
            pageControl.numberOfPages = bannerModels?.count ?? 0
            
            removeTimer()
            if let bannerModels = bannerModels {
                if !bannerModels.isEmpty {
                   addTimer()
                }
            }
        }
    }

}

// MARK: - 定时器
extension RFRecommendCycleView {
    private func addTimer() {
        timer = Timer(timeInterval: 3.0, target: self, selector: #selector(onTimer), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .commonModes)
    }
    
    private func removeTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc private func onTimer() {
        let offsetX = collectionView.contentOffset.x + collectionView.bounds.width
        collectionView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    }
}

extension RFRecommendCycleView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return bannerModels?.count ?? 0
        // 为了实现无线轮播
        return (bannerModels?.count ?? 0) * 10000
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellId, for: indexPath) as! RFRecommendBannerCollectionViewCell
        cell.contentView.backgroundColor = UIColor.white
        
//        let bannerModel: RFBannerModel = bannerModels![indexPath.item]
        let bannerModel: RFBannerModel = bannerModels![indexPath.item % bannerModels!.count]
        
        cell.bannerModel = bannerModel
        
        return cell
    }
    
    // UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let bannerModels = bannerModels else { return }
        if bannerModels.isEmpty { return }
        
        let offsetX = scrollView.contentOffset.x
        let width = scrollView.bounds.width
        var currentIndex: Int = 0
        if offsetX < 0 {
            currentIndex = 0
        } else {
//            currentIndex = Int(offsetX / width)
            // 当当前页滚动到一半时索引改变
            let expectedOffsetX = offsetX + width / 2.0
//            currentIndex = Int(expectedOffsetX / width)
            currentIndex = Int(expectedOffsetX / width) % bannerModels.count
        }
        if currentIndex >= bannerModels.count {
            currentIndex = bannerModels.count - 1
        }
        
        pageControl.currentPage = currentIndex
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        guard let bannerModels = bannerModels else { return }
        if bannerModels.isEmpty { return }
        addTimer()
    }
}
