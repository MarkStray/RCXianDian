//
//  BottomShoppingCar.swift
//  RCXianDian
//
//  Created by user on 16/7/20.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class BottomShoppingCar: UIView {
    
    var redDot = RedDot.sharedRedDot
    
    var shoppingCarAction: (Void -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(patternImage: UIImage(named: "tabbar-background-\(Int(SCREEN_WIDTH))")!)

        addSubview(redDot)
        redDot.snp_makeConstraints { (make) in
            make.width.height.equalTo(20)
            make.top.equalTo(self).offset(5)
            make.right.equalTo(self).offset(-10)
        }
        
        let shoppingBtn = UIButton(type: .Custom)
        shoppingBtn.addTarget(self, action: #selector(shoppingCarHandle), forControlEvents: .TouchUpInside)
        addSubview(shoppingBtn)
        
        shoppingBtn.snp_makeConstraints { (make) in
            make.width.equalTo(right_retain)
            make.height.equalTo(tabHeight)
            make.right.bottom.equalTo(self)
        }
    }
    
    convenience init(frame: CGRect, shoppingCarClick: Void -> Void) {
        self.init(frame: frame)
        shoppingCarAction = shoppingCarClick
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func shoppingCarHandle() {
        shoppingCarAction?()
    }

}
