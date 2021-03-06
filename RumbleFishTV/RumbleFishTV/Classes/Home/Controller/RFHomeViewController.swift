//
//  RFHomeViewController.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/8/29.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

private let kPageTitleViewHeight: CGFloat = 40.0

class RFHomeViewController: UIViewController {
    
    // MARK: - Property
    private lazy var pageTitleView: PageTitleView = {[weak self] in
        let titles = ["推荐","游戏","娱乐","趣玩"]
        let frame = CGRect(x: 0, y: TopBarHeight, width: ScreenWidth, height: kPageTitleViewHeight)
        let pageTitleView = PageTitleView(frame: frame, titles: titles)
        pageTitleView.delegate = self
        return pageTitleView
    }()
    
    private lazy var pageContentView: PageContentView = {[weak self] in
        let pageContentViewY: CGFloat = TopBarHeight + kPageTitleViewHeight
        let pageContentViewHeight: CGFloat = ScreenHeight - pageContentViewY - BottomBarHeight
        
        var childViewControllers = [UIViewController]()
        let recommendViewController = RFRecommendViewController()
        childViewControllers.append(recommendViewController)
        let gameViewController = RFGameViewController()
        childViewControllers.append(gameViewController)
        let amuseViewController = RFAmuseViewController()
        childViewControllers.append(amuseViewController)
        let funnyViewController = RFFunnyViewController()
        childViewControllers.append(funnyViewController)
        
        let pageContentView = PageContentView(frame: CGRect(x: 0.0, y: pageContentViewY, width: ScreenWidth, height: pageContentViewHeight), parentViewController: self, childViewControllers: childViewControllers)
        pageContentView.delegate = self
        return pageContentView
    }()
    
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
    @objc private func leftBarButtonClicked() {
        
    }
    
    @objc private func historyBarButtonClicked() {
        
    }
    
    @objc private func searchBarButtonClicked() {
        
    }
    
    @objc private func qrcodeBarButtonClicked() {
        
    }

}

// MARK: - SetUI
extension RFHomeViewController {
    private func setUI() {
        setNavigationItem()
        
        automaticallyAdjustsScrollViewInsets = false
        
        view.addSubview(pageTitleView)
        view.addSubview(pageContentView)
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

// MARK: - PageTitleViewDelegate
extension RFHomeViewController: PageTitleViewDelegate {
    func pageTitleView(_ pageTitleView: PageTitleView, didSelectIndex index: Int) {
        pageContentView.setCurrentIndex(index)
    }
}

// MARK: - PageContentViewDelegate
extension RFHomeViewController: PageContentViewDelegate {
    func pageContentView(_ pageContentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setTitle(progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}
