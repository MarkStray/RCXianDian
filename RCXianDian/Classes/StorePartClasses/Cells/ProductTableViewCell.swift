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
        
        brandLabel.text = "鲜店"
        brandLabel.textAlignment = .Center
        brandLabel.textColor = GLOBAL_COLOR
        onsaleImgView.image = UIImage(named: "onsale")
        
        nameLabel.textColor = CELL_DARK_COLOR
        specLabel.textColor = CELL_LIGHT_COLOR
        avgLabel.textColor = CELL_DARK_COLOR
        salePriceLabel.textColor = CELL_RED_COLOR
        
        contentView.addSubview(logoImgView)
        contentView.addSubview(onsaleImgView)
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
            make.left.equalTo(logoImgView.snp_right).offset(5)
        }

        nameLabel.snp_makeConstraints { (make) in
            make.top.equalTo(logoImgView)
            make.left.equalTo(brandLabel.snp_right).offset(5)
            make.right.equalTo(contentView).offset(-8)
            make.height.equalTo(20)
        }

        specLabel.snp_makeConstraints { (make) in
            make.height.equalTo(20)
            make.top.equalTo(brandLabel.snp_bottom)
            make.left.equalTo(logoImgView.snp_right).offset(5)
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
            make.left.equalTo(logoImgView.snp_right).offset(5)
        }
        
        //TODO:
        
        lineView.snp_updateConstraints { (make) in
            make.bottom.equalTo(contentView.snp_bottom)
            make.left.equalTo(contentView.snp_left).offset(8)
            make.right.equalTo(contentView.snp_right).offset(-8)
            make.height.equalTo(1)
        }
    }
    
    func updateUIWithModel(model: ProductModel?) {
        
        let url = NSURL(string: model!.imgurl!.stringByRemovingPercentEncoding!)
        logoImgView.sd_setImageWithURL(url, placeholderImage: UIImage(named: "loading"))
        
        
        onsaleImgView.hidden = model?.onsale == 0
        
        nameLabel.text = model?.skuname
        
        specLabel.text = model?.spec
        
        avgLabel.text = "市场价￥" + String(format: "%.2f",(model?.avgprice)!)

        if ((model?.onsale) != nil) {
            salePriceLabel.text = "￥" + (model?.price)!
        } else {
            salePriceLabel.text = "￥" + (model?.saleprice)!
        }
    }

}
