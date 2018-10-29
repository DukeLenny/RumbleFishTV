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
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    
    var anchorModel: RFAnchorModel? {
        didSet {
            imageView.image = UIImage(named: anchorModel?.icon_name ?? "home_header_normal")
            textLabel.text = anchorModel?.tag_name
        }
    }
    
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

extension RFRecommendCollectionSectionHeaderView {
    class func instance() -> RFRecommendCollectionSectionHeaderView {
        return Bundle.main.loadNibNamed("RFRecommendCollectionSectionHeaderView", owner: nil, options: nil)?.first as! RFRecommendCollectionSectionHeaderView
    }
}
