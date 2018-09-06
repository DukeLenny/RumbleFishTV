//
//  PageTitleView.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/8/30.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit

private let kScrollBarHeight: CGFloat = 2.0
private let kLineViewHeight: CGFloat = 0.5

protocol PageTitleViewDelegate: class {
    func pageTitleView(_ pageTitleView: PageTitleView, didSelectIndex index: Int)
}

class PageTitleView: UIView {
    
    weak var delegate: PageTitleViewDelegate?
    
    private var titles: [String]
    
    private lazy var scrollView: UIScrollView = {
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
    
    private lazy var scrollBar: UIView = UIView()
    
    private lazy var titleButtons: [UIButton] = [UIButton]()
    
    private var currentIndex: Int = 0

    init(frame: CGRect, titles: [String]) {
        self.titles = titles
        
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func titleButtonClicked(titleButton: UIButton) {
        let oldTitleButton = titleButtons[currentIndex]
        oldTitleButton.isSelected = false
        titleButton.isSelected = true
        
        currentIndex = titleButton.tag
        
        UIView.animate(withDuration: 0.15) {
            self.scrollBar.frame.origin.x = CGFloat(titleButton.tag) * self.scrollBar.bounds.width
        }
        
        delegate?.pageTitleView(self, didSelectIndex: titleButton.tag)
    }
    
    func setTitle(progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        let sourceTitleButton = titleButtons[sourceIndex]
        let targetTitleButton = titleButtons[targetIndex]
        
        // 滚动条frame改变
        let moveX = (targetTitleButton.frame.origin.x - sourceTitleButton.frame.origin.x) * progress
        scrollBar.frame.origin.x = sourceTitleButton.frame.origin.x + moveX
        
    }
    
}

// MARK: - SetUI
extension PageTitleView {
    private func setUI() {
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
//        let scrollBar = UIView(frame: CGRect(x: 0.0, y: scrollView.bounds.height - kScrollBarHeight, width: firstTitleButton.bounds.width, height: kScrollBarHeight))
        scrollBar.frame = CGRect(x: 0.0, y: scrollView.bounds.height - kScrollBarHeight, width: firstTitleButton.bounds.width, height: kScrollBarHeight)
        scrollBar.backgroundColor = UIColor.orange
        scrollView.addSubview(scrollBar)
    }
    
    private func setLineView() {
        let lineView = UIView(frame: CGRect(x: 0.0, y: bounds.height - kLineViewHeight, width: bounds.width, height: kLineViewHeight))
        lineView.backgroundColor = UIColor.lightGray
        addSubview(lineView)
    }
}
