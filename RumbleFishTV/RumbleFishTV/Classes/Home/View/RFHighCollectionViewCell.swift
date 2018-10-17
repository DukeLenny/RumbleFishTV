//
//  RFHighCollectionViewCell.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/9/13.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

class RFHighCollectionViewCell: RFBaseCollectionViewCell {
    
    @IBOutlet private weak var cityButton: UIButton!
//    @IBOutlet private weak var onlineLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override var roomModel: RFRoomModel? {
        didSet {
            super.roomModel = roomModel
            
            cityButton.setTitle(roomModel?.anchor_city, for: .normal)
        }
    }

}
