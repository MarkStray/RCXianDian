//
//  InputViewController.swift
//  RCXianDian
//
//  Created by user on 16/8/8.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class InputViewController: XDBaseViewController {

    //MARK:- Instance Varible
    private var maskView = UIView()
    var pInputView: ProductInputView?
    
    //MARK:- Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialView()
        initialUI()
    }
    //MARK:- UI Initial
    
    func initialView() {
        view.backgroundColor = UIColor.clearColor()
        maskView.backgroundColor = CELL_DARK_COLOR
        maskView.alpha = 0.5
        view.addSubview(maskView)
        
        maskView.userInteractionEnabled = true
        maskView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(InputViewController.hide)))
        
        maskView.snp_makeConstraints { (make) in
            make.left.top.bottom.right.equalTo(view)
        }
    }
    func initialUI() {
        pInputView = ProductInputView(frame: CGRectZero, cancleClick: { 
            [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.hide()
            }, confirmClick: {
            [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.hide()
        })
        view.addSubview(pInputView!)
        
        pInputView!.snp_makeConstraints { (make) in
            make.width.equalTo(IVW)
            make.height.equalTo(IVH)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view.snp_bottom).offset(-IVBottomSpace)
        }
    }
    //MARK:- Action
    func show() {
        let window = UIApplication.sharedApplication().keyWindow
        window?.addSubview(view)
        view.top = (window?.bottom)!
        
        UIView.animateWithDuration(0.35) { 
            self.view.transform = CGAffineTransformMakeTranslation(0, -SCREEN_HEIGHT)
        }
    }
    
    func hide() {
        view.removeFromSuperview()
        UIView.animateWithDuration(0.35) {
            self.view.transform = CGAffineTransformIdentity
        }
    }

}
