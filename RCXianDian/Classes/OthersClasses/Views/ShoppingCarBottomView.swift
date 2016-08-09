//
//  ShoppingCarBottomView.swift
//  RCXianDian
//
//  Created by user on 16/8/9.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class ShoppingCarBottomView: UIView {

    var handleAction: ((Void) -> Void)?
    
    private var totalLabel = UILabel()
    private var attachLabel = UILabel()
    private var handleBtn = UIButton()
    
    var shoppingCarVC: ShoppingCarViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialLabel()
        initialButton()
        updateViewStatus()
        
        backgroundColor = UIColor.whiteColor()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ShoppingCarBottomView.shoppingCarChanged), name: XDShoppingCarChangedNotification, object: nil)
    }
    
    convenience init(frame: CGRect, handleAction:((Void) -> Void)) {
        self.init(frame: frame)
        self.handleAction = handleAction
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: XDShoppingCarChangedNotification, object: nil)
    }
    
    func initialLabel() {
        totalLabel.font = FONTSIZE_BIG
        totalLabel.textColor = CELL_DARK_COLOR
        addSubview(totalLabel)
        
        attachLabel.font = FONTSIZE_DEFAULT
        attachLabel.textColor = CELL_LIGHT_COLOR
        addSubview(attachLabel)
    }
    
    func initialButton() {
        handleBtn.backgroundColor = GLOBAL_COLOR
        handleBtn.layer.masksToBounds = true
        handleBtn.layer.cornerRadius = 5
        handleBtn.setTitle("去结算", forState: .Normal)
        handleBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)

        handleBtn.addTarget(self, action: #selector(ShoppingCarBottomView.goHandle), forControlEvents: .TouchUpInside)
        addSubview(handleBtn)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        totalLabel.snp_makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(16)
        }
        
        attachLabel.snp_makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(totalLabel.snp_right).offset(5)
        }
        
        handleBtn.snp_makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.height.equalTo(30)
            make.width.equalTo(80)
            make.right.equalTo(self.snp_right).offset(-20)
        }
    }
    
    //MARK:- Actions
    private func updateViewStatus() {
        let totalPrice = ShoppingCarManager.sharedShoppingCar.getTotalPrice()
        
        let (canGoHandle, diffPrice) = ShoppingCarManager.sharedShoppingCar.canGoHandle()
        
        let totalStr = "合计:￥" + String(format: "%.2f",totalPrice)
        totalLabel.text = totalStr
        
        let attachStr = "差" + String(format: "%.2f",diffPrice) + "元起订"
        attachLabel.text = attachStr
        
        attachLabel.hidden = canGoHandle && true
        handleBtn.hidden = !canGoHandle && true
    }
    
    func shoppingCarChanged(notify: NSNotification) {
        updateViewStatus()
        shoppingCarVC?.initialData()//更新数据
    }
    
    
    func goHandle() {
        handleAction?()
    }

}
