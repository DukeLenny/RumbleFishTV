//
//  RFRecommendGameView.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/10/25.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

private let kCellId = "RFRecommendGameCollectionViewCell"

class RFRecommendGameView: UIView {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    class func instance() -> RFRecommendGameView {
        return Bundle.main.loadNibNamed("RFRecommendGameView", owner: nil, options: nil)?.first as! RFRecommendGameView
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        autoresizingMask = UIViewAutoresizing()
        
        collectionView.register(UINib(nibName: "RFRecommendGameCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: kCellId)
    }
    
    

}

extension RFRecommendGameView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellId, for: indexPath) as! RFRecommendGameCollectionViewCell
        cell.contentView.backgroundColor = UIColor.random()
        
        return cell
    }
}
