//
//  RFRecommendGameView.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/10/25.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

private let kCellId = "RFRecommendGameCollectionViewCell"
private let kContentInsetMargin: CGFloat = 10.0

class RFRecommendGameView: UIView {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    class func instance() -> RFRecommendGameView {
        return Bundle.main.loadNibNamed("RFRecommendGameView", owner: nil, options: nil)?.first as! RFRecommendGameView
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        autoresizingMask = UIViewAutoresizing()
        
        collectionView.register(UINib(nibName: "RFRecommendGameCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: kCellId)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: kContentInsetMargin, bottom: 0, right: kContentInsetMargin)
    }
    
    var anchorModels: [RFAnchorModel]? {
        didSet {
            anchorModels?.removeFirst()
            anchorModels?.removeFirst()
            
            let anchorModel = RFAnchorModel()
            anchorModel.tag_name = "更多"
            anchorModels?.append(anchorModel)
            
            collectionView.reloadData()
        }
    }

}

extension RFRecommendGameView: UICollectionViewDataSource, UICollectionViewDelegate {
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
