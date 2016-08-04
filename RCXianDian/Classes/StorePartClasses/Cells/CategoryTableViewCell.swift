//
//  CategoryTableViewCell.swift
//  RCXianDian
//
//  Created by user on 16/8/3.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class CategoryTableViewCell: XDTableViewCell {

    var titleLabel = UILabel()
    var lineView = UIView()
    
    override func initialUI() {
        contentView.backgroundColor = BACKGROUND_COLOR
        
        titleLabel.textColor = CELL_DARK_COLOR
        titleLabel.font = UIFont.systemFontOfSize(14)
        titleLabel.textAlignment = .Center
        contentView.addSubview(titleLabel)
        
        lineView.backgroundColor = LINE_COLOR
        contentView.addSubview(lineView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.snp_makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(contentView)
        }
        
        lineView.snp_makeConstraints { (make) in
            make.left.right.bottom.equalTo(contentView)
            make.height.equalTo(1)
        }
    }

    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            titleLabel.textColor = GLOBAL_COLOR
        } else {
            titleLabel.textColor = CELL_DARK_COLOR
        }
    }
}
