//
//  PageTitleView.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/8/30.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

fileprivate let kScrollBarHeight: CGFloat = 2.0
fileprivate let kLineViewHeight: CGFloat = 0.5

class PageTitleView: UIView {
    
    fileprivate var titles: [String]
    
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.clear
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        scrollView.scrollsToTop = false
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = .never
        }
        return scrollView
    }()
    
    fileprivate lazy var titleButtons: [UIButton] = [UIButton]()

    init(frame: CGRect, titles: [String]) {
        self.titles = titles
        
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc fileprivate func titleButtonClicked(titleButton: UIButton) {
        
    }
    
}

// MARK: - SetUI
extension PageTitleView {
    fileprivate func setUI() {
        backgroundColor = UIColor.white
        
        addSubview(scrollView)
        scrollView.frame = bounds
        
        setTitleButtons()
        setScrollBar()
        setLineView()
    }
    
    private func setTitleButtons() {
        let titleButtonY: CGFloat = 0.0
        let titleButtonWidth: CGFloat = scrollView.bounds.width / CGFloat(titles.count)
        let titleButtonHeight: CGFloat = scrollView.bounds.height - kScrollBarHeight
        
        for (index, title) in titles.enumerated() {
            let titleButton: UIButton = UIButton(title: title, titleColor: UIColor.darkGray, font: UIFont.systemFont(ofSize: 16.0), selectedTitleColor: UIColor.orange, target: self, action: #selector(titleButtonClicked(titleButton:)))
            titleButton.tag = index
            let titleButtonX: CGFloat = CGFloat(index) * titleButtonWidth
            titleButton.frame = CGRect(x: titleButtonX, y: titleButtonY, width: titleButtonWidth, height: titleButtonHeight)
            scrollView.addSubview(titleButton)
            titleButtons.append(titleButton)
            
            if index == 0 {
                titleButton.isSelected = true
            }
        }
    }
    
    private func setScrollBar() {
        let firstTitleButton = titleButtons[0]
        let scrollBar = UIView(frame: CGRect(x: 0.0, y: scrollView.bounds.height - kScrollBarHeight, width: firstTitleButton.bounds.width, height: kScrollBarHeight))
        scrollBar.backgroundColor = UIColor.orange
        scrollView.addSubview(scrollBar)
    }
    
    private func setLineView() {
        let lineView = UIView(frame: CGRect(x: 0.0, y: bounds.height - kLineViewHeight, width: bounds.width, height: kLineViewHeight))
        lineView.backgroundColor = UIColor.lightGray
        addSubview(lineView)
    }
}
