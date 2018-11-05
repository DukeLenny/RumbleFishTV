//
//  RFNavigationController.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/8/22.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

class RFNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let popGestureRecognizer = interactivePopGestureRecognizer {
            if let gestureView = popGestureRecognizer.view {
                if let targets = popGestureRecognizer.value(forKey: "_targets") as? [NSObject] {
                    if let targetObjc = targets.first {
                        if let target = targetObjc.value(forKey: "target") {
                            let action = Selector(("handleNavigationTransition:"))
                            let panGestureRecognizer = UIPanGestureRecognizer(target: target, action: action)
                            gestureView.addGestureRecognizer(panGestureRecognizer)
                        }
                    }
                }
            }
        }
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.hidesBottomBarWhenPushed = true
        super.pushViewController(viewController, animated: animated)
    }

}
