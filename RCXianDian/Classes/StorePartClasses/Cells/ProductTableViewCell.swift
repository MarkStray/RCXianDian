//
//  ProductTableViewCell.swift
//  RCXianDian
//
//  Created by user on 16/8/3.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class ProductTableViewCell: XDTableViewCell {
    
    var onsaleImgView = UIImageView()
    var logoImgView = UIImageView()
    var brandLabel = UILabel()
    var nameLabel = UILabel()
    var specLabel = UILabel()
    var avgLabel = UILabel()
    var salePriceLabel = UILabel()
    
    //TODO: buyView
    
    override func initialUI() {
        
        brandLabel.font = UIFont.systemFontOfSize(14)
        nameLabel.font = UIFont.systemFontOfSize(14)
        salePriceLabel.font = UIFont.systemFontOfSize(14)
        specLabel.font = UIFont.systemFontOfSize(12)
        avgLabel.font = UIFont.systemFontOfSize(12)
        
        brandLabel.layer.masksToBounds = true
        brandLabel.layer.cornerRadius = 5
        brandLabel.layer.borderWidth = 1
        brandLabel.layer.borderColor = GLOBAL_COLOR.CGColor

        contentView.addSubview(onsaleImgView)
        contentView.addSubview(logoImgView)
        contentView.addSubview(brandLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(specLabel)
        contentView.addSubview(avgLabel)
        contentView.addSubview(salePriceLabel)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
       
        logoImgView.snp_makeConstraints { (make) in
            make.width.height.equalTo(60)
            make.centerY.equalTo(contentView)
            make.left.equalTo(contentView).offset(8)
        }
        
        onsaleImgView.snp_makeConstraints { (make) in
            make.width.height.equalTo(30)
            make.left.top.equalTo(logoImgView)
        }

        brandLabel.snp_makeConstraints { (make) in
            make.width.equalTo(40)
            make.height.equalTo(20)
            make.top.equalTo(logoImgView)
            make.left.equalTo(logoImgView).offset(5)
        }

        nameLabel.snp_makeConstraints { (make) in
            make.top.equalTo(logoImgView)
            make.left.equalTo(brandLabel.right).offset(5)
            make.right.equalTo(contentView).offset(-8)
            make.height.equalTo(20)
        }

        specLabel.snp_makeConstraints { (make) in
            make.height.equalTo(20)
            make.top.equalTo(brandLabel.snp_bottom)
            make.left.equalTo(logoImgView).offset(5)
        }
        
        avgLabel.snp_makeConstraints { (make) in
            make.height.equalTo(20)
            make.top.equalTo(brandLabel.snp_bottom)
            make.left.equalTo(specLabel.snp_right).offset(5)
            make.right.equalTo(contentView).offset(-8)
        }

        salePriceLabel.snp_makeConstraints { (make) in
            make.height.equalTo(20)
            make.top.equalTo(specLabel.snp_bottom)
            make.left.equalTo(logoImgView).offset(5)
        }
        
        //TODO:
    }
    
    func updateUIWithModel() {
        
    }

}
