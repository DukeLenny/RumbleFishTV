//
//  RFRecommendCycleView.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/10/17.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

class RFRecommendCycleView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        autoresizingMask = UIViewAutoresizing()
    }
    
    class func instance() -> RFRecommendCycleView {
        return Bundle.main.loadNibNamed("RFRecommendCycleView", owner: nil, options: nil)?.first as! RFRecommendCycleView
    }

}
