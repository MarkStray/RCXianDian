//
//  XDTableView.swift
//  RCXianDian
//
//  Created by user on 16/8/3.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit


/// 处理需要UITableViewCell上UIControl及其子类控件支持拖拽滚动操作需继承此类
class XDTableView: UITableView {

    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        delaysContentTouches = false
        canCancelContentTouches = true
        
        separatorStyle = .None
        backgroundColor = BACKGROUND_COLOR

        //let wrapView = subviews.first
        
        /*if wrapView != nil && NSStringFromClass((wrapView?.classForCoder)!).hasPrefix("WrapperView") {
            
            for gesture in wrapView!.gestureRecognizers! {
                if (NSStringFromClass(gesture.classForCoder).containsString("DelayedTouchesBegan")) {
                    gesture.enabled = false
                    break
                }
            }
        }*/

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesShouldCancelInContentView(view: UIView) -> Bool {
        if view.isKindOfClass(UIControl.self) {
            return true
        }
        
        return super.touchesShouldCancelInContentView(view)
    }

}
