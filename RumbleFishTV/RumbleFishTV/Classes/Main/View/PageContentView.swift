//
//  PageContentView.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/8/31.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

private let kCollectionViewCellReuseIdentifier = "UICollectionViewCell"

class PageContentView: UIView {

    private weak var parentViewController: UIViewController?
    private var childViewControllers: [UIViewController]
    
    private var currentContentOffsetX: CGFloat = 0.0
    
    private lazy var collectionView: UICollectionView = {[weak self] in 
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.minimumLineSpacing = 0.0
        collectionViewFlowLayout.minimumInteritemSpacing = 0.0
        collectionViewFlowLayout.itemSize = self!.bounds.size
        collectionViewFlowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: self!.bounds, collectionViewLayout: collectionViewFlowLayout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        collectionView.isPagingEnabled = true
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kCollectionViewCellReuseIdentifier)
        if let parentViewController = self!.parentViewController {
            setAutomaticallyAdjustsScrollViewInsetsFalse(scrollView: collectionView, vc: parentViewController)
        }
        return collectionView
    }()
    
    init(frame: CGRect, parentViewController: UIViewController?, childViewControllers: [UIViewController]) {
        self.parentViewController = parentViewController
        self.childViewControllers = childViewControllers
        
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var isSetContentOffset: Bool = false
    
    func setCurrentIndex(_ index: Int) {
        isSetContentOffset = true
        
        collectionView.setContentOffset(CGPoint(x: CGFloat(index) * collectionView.bounds.width, y: 0.0), animated: false)
    }
    
}

// MARK: - SetUI
extension PageContentView {
    private func setUI() {
        backgroundColor = UIColor.clear
        
        for childViewController in childViewControllers {
            parentViewController?.addChildViewController(childViewController)
        }
        
        addSubview(collectionView)
    }
    
    
}

extension PageContentView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childViewControllers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: kCollectionViewCellReuseIdentifier, for: indexPath)
        cell.contentView.backgroundColor = UIColor.clear
        
        let childViewController = childViewControllers[indexPath.item]
        
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        childViewController.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childViewController.view)
        
        return cell
    }
}

extension PageContentView: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        currentContentOffsetX = scrollView.contentOffset.x
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if isSetContentOffset {
            isSetContentOffset = false
            return
        }
        
        var progress: CGFloat = 0.0
        var sourceIndex: Int = 0
        var targetIndex: Int = 0
        
        let scrollViewContentOffsetX = scrollView.contentOffset.x
        let scrollViewWidth = scrollView.bounds.width
        let ratio = scrollViewContentOffsetX / scrollViewWidth
        if scrollViewContentOffsetX > currentContentOffsetX {
            // 左滑
            progress = ratio - floor(ratio)
            sourceIndex = Int(ratio)
            targetIndex = sourceIndex + 1
            if scrollViewContentOffsetX - currentContentOffsetX == scrollViewWidth {
                progress = 1.0
                targetIndex = sourceIndex
                sourceIndex = sourceIndex - 1
            }
        } else if scrollViewContentOffsetX == currentContentOffsetX {
            progress = 0.0
            sourceIndex = Int(ratio)
            targetIndex = sourceIndex
        } else {
            // 右滑
            progress = 1 - (ratio - floor(ratio))
            targetIndex = Int(ratio)
            sourceIndex = targetIndex + 1
        }
        
//        print("progress = \(progress), sourceIndex = \(sourceIndex), targetIndex = \(targetIndex)")
    }
}
