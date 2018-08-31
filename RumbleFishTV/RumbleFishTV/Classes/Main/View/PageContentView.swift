//
//  PageContentView.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/8/31.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

fileprivate let kCollectionViewCellReuseIdentifier = "UICollectionViewCell"

class PageContentView: UIView {

    fileprivate var parentViewController: UIViewController
    fileprivate var childViewControllers: [UIViewController]
    
    private lazy var collectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.minimumLineSpacing = 0.0
        collectionViewFlowLayout.minimumInteritemSpacing = 0.0
        collectionViewFlowLayout.itemSize = bounds.size
        collectionViewFlowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: bounds, collectionViewLayout: collectionViewFlowLayout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        collectionView.isPagingEnabled = true
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kCollectionViewCellReuseIdentifier)
        setAutomaticallyAdjustsScrollViewInsetsFalse(scrollView: collectionView, vc: parentViewController)
        return collectionView
    }()
    
    init(frame: CGRect, parentViewController: UIViewController, childViewControllers: [UIViewController]) {
        self.parentViewController = parentViewController
        self.childViewControllers = childViewControllers
        
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - SetUI
extension PageContentView {
    fileprivate func setUI() {
        backgroundColor = UIColor.clear
        
        for childViewController in childViewControllers {
            parentViewController.addChildViewController(childViewController)
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
