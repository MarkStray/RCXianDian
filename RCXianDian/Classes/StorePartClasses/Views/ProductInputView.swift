//
//  ProductInputView.swift
//  RCXianDian
//
//  Created by user on 16/8/15.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

///InputView的宽高及距Bottom的空间
let IVW = CGFloat(240)
let IVH = CGFloat(140)
let IVBottomSpace = CGFloat(250)

class ProductInputView: UIView {

    
    var cancleAction: (()-> Void)?
    var confirmAction: (()-> Void)?
    
    var purchaseView: PurchaseView!
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "修改购买数量"
        titleLabel.textColor = CELL_DARK_COLOR
        titleLabel.textAlignment = .Center
        titleLabel.backgroundColor = UIColor.clearColor()
        return titleLabel
    }()
    
    private lazy var containView: UIView = {
        let containView = UIView()
        containView.backgroundColor = LINE_COLOR
        containView.layer.masksToBounds = true
        containView.layer.cornerRadius = 5
        return containView
    }()
    
    private lazy var cancleBtn: UIButton = {
        let cancleBtn = UIButton(type: .Custom)
        cancleBtn.setTitle("取消", forState: .Normal)
        cancleBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        cancleBtn.layer.masksToBounds = true
        cancleBtn.layer.cornerRadius = 5
        cancleBtn.backgroundColor = CELL_LIGHT_COLOR
        cancleBtn.addTarget(self, action: #selector(ProductInputView.cancleClick), forControlEvents: .TouchUpInside)
        return cancleBtn
    }()
    
    private lazy var confirmBtn: UIButton = {
        let confirmBtn = UIButton(type: .Custom)
        confirmBtn.setTitle("确定", forState: .Normal)
        confirmBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        confirmBtn.layer.masksToBounds = true
        confirmBtn.layer.cornerRadius = 5
        confirmBtn.backgroundColor = GLOBAL_COLOR
        confirmBtn.addTarget(self, action: #selector(ProductInputView.confirmClick), forControlEvents: .TouchUpInside)
        return confirmBtn
    }()

    //MARK:- UI
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialUI()
        
        self.addSubview(titleLabel)
        self.addSubview(containView)
        self.addSubview(cancleBtn)
        self.addSubview(confirmBtn)
    }
    
    convenience init(frame: CGRect, cancleClick:(()->Void), confirmClick:(()->Void)) {
        self.init(frame: frame)
        self.cancleAction = cancleClick
        self.confirmAction = confirmClick
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialUI() {
        width = IVW
        height = IVH
        layer.masksToBounds = true
        layer.cornerRadius = 5
        backgroundColor = BACKGROUND_COLOR
        
        PurchaseView.WH = 35
        PurchaseView.InputFont = FONTSIZE_LARGE
        PurchaseView.InputTextColor = CELL_DARK_COLOR
        PurchaseView.InputBorderColor = CELL_LIGHT_COLOR
        purchaseView = PurchaseView()
        purchaseView.delegate = self
        containView.addSubview(purchaseView)
    }
    
    //MARK:- Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        purchaseView.snp_makeConstraints { (make) in
            make.width.equalTo(120)
            make.height.equalTo(PurchaseView.WH)
            make.center.equalTo(containView.center)
        }

        titleLabel.snp_makeConstraints { (make) in
            make.top.left.right.equalTo(self)
            make.height.equalTo(30)
        }
        
        containView.snp_makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp_bottom)
            make.height.equalTo(60)
            make.width.equalTo(180)
            make.centerX.equalTo(self)
        }
        
        cancleBtn.snp_makeConstraints { (make) in
            make.width.equalTo(60)
            make.height.equalTo(30)
            make.left.equalTo(self).offset(30)
            make.bottom.equalTo(self).offset(-10)
        }
        
        confirmBtn.snp_makeConstraints { (make) in
            make.width.equalTo(60)
            make.height.equalTo(30)
            make.right.equalTo(self).offset(-30)
            make.bottom.equalTo(self).offset(-10)
        }

    }
    
    //MARK:- Actions
    func cancleClick() {
        cancleAction!()
    }
    
    func confirmClick() {
        confirmAction!()
    }
}

extension ProductInputView: PurchaseViewDelegate {
    func purchaseViewAddBtnClicked() {
        
    }
    
    func purchaseViewReduceBtnClicked() {
        
    }
    
    func purchaseViewInputViewClicked() {
        
    }
}
