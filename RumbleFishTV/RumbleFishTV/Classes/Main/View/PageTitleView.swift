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

// 1.0, 0.5, 0.0 RGB,orange
private let kSelectedColorValue: (CGFloat, CGFloat, CGFloat) = (255.0, 128.0, 0.0)
// 0.333 white,darkGray
private let kNormalColorValue: (CGFloat, CGFloat, CGFloat) = (85.0, 85.0, 85.0)

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
        if titleButton.tag == currentIndex {
            return;
        }
        
        let oldTitleButton = titleButtons[currentIndex]
        oldTitleButton.setTitleColor(UIColor.rgb(kNormalColorValue.0, kNormalColorValue.1, kNormalColorValue.2), for: .normal)
        titleButton.setTitleColor(UIColor.rgb(kSelectedColorValue.0, kSelectedColorValue.1, kSelectedColorValue.2), for: .normal)
        
        currentIndex = titleButton.tag
        
        UIView.animate(withDuration: 0.15) {
            self.scrollBar.frame.origin.x = CGFloat(titleButton.tag) * self.scrollBar.bounds.width
        }
        
        delegate?.pageTitleView(self, didSelectIndex: titleButton.tag)
    }
    
    func setTitle(progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        currentIndex = targetIndex
        
        let sourceTitleButton = titleButtons[sourceIndex]
        let targetTitleButton = titleButtons[targetIndex]
        
        // 滚动条frame改变
        let moveX = (targetTitleButton.frame.origin.x - sourceTitleButton.frame.origin.x) * progress
        scrollBar.frame.origin.x = sourceTitleButton.frame.origin.x + moveX
        
        // 标题颜色渐变
        if progress == 0.0 {
            for titleButton in titleButtons {
                if titleButton == sourceTitleButton {
                    titleButton.setTitleColor(UIColor.rgb(kSelectedColorValue.0, kSelectedColorValue.1, kSelectedColorValue.2), for: .normal)
                } else {
                    titleButton.setTitleColor(UIColor.rgb(kNormalColorValue.0, kNormalColorValue.1, kNormalColorValue.2), for: .normal)
                }
            }
        } else {
            let deltaColorValue = (kSelectedColorValue.0 - kNormalColorValue.0, kSelectedColorValue.1 - kNormalColorValue.1, kSelectedColorValue.2 - kNormalColorValue.2)
            sourceTitleButton.setTitleColor(UIColor.rgb(kSelectedColorValue.0 - deltaColorValue.0 * progress, kSelectedColorValue.1 - deltaColorValue.1 * progress, kSelectedColorValue.2 - deltaColorValue.2 * progress), for: .normal)
            targetTitleButton.setTitleColor(UIColor.rgb(kNormalColorValue.0 + deltaColorValue.0 * progress, kNormalColorValue.1 + deltaColorValue.1 * progress, kNormalColorValue.2 + deltaColorValue.2 * progress), for: .normal)
        }
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
            // titleColor: UIColor.rgb(kNormalColorValue.0, kNormalColorValue.1, kNormalColorValue.2)
            // selectedTitleColor: UIColor.rgb(kSelectedColorValue.0, kSelectedColorValue.1, kSelectedColorValue.2)
            let titleButton: UIButton = UIButton(title: title, titleColor: UIColor.rgb(kNormalColorValue.0, kNormalColorValue.1, kNormalColorValue.2), font: UIFont.systemFont(ofSize: 16.0), target: self, action: #selector(titleButtonClicked(titleButton:)))
            titleButton.tag = index
            let titleButtonX: CGFloat = CGFloat(index) * titleButtonWidth
            titleButton.frame = CGRect(x: titleButtonX, y: titleButtonY, width: titleButtonWidth, height: titleButtonHeight)
            scrollView.addSubview(titleButton)
            titleButtons.append(titleButton)
            
            if index == 0 {
                titleButton.setTitleColor(UIColor.rgb(kSelectedColorValue.0, kSelectedColorValue.1, kSelectedColorValue.2), for: .normal)
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
