//
//  RFRoomNormalViewController.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/11/2.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

class RFRoomNormalViewController: UIViewController { // , UIGestureRecognizerDelegate

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
//        navigationController?.interactivePopGestureRecognizer?.delegate = self
//        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        present(RFTestViewController(), animated: true, completion: nil)
    }

}

// MARK: - SetUI
extension RFRoomNormalViewController {
    private func setUI() {
        view.backgroundColor = UIColor.purple
    }
}
