//
//  RFRecommendBannerCollectionViewCell.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/10/24.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit
import Kingfisher

class RFRecommendBannerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var bannerModel: RFBannerModel? {
        didSet {
            let url = URL(string: bannerModel?.pic_url ?? "")
            iconImageView.kf.setImage(with: url, placeholder: UIImage(named: "Img_default"))
            
            titleLabel.text = bannerModel?.title
        }
    }

}
