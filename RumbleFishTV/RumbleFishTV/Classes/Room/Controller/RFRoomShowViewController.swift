//
//  RFRoomShowViewController.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/11/2.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

class RFRoomShowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }

}

// MARK: - SetUI
extension RFRoomShowViewController {
    private func setUI() {
        view.backgroundColor = UIColor.orange
    }
}
