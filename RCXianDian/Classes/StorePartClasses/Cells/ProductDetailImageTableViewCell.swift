//
//  ProductDetailImageTableViewCell.swift
//  RCXianDian
//
//  Created by user on 16/8/12.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class ProductDetailImageTableViewCell: XDTableViewCell {
    
    var detailImageView = UIImageView()
    
    override func initialUI() {
        contentView.addSubview(detailImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        detailImageView.snp_makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(contentView)
        }
    }
    
    

}
