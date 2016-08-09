//
//  PurchaseView.swift
//  RCXianDian
//
//  Created by user on 16/8/8.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

@objc protocol PurchaseViewDelegate: NSObjectProtocol {
    func purchaseViewAddBtnClicked()
    func purchaseViewReduceBtnClicked()
    optional func purchaseViewInputViewClicked()
}

class PurchaseView: UIView {

    var isZeroShow = true
    //var canOperation = true
    
    weak var delegate: PurchaseViewDelegate?
    
    private lazy var addBtn: UIButton = {
        let addBtn = UIButton(type: .Custom)
        addBtn.setBackgroundImage(UIImage(named: "add"), forState: .Normal)
        addBtn.addTarget(self, action: #selector(PurchaseView.addClicked), forControlEvents: .TouchUpInside)
        return addBtn
    }()
    
    private lazy var reduceBtn: UIButton = {
        let reduceBtn = UIButton(type: .Custom)
        reduceBtn.setBackgroundImage(UIImage(named: "reduce"), forState: .Normal)
        reduceBtn.addTarget(self, action: #selector(PurchaseView.reduceClicked), forControlEvents: .TouchUpInside)
        return reduceBtn
    }()
    
    private lazy var inputLabel: UILabel = {
        let inputLabel = UILabel()
        inputLabel.textColor = UIColorFromHEX(0xff4f00)
        inputLabel.textAlignment = .Center
        inputLabel.font = FONTSIZE_DEFAULT
        inputLabel.text = "0"

        inputLabel.layer.masksToBounds = true
        inputLabel.layer.borderColor = LINE_COLOR.CGColor
        inputLabel.layer.borderWidth = 0.5
        inputLabel.layer.cornerRadius = 3
        
        inputLabel.userInteractionEnabled = true
        inputLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(PurchaseView.inputViewClicked)))
        
        return inputLabel
    }()
    
    
    var number: Int = 0 {
        didSet {
            inputLabel.text = String(number)

            if number == 0 {
                reduceBtn.hidden = true && !isZeroShow
                inputLabel.hidden = true && !isZeroShow
            } else {
                reduceBtn.hidden = false
                inputLabel.hidden = false
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(addBtn)
        addSubview(reduceBtn)
        addSubview(inputLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // self size(80 25)
        addBtn.snp_makeConstraints { (make) in
            make.width.height.equalTo(25)
            make.top.right.bottom.equalTo(self)
        }
        reduceBtn.snp_makeConstraints { (make) in
            make.width.height.equalTo(25)
            make.top.left.bottom.equalTo(self)
        }
        inputLabel.snp_makeConstraints { (make) in
            make.top.bottom.equalTo(self)
            make.left.equalTo(reduceBtn.snp_right)
            make.right.equalTo(addBtn.snp_left)
        }
    }
    
    //MARK: Actions
    
    func addClicked() {
        
        // 设置最大购买量
        if number+1 == PURCHASE_MAXCOUNT {
            showAlertView("亲!本商品每单最多能购买999份!")
            return
        }
        delegate?.purchaseViewAddBtnClicked()
    }
    
    func reduceClicked() {
        
        // 设置最少购买量
        if number <= 0 { return }
        
        if number-1 == 0 {
            reduceBtn.hidden = true && !isZeroShow
            inputLabel.hidden = true && !isZeroShow
        }
        delegate?.purchaseViewReduceBtnClicked()
    }
    
    func inputViewClicked() {
        delegate?.purchaseViewInputViewClicked!()
    }
    
}



