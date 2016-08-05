//
//  ProductHeadView.swift
//  RCXianDian
//
//  Created by user on 16/8/5.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class ProductHeadView: UITableViewHeaderFooterView {
    
    var titleLabel = UILabel()
    private var backgView = UIView()
    private var whiteView = UIView()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        whiteView.backgroundColor = UIColor.whiteColor()
        contentView.addSubview(whiteView)
        
        backgView.backgroundColor = UIColor.RGBA(240, g: 240, b: 240, a: 0.8)
        whiteView.addSubview(backgView)
        
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.font = UIFont.systemFontOfSize(14)
        titleLabel.textColor = CELL_DARK_COLOR
        whiteView.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        whiteView.snp_makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(contentView)
        }

        backgView.snp_makeConstraints { (make) in
            make.top.right.bottom.equalTo(whiteView)
            make.left.equalTo(whiteView).offset(8)
        }
        
        titleLabel.snp_makeConstraints { (make) in
            make.top.right.bottom.equalTo(whiteView)
            make.left.equalTo(whiteView).offset(16)
        }
    }
    

}
