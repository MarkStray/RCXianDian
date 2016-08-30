//
//  TopMenu.swift
//  RCXianDian
//
//  Created by user on 16/8/29.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class TopMenu: UIView {
    
    private let menuBaseTag = 100

    private let menuViewHeight = CGFloat(44)
    private let lineViewHeight = CGFloat(1)
    private let menuItemWidth = CGFloat(SCREEN_WIDTH/2)
    private let menuItemHeight = CGFloat(43)

    private var menuScrollView = UIScrollView()
    private var containerScrollView = UIScrollView()
    
    private var lineView: UIView!

    private var btnItems = [UIButton]()
    private var _viewControllers = [UIViewController]()
    
    //MARK:- Lift Circle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(frame: CGRect, viewControllers: [UIViewController]) {
        self.init(frame: frame)
        _viewControllers = viewControllers
        
        setupMenus()
        setupContents()
        setupContentSize()
    }
    
    //MARK:- Initial UI
    func setupViews() {
        menuScrollView.delegate = self
        menuScrollView.bounces = false
        menuScrollView.showsHorizontalScrollIndicator = false
        menuScrollView.backgroundColor = UIColor.whiteColor()
        addSubview(menuScrollView)
        
        containerScrollView.delegate = self
        containerScrollView.bounces = false
        containerScrollView.pagingEnabled = true
        containerScrollView.userInteractionEnabled = true
        containerScrollView.showsHorizontalScrollIndicator = false
        containerScrollView.backgroundColor = BACKGROUND_COLOR
        addSubview(containerScrollView)
        
        lineView = UIView(frame: CGRectMake(0, menuItemHeight, menuItemWidth, lineViewHeight))
        lineView.backgroundColor = GLOBAL_COLOR
        menuScrollView.addSubview(lineView)
    }
    
    func setupContentSize() {
        menuScrollView.contentSize = CGSizeMake(menuItemWidth * CGFloat(_viewControllers.count), menuItemHeight)
        containerScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * CGFloat(_viewControllers.count), self.height-menuItemHeight)
    }

    func setupMenus() {
        
        for (index, vc) in _viewControllers.enumerate() {
            let btn = UIButton(type: .Custom)
            btn.frame = CGRectMake(menuItemWidth*CGFloat(index), 0, menuItemWidth, menuItemHeight)
            btn.setTitle(vc.title, forState: .Normal)
            btn.setTitleColor(GLOBAL_COLOR, forState: .Selected)
            btn.setTitleColor(.darkGrayColor(), forState: .Normal)
            btn.tag = menuBaseTag+index
            btn.addTarget(self, action: #selector(TopMenu.btnClick(_:)), forControlEvents: .TouchUpInside)
            menuScrollView.addSubview(btn)
            btnItems.append(btn)
            
            if index == 0 {
                btn.selected = true
            }
            
            if index != _viewControllers.count-1 {
                let lineView = UIView(frame: CGRectMake(btn.right, 5, 1, menuViewHeight-10))
                lineView.backgroundColor = LINE_COLOR
                menuScrollView.addSubview(lineView)
            }
        }
    }
    
    func setupContents() {
        for (index, vc) in _viewControllers.enumerate() {
            vc.view.frame = CGRectMake(SCREEN_WIDTH*CGFloat(index), 0, SCREEN_WIDTH, self.height-menuViewHeight)
            containerScrollView.addSubview(vc.view)
        }
    }
    
    //MARK:- Actions
    func btnClick(btn: UIButton) {
        let index = btn.tag-menuBaseTag
        for button in btnItems {
            if btn == button {
                button.selected = true
            } else {
                button.selected = false
            }
        }
        
        UIView.animateWithDuration(0.35) { 
            self.lineView.frame = CGRectMake(self.menuItemWidth*CGFloat(index), self.menuItemHeight, self.menuItemWidth, self.lineViewHeight)
        }
        self.containerScrollView.scrollRectToVisible(CGRectMake(SCREEN_WIDTH*CGFloat(index), 0, SCREEN_WIDTH, self.height-menuViewHeight), animated: true)
    }

    
    //MARK:- Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        menuScrollView.snp_makeConstraints { (make) in
            make.top.left.right.equalTo(self)
            make.height.equalTo(menuViewHeight)
        }
        
        containerScrollView.snp_makeConstraints { (make) in
            make.bottom.left.right.equalTo(self)
            make.height.equalTo(self.height-menuViewHeight)
        }
    }
}

extension TopMenu: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        if scrollView == self.containerScrollView {
            let offsetX = scrollView.contentOffset.x
            let index = Int(offsetX/SCREEN_WIDTH)
            let btn = btnItems[index]
            btnClick(btn)
            
            self.menuScrollView.scrollRectToVisible(CGRectMake((SCREEN_WIDTH/2)*offsetX/SCREEN_WIDTH, 0, SCREEN_WIDTH, menuViewHeight), animated: true)
        }
    }
}
