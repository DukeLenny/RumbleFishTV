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

}

extension RFAmuseMenuView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellId, for: indexPath) as! RFAmuseMenuCollectionViewCell
        cell.contentView.backgroundColor = UIColor.white
        
        
        
        return cell
    }
}
