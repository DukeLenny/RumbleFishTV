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
    
    @objc fileprivate func historyBarButtonClicked() {
        
    }
    
    @objc fileprivate func searchBarButtonClicked() {
        
    }
    
    @objc fileprivate func qrcodeBarButtonClicked() {
        
    }

}

// MARK: - SetUI
extension RFHomeViewController {
    fileprivate func setUI() {
        setNavigationItem()
    }
    
    private func setNavigationItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(target: self, action: #selector(leftBarButtonClicked), imageName: "logo", highlightedImageName: nil)
        
        let frame = CGRect(origin: CGPoint.zero, size: CGSize(width: 40.0, height: 40.0))
        let historyBarButtonItem = UIBarButtonItem(target: self, action: #selector(historyBarButtonClicked), imageName: "image_my_history", highlightedImageName: "Image_my_history_click", frame: frame)
        let searchBarButtonItem = UIBarButtonItem(target: self, action: #selector(searchBarButtonClicked), imageName: "btn_search", highlightedImageName: "btn_search_clicked", frame: frame)
        let qrcodeBarButtonItem = UIBarButtonItem(target: self, action: #selector(qrcodeBarButtonClicked), imageName: "Image_scan", highlightedImageName: "Image_scan_click", frame: frame)
        navigationItem.rightBarButtonItems = [historyBarButtonItem, searchBarButtonItem, qrcodeBarButtonItem]
        
    }
}
