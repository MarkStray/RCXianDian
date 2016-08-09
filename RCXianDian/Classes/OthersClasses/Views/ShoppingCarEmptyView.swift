//
//  ShoppingCarEmptyView.swift
//  RCXianDian
//
//  Created by user on 16/8/9.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class ShoppingCarEmptyView: UIView {

    private lazy var carImgView = {
        return UIImageView(image: UIImage(named: "car"))
    }()
    
    private lazy var emptyLabel: UILabel = {
        let emptyLabel = UILabel()
        emptyLabel.text = "您的购物车空空如也"
        emptyLabel.textAlignment = .Center
        emptyLabel.font = FONTSIZE_BIG
        emptyLabel.textColor = CELL_LIGHT_COLOR
        return emptyLabel
    }()
    
    private lazy var shoppingBtn: UIButton = {
        let shoppingBtn = UIButton(type: .Custom)
        shoppingBtn.backgroundColor = GLOBAL_COLOR
        shoppingBtn.layer.masksToBounds = true
        shoppingBtn.layer.cornerRadius = 12
        shoppingBtn.setTitle("去购物", forState: .Normal)
        shoppingBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        shoppingBtn.addTarget(self, action: #selector(ShoppingCarEmptyView.shopping), forControlEvents: .TouchUpInside)
        return shoppingBtn
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(carImgView)
        addSubview(emptyLabel)
        addSubview(shoppingBtn)
        
        backgroundColor = BACKGROUND_COLOR
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        carImgView.snp_makeConstraints { (make) in
            make.width.height.equalTo(60)
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(120)
        }
        
        emptyLabel.snp_makeConstraints { (make) in
            make.width.equalTo(160)
            make.height.equalTo(40)
            make.centerX.equalTo(self)
            make.top.equalTo(carImgView.snp_bottom)
        }
        
        shoppingBtn.snp_makeConstraints { (make) in
            make.width.equalTo(160)
            make.height.equalTo(35)
            make.centerX.equalTo(self)
            make.top.equalTo(emptyLabel.snp_bottom)
        }
    }
    
    func shopping() {
        printLog("shopping")
    }

}
