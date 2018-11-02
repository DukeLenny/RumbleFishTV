//
//  BaseViewController.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/11/2.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var contentView: UIView?
    
    private lazy var animationImageView: UIImageView = {[unowned self] in
        let animationImageView = UIImageView(image: UIImage(named: "img_loading_1"))
        animationImageView.center = self.view.center
        animationImageView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin]
        animationImageView.animationImages = [UIImage(named: "img_loading_1")!, UIImage(named: "img_loading_2")!]
        animationImageView.animationDuration = 0.5
        animationImageView.animationRepeatCount = 0
        return animationImageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }

}

// MARK: - SetUI
extension BaseViewController {
    @objc func setUI() {
        view.addSubview(animationImageView)
        animationImageView.startAnimating()
        
        contentView?.isHidden = true
    }
    
    func hideAnimationImageView() {
        if animationImageView.isAnimating {
            animationImageView.stopAnimating()
        }
        animationImageView.isHidden = true
        
        contentView?.isHidden = false
    }
}
