//
//  XDBaseNavigationController.swift
//  RCXianDian
//
//  Created by user on 16/7/16.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class XDBaseNavigationController: UINavigationController {
    var isAnimation = true

    lazy var backBtn: UIButton = {
        let backBtn = UIButton(type: .Custom)
        backBtn.setImage(UIImage(imageNamed: .backArrowN), forState: .Normal)
        backBtn.addTarget(self, action: #selector(XDBaseNavigationController.backBtnClick), forControlEvents: .TouchUpInside)
        backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
        let btnW: CGFloat = SCREEN_WIDTH > 375.0 ? 50 : 44
        backBtn.frame = CGRectMake(0, 0, btnW, 40)
        return backBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactivePopGestureRecognizer!.delegate = self;
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        
        viewController.navigationItem.hidesBackButton = true
        
        if viewControllers.count > 1 {
            
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
            
            (viewController as! XDBaseViewController).hideTabBar()
        }
        
    }
    
    func backBtnClick() {
        popViewControllerAnimated(isAnimation)
    }

}

extension XDBaseNavigationController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1 ?true :false
    }
}