//
//  OrderStatusTableViewCell.swift
//  RCXianDian
//
//  Created by user on 16/8/24.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class OrderStatusTableViewCell: XDTableViewCell {

    var upView = UIView()
    var downView = UIView()
    var orderView = UIView()
    
    var statusImgView = UIImageView()
    var orderBackgImgView = UIImageView()
    var orderStatusLabel = UILabel()
    var orderDetailLabel = UILabel()
    var orderTimeLabel = UILabel()
    
    override func initialUI() {
        local { 
            self.lineView.hidden = true
            self.upView.backgroundColor = LINE_COLOR
            self.downView.backgroundColor = LINE_COLOR
            self.contentView.backgroundColor = BACKGROUND_COLOR
        }
        
        
        local {
            self.contentView.addSubview(self.upView)
            self.contentView.addSubview(self.downView)
            self.contentView.addSubview(self.statusImgView)
            self.contentView.addSubview(self.orderView)
        }
        
        local {
            self.orderBackgImgView.image = UIImage(imageNamed: .orderBoxN)
            self.orderView.addSubview(self.orderBackgImgView)
            
            self.orderStatusLabel.font = FONTSIZE_BIG
            self.orderStatusLabel.textColor = CELL_DARK_COLOR
            self.orderView.addSubview(self.orderStatusLabel)
            
            self.orderTimeLabel.font = FONTSIZE_SMALL
            self.orderTimeLabel.textColor = CELL_LIGHT_COLOR
            self.orderView.addSubview(self.orderTimeLabel)
            
            self.orderDetailLabel.font = FONTSIZE_DEFAULT
            self.orderDetailLabel.textColor = CELL_LIGHT_COLOR
            self.orderDetailLabel.numberOfLines = 0
            self.orderView.addSubview(self.orderDetailLabel)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        do {
            upView.snp_makeConstraints { (make) in
                make.top.equalTo(contentView)
                make.left.equalTo(contentView).offset(16+16-2)
                make.bottom.equalTo(downView.snp_top)
                make.height.equalTo(downView.snp_height)
                make.width.equalTo(2)
            }
            
            downView.snp_makeConstraints { (make) in
                make.bottom.equalTo(contentView)
                make.left.equalTo(upView)
                make.top.equalTo(upView.snp_bottom)
                make.height.equalTo(upView.snp_height)
                make.width.equalTo(2)
            }
            
            statusImgView.snp_makeConstraints { (make) in
                make.width.height.equalTo(30)
                make.centerX.equalTo(upView)
                make.centerY.equalTo(contentView)
            }
            
            orderView.snp_makeConstraints { (make) in
                make.left.equalTo(statusImgView.snp_right)
                make.top.equalTo(contentView).offset(8)
                make.right.bottom.equalTo(contentView).offset(-8)
            }
        }
        
        do {
            orderBackgImgView.snp_makeConstraints { (make) in
                make.top.left.right.bottom.equalTo(orderView)
            }
            
            orderStatusLabel.snp_makeConstraints { (make) in
                make.left.equalTo(orderView).offset(16)
                make.centerY.equalTo(statusImgView.snp_top)
            }
            
            orderTimeLabel.snp_makeConstraints { (make) in
                make.right.equalTo(orderView).offset(-8)
                make.centerY.equalTo(orderStatusLabel)
            }
            
            orderDetailLabel.snp_makeConstraints { (make) in
                make.left.equalTo(orderView).offset(16)
                make.right.equalTo(orderView).offset(-8)
                make.top.equalTo(downView)
            }
        }
    }
    
    func updateUIWithModel(model: StatusModel?) {
        upView.hidden = false
        downView.hidden = false
        
        let url = NSURL(string: model!.img_url!.stringByRemovingPercentEncoding!)
        statusImgView.sd_setImageWithURL(url, placeholderImage: UIImage(imageNamed: .loadingN))

        orderStatusLabel.text = model?.title
        orderDetailLabel.text = model?.subTitle
        orderTimeLabel.text = model?.inserttime
    }

}
