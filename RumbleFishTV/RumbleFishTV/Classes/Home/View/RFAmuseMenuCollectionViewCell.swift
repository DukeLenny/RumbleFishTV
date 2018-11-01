//
//  RFAmuseMenuCollectionViewCell.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/10/31.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

private let kCellId = "RFRecommendGameCollectionViewCell"

class RFAmuseMenuCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.register(UINib(nibName: "RFRecommendGameCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: kCellId)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let collectionViewFlowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let itemWidth = collectionView.bounds.width / 4
        let itemHeight = collectionView.bounds.height / 2
        collectionViewFlowLayout.itemSize = CGSize(width: itemWidth, height: itemHeight)
    }
    
    var anchorModels: [RFAnchorModel]? {
        didSet {
            collectionView.reloadData()
        }
    }

}

extension RFAmuseMenuCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return anchorModels?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellId, for: indexPath) as! RFRecommendGameCollectionViewCell
        cell.contentView.backgroundColor = UIColor.white
        cell.lineView.isHidden = true
        
        let anchorModel = anchorModels![indexPath.item]
        cell.anchorModel = anchorModel
        
        return cell
    }
}
