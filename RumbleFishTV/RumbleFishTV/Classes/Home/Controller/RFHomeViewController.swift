//
//  RFHomeViewController.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/8/29.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

class RFHomeViewController: UIViewController {
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUI()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Event
    @objc fileprivate func leftBarButtonClicked() {
        
    }

}

// MARK: - SetUI
extension RFHomeViewController {
    fileprivate func setUI() {
        setNavigationItem()
    }
    
    private func setNavigationItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(target: self, action: #selector(leftBarButtonClicked), imageName: "logo", highlightedImageName: nil)
    }
}
