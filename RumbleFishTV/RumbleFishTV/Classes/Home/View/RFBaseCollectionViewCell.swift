//
//  RFBaseCollectionViewCell.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/10/17.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit
import Kingfisher

class RFBaseCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var coverImageView: UIImageView!
    @IBOutlet private weak var nicknameLabel: UILabel!
    @IBOutlet private weak var onlineButton: UIButton!
    
    var roomModel: RFRoomModel? {
        didSet {
            let coverImageURL = URL(string: roomModel?.vertical_src ?? "")
            coverImageView.kf.setImage(with: coverImageURL)
            
            nicknameLabel.text = roomModel?.nickname
            
            let online = roomModel?.online ?? 0
            var onlineStr = "\(online)"
            if online >= 10000 {
                onlineStr = "\(Int(online / 10000))万"
            }
            onlineStr = "\(onlineStr)在线"
            onlineButton.setTitle(onlineStr, for: .normal)
        }
    }
    
}
