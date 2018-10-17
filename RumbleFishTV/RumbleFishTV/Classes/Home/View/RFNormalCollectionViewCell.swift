//
//  RFNormalCollectionViewCell.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/9/13.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

class RFNormalCollectionViewCell: RFBaseCollectionViewCell {
    
    @IBOutlet private weak var roomImageView: UIImageView!
    @IBOutlet private weak var roomNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override var roomModel: RFRoomModel? {
        didSet {
            super.roomModel = roomModel
            
            roomNameLabel.text = roomModel?.room_name
        }
    }

}
