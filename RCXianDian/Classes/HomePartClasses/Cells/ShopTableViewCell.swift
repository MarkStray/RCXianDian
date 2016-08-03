//
//  ShopTableViewCell.swift
//  RCXianDian
//
//  Created by user on 16/7/29.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class ShopTableViewCell: XDTableViewCell {
    
    var avatarImageView = UIImageView()
    var arrowImageView = UIImageView()
    var nameLabel = UILabel()
    var shopNameLabel = UILabel()
    var descLabel = UILabel()
    
    override func initialUI() {
        avatarImageView.layer.masksToBounds = true
        avatarImageView.layer.cornerRadius = 5
        
        arrowImageView.image = UIImage(named: "rightArrow")
        
        nameLabel.textColor = CELL_DARK_COLOR
        nameLabel.font = UIFont.systemFontOfSize(16)
        
        shopNameLabel.textColor = CELL_LIGHT_COLOR
        shopNameLabel.font = UIFont.systemFontOfSize(14)
        
        descLabel.textColor = CELL_LIGHT_COLOR
        descLabel.font = UIFont.systemFontOfSize(14)
        
        
        self.contentView.addSubview(avatarImageView)
        self.contentView.addSubview(arrowImageView)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(shopNameLabel)
        self.contentView.addSubview(descLabel)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        avatarImageView.snp_makeConstraints { (make) in
            make.top.equalTo(self.contentView.snp_top).offset(8)
            make.left.equalTo(self.contentView.snp_left).offset(16)
            make.width.height.equalTo(60)
        }
        
        arrowImageView.snp_makeConstraints { (make) in
            make.centerY.equalTo(self.contentView.snp_centerY)
            make.right.equalTo(self.contentView.snp_right).offset(-16)
            make.width.height.equalTo(24)
        }
        
        nameLabel.snp_makeConstraints { (make) in
            make.top.equalTo(8)
            make.left.equalTo(avatarImageView.snp_right).offset(8)
            make.height.equalTo(21)
        }
        
        shopNameLabel.snp_makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp_bottom)
            make.left.equalTo(nameLabel.snp_left)
            make.height.equalTo(21)
        }
        
        descLabel.snp_makeConstraints { (make) in
            make.top.equalTo(shopNameLabel.snp_bottom)
            make.left.equalTo(shopNameLabel.snp_left)
            make.height.equalTo(21)
        }
    }
    
    func updateUIWithModel(model: PresellModel?) {
        //let url = NSURL(string: model!.imgurl!.stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)
        let url = NSURL(string: model!.logo!.stringByRemovingPercentEncoding!)
        avatarImageView.sd_setImageWithURL(url, placeholderImage: UIImage(named: "loading"))
        
        nameLabel.text = model?.contact
        
        shopNameLabel.text = model?.shop_name
        
        descLabel.text = model?.shop_desc
    }
}
