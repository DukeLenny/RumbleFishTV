//
//  RFRecommendGameCollectionViewCell.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/10/25.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit
import Kingfisher

class RFRecommendGameCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var anchorModel: RFAnchorModel? {
        didSet {
            titleLabel.text = anchorModel?.tag_name
            let iconImageURL = URL(string: anchorModel?.icon_url ?? "")
            iconImageView.kf.setImage(with: iconImageURL, placeholder: UIImage(named: "home_more_btn"))
        }
    }

}
