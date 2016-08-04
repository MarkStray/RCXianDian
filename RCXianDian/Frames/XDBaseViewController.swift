//
//  XDBaseViewController.swift
//  RCXianDian
//
//  Created by user on 16/7/16.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class XDBaseViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = .Bottom
    }
    
    //FIXME:- 子类配置
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    //TODO:- 低内存清理工作
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK:- TABBAR

extension XDBaseViewController {
    
    func showTabBar() {
        setUpTabBarStatus(false)
    }
    
    func hideTabBar() {
        setUpTabBarStatus(true)
    }
    
    private func setUpTabBarStatus(status: Bool) {
        let subViews = self.tabBarController?.view.subviews
        for view in subViews! {
            if view.tag == _TABBAR_TAG {
                view.hidden = status
                return
            }
        }
    }
}

//MARK:- HUD

extension XDBaseViewController {
    func showSuccessHUDWithStatus(status: String) {
        SVProgressHUD.showSuccessWithStatus(status);
    }
    func showErrorHUDWithStatus(status: String) {
        SVProgressHUD.showErrorWithStatus(status)
    }
}
