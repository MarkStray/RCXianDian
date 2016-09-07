//
//  OrderInfoTableViewCell.swift
//  RCXianDian
//
//  Created by user on 16/8/24.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class OrderInfoTableViewCell: XDTableViewCell {

    var productLogo = UIImageView()
    var brandLabel = UILabel()
    var nameLabel = UILabel()
    var avgLabel = UILabel()
    var priceLabel = UILabel()
    var countLabel = UILabel()
    
    override func initialUI() {
        
        do {
            lineView.hidden = false
            contentView.addSubview(productLogo)
        }
        
        do {
            brandLabel.layer.masksToBounds = true
            brandLabel.layer.cornerRadius = 5
            brandLabel.layer.borderWidth = 1
            brandLabel.layer.borderColor = GLOBAL_COLOR.CGColor

            brandLabel.text = "鲜店"
            brandLabel.textAlignment = .Center
            brandLabel.textColor = GLOBAL_COLOR
            brandLabel.font = FONTSIZE_BIG
            contentView.addSubview(brandLabel)
            
            priceLabel.textColor = CELL_RED_COLOR
            priceLabel.font = FONTSIZE_DEFAULT
            contentView.addSubview(priceLabel)

            nameLabel.textColor = CELL_DARK_COLOR
            nameLabel.font = FONTSIZE_DEFAULT
            contentView.addSubview(nameLabel)
        }
        
        do {
            avgLabel.textColor = CELL_DARK_COLOR
            avgLabel.font = FONTSIZE_DEFAULT
            contentView.addSubview(avgLabel)

            countLabel.textColor = CELL_DARK_COLOR
            countLabel.font = FONTSIZE_DEFAULT
            contentView.addSubview(countLabel)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        do {
            productLogo.snp_makeConstraints { (make) in
                make.width.height.equalTo(50)
                make.top.equalTo(contentView).offset(5)
                make.left.equalTo(contentView).offset(10)
            }
        }
        
        do {
            brandLabel.snp_makeConstraints(closure: { (make) in
                make.width.equalTo(40)
                make.left.equalTo(productLogo.snp_right).offset(10)
                make.top.equalTo(contentView).offset(10)
            })
            
            priceLabel.snp_makeConstraints(closure: { (make) in
                make.width.equalTo(80)
                make.right.equalTo(contentView)
                make.centerY.equalTo(brandLabel)
            })
            
            nameLabel.snp_makeConstraints(closure: { (make) in
                make.left.equalTo(brandLabel.snp_right).offset(5)
                make.right.equalTo(priceLabel.snp_left)
                make.centerY.equalTo(brandLabel)
            })
        }
        
        do {
            avgLabel.snp_makeConstraints(closure: { (make) in
                make.left.equalTo(productLogo.snp_right).offset(10)
                make.bottom.equalTo(contentView).offset(-10)
            })
            
            countLabel.snp_makeConstraints(closure: { (make) in
                make.centerY.equalTo(avgLabel)
                make.centerX.equalTo(priceLabel)
            })
        }
        
        lineView.snp_makeConstraints { (make) in
            make.left.right.bottom.equalTo(contentView)
            make.height.equalTo(1)
        }
    }
    
    func updateUIWithModel(model: ProductModel?) {
        
        let url = NSURL(string: model!.imgurl!.stringByRemovingPercentEncoding!)
        productLogo.sd_setImageWithURL(url, placeholderImage: UIImage(imageNamed: .loadingN))
        
        nameLabel.text = model?.skuname
        
        //priceLabel.text = "￥" + (model?.total)!
        priceLabel.text = "￥" + (model?.price)!

        avgLabel.text = model?.spec
        
        countLabel.text = "x" + (model?.ordercount)!

    }

}
