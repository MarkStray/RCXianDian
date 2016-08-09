//
//  ProductTableFooterView.swift
//  RCXianDian
//
//  Created by user on 16/8/5.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class ProductTableFooterView: UIView {
    
    private let FOOTER_HEIGHT = CGFloat(80)
    private var titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel.textAlignment = .Center
        titleLabel.textColor = CELL_LIGHT_COLOR
        titleLabel.font = FONTSIZE_DEFAULT
        
        let attrStr = NSMutableAttributedString(string: "鲜店 · 生态健康 低价方便")
        attrStr.addAttributes([NSForegroundColorAttributeName: GLOBAL_COLOR, NSFontAttributeName: FONTSIZE_BIG], range: NSMakeRange(0, 4))
        titleLabel.attributedText = attrStr
        self.addSubview(titleLabel)
        
        self.height = FOOTER_HEIGHT
        self.backgroundColor = UIColor.whiteColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.snp_makeConstraints { (make) in
            make.top.left.right.equalTo(self)
            make.height.equalTo(FOOTER_HEIGHT)
        }
    }
}
