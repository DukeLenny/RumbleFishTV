//
//  RFRecommendCollectionSectionHeaderView.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/9/12.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

class CollectionSupplementaryLayer: CALayer {
    override var zPosition: CGFloat {
        get {
            return 0
        }
        set {
            super.zPosition = newValue
        }
    }
}

class RFRecommendCollectionSectionHeaderView: UICollectionReusableView {

    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var moreButton: UIButton!
    
    override class var layerClass: Swift.AnyClass {
        get {
            if #available(iOS 11.0, *) {
                return CollectionSupplementaryLayer.self
            } else {
                return super.layerClass
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction @objc private func moreButtonClicked(_ sender: UIButton) {
        
    }
    
}