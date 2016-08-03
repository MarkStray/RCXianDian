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
    
    override func initialUI() {
        contentView.backgroundColor = BACKGROUND_COLOR
        
        titleLabel.textColor = CELL_DARK_COLOR
        titleLabel.font = UIFont.systemFontOfSize(14)
        titleLabel.textAlignment = .Center
        contentView.addSubview(titleLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.snp_makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(contentView)
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
