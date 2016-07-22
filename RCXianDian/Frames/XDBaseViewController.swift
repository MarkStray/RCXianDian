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
        // Do any additional setup after loading the view, typically from a nib.
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

//MARK:- 功能模块拓展

extension XDBaseViewController {
    
}