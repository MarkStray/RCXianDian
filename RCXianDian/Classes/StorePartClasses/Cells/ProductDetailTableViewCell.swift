//
//  ProductDetailTableViewCell.swift
//  RCXianDian
//
//  Created by user on 16/8/12.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class ProductDetailTableViewCell: XDTableViewCell {

    var titleLabel = UILabel()
    var detailLabel = UILabel()

    override func initialUI() {
        lineView.hidden = true
        
        titleLabel.textColor = CELL_DARK_COLOR
        titleLabel.font = UIFont.systemFontOfSize(14)
        contentView.addSubview(titleLabel)
        
        detailLabel.textColor = CELL_LIGHT_COLOR
        detailLabel.font = UIFont.systemFontOfSize(14)
        detailLabel.numberOfLines = 0
        contentView.addSubview(detailLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.snp_makeConstraints { (make) in
            make.left.equalTo(contentView).offset(16)
            make.top.equalTo(contentView).offset(8)
            make.width.equalTo(60)
        }
        
        detailLabel.snp_makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp_right)
            make.top.equalTo(titleLabel)
            make.width.equalTo(SCREEN_WIDTH-16*2-60)
        }

    }

}
