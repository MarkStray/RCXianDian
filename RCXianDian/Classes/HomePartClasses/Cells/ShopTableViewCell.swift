//
//  ShopTableViewCell.swift
//  RCXianDian
//
//  Created by user on 16/7/29.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit
import SnapKit

class ShopTableViewCell: UITableViewCell {
    
    var avatarImageView = UIImageView()
    var nameLabel = UILabel()
    var shopNameLabel = UILabel()
    var descLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.contentView.addSubview(avatarImageView)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(shopNameLabel)
        self.contentView.addSubview(descLabel)
        
        avatarImageView.layer.masksToBounds = true
        avatarImageView.layer.cornerRadius = 5
    }
    
    override func layoutSubviews() {
        avatarImageView.snp_makeConstraints { (make) in
            make.top.equalTo(self.contentView.snp_top).offset(8)
            make.left.equalTo(self.contentView.snp_left).offset(16)
            make.width.height.equalTo(60)
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
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
