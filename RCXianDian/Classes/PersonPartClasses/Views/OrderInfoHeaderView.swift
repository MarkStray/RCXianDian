//
//  OrderInfoHeaderView.swift
//  RCXianDian
//
//  Created by user on 16/8/30.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class OrderInfoHeaderView: UITableViewHeaderFooterView {
    var titleLabel = UILabel()
    var backgView = UIView()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        backgView.backgroundColor = UIColor.RGBA(240, g: 240, b: 240, a: 0.8)
        contentView.addSubview(backgView)
        
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.font = UIFont.systemFontOfSize(14)
        titleLabel.textColor = CELL_DARK_COLOR
        contentView.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        backgView.snp_makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(contentView)
        }
        
        titleLabel.snp_makeConstraints { (make) in
            make.top.bottom.equalTo(contentView)
            make.left.equalTo(contentView).offset(16)
        }
    }
    
}
