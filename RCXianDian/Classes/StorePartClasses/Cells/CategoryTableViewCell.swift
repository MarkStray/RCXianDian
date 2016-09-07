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
    var backgView = UIImageView()
    
    override func initialUI() {
        lineView.hidden = false
        contentView.backgroundColor = BACKGROUND_COLOR
        
        backgView.image = UIImage(imageNamed: .cellSelectedN)
        backgView.hidden = true
        contentView.addSubview(backgView)
        
        titleLabel.textColor = CELL_DARK_COLOR
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.font = UIFont.systemFontOfSize(14)
        titleLabel.textAlignment = .Center
        contentView.addSubview(titleLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgView.snp_makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(contentView)
        }
        
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
            backgView.hidden = false
        } else {
            titleLabel.textColor = CELL_DARK_COLOR
            backgView.hidden = true
        }
    }
}
