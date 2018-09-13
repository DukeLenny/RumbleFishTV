//
//  RFNormalCollectionViewCell.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/9/13.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

class RFNormalCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var liveImageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var coverImageView: UIImageView!
    @IBOutlet private weak var introLabel: UILabel!
    @IBOutlet private weak var onlineButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

}
