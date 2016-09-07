//
//  OrderDetailInfoTableViewCell.swift
//  RCXianDian
//
//  Created by user on 16/8/30.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class OrderDetailInfoTableViewCell: XDTableViewCell {
    
    var titleLabel = UILabel()
    var detailLabel = UILabel()

    override func initialUI() {
        lineView.hidden = false
        
        titleLabel.font = FONTSIZE_BIG
        titleLabel.textColor = CELL_DARK_COLOR
        contentView.addSubview(titleLabel)
        
        detailLabel.font = FONTSIZE_DEFAULT
        detailLabel.textColor = CELL_LIGHT_COLOR
        detailLabel.numberOfLines = 0
        contentView.addSubview(detailLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.snp_makeConstraints { (make) in
            make.left.equalTo(contentView).offset(16)
            make.top.equalTo(contentView).offset(10)
            make.width.equalTo(80)
        }
        
        detailLabel.snp_makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp_right)
            make.top.equalTo(titleLabel)
            make.right.equalTo(contentView).offset(-16)
            make.bottom.equalTo(contentView).offset(-10)
        }
        
        lineView.snp_makeConstraints { (make) in
            make.bottom.equalTo(contentView.snp_bottom)
            make.left.equalTo(contentView.snp_left).offset(16)
            make.right.equalTo(contentView.snp_right).offset(-16)
            make.height.equalTo(1)
        }
    }
    
}
