//
//  RFRecommendGameView.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/10/25.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

class RFRecommendGameView: UIView {
    
    class func instance() -> RFRecommendGameView {
        return Bundle.main.loadNibNamed("RFRecommendGameView", owner: nil, options: nil)?.first as! RFRecommendGameView
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        autoresizingMask = UIViewAutoresizing()
    }
    
    

}
