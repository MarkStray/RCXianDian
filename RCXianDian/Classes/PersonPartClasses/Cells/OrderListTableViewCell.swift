//
//  OrderListTableViewCell.swift
//  RCXianDian
//
//  Created by user on 16/8/3.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class OrderListTableViewCell: XDTableViewCell {

    static let cellHeight = CGFloat(120)
    
    var topView = UIView()
    var centerView = UIView()
    var bottomView = UIView()

    var logoImgView = UIImageView()
    var orderCodeLabel = UILabel()
    var orderStatusLabel = UILabel()
    var shopLabel = UILabel()
    var goodNumLabel = UILabel()
    var tolPriceLabel = UILabel()
    var datatimeLabel = UILabel()
    
    override func initialUI() {
        
        addSubview(topView)
        addSubview(centerView)
        addSubview(bottomView)
        
        do {
            let topLine = UIView(frame: CGRectMake(16, 34, SCREEN_WIDTH-16*2, 1))
            topLine.backgroundColor = LINE_COLOR
            topView.addSubview(topLine)
            
            orderCodeLabel.font = FONTSIZE_DEFAULT
            orderCodeLabel.textColor = CELL_DARK_COLOR
            topView.addSubview(orderCodeLabel)
            
            orderStatusLabel.font = FONTSIZE_BIG
            orderStatusLabel.textColor = CELL_RED_COLOR
            orderStatusLabel.textAlignment = .Center
            topView.addSubview(orderStatusLabel)
        }
        
        do {
            let centerLine = UIView(frame: CGRectMake(16, 49, SCREEN_WIDTH-16*2, 1))
            centerLine.backgroundColor = LINE_COLOR
            centerView.addSubview(centerLine)
            
            logoImgView.image = UIImage(imageNamed: .shopLogoN)
            centerView.addSubview(logoImgView)
            
            shopLabel.font = FONTSIZE_DEFAULT
            shopLabel.textColor = GLOBAL_COLOR
            centerView.addSubview(shopLabel)
            
            goodNumLabel.font = FONTSIZE_DEFAULT
            goodNumLabel.textColor = CELL_DARK_COLOR
            centerView.addSubview(goodNumLabel)
            
            tolPriceLabel.font = FONTSIZE_DEFAULT
            tolPriceLabel.textColor = CELL_DARK_COLOR
            centerView.addSubview(tolPriceLabel)
        }

        do {
            datatimeLabel.font = FONTSIZE_DEFAULT
            datatimeLabel.textColor = CELL_LIGHT_COLOR
            centerView.addSubview(datatimeLabel)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        topView.snp_makeConstraints { (make) in
            make.top.right.left.equalTo(self)
            make.height.equalTo(35)
        }
        centerView.snp_makeConstraints { (make) in
            make.right.left.equalTo(self)
            make.top.equalTo(topView.snp_bottom)
            make.height.equalTo(50)
        }
        bottomView.snp_makeConstraints { (make) in
            make.bottom.right.left.equalTo(self)
            make.height.equalTo(35)
        }
        
        do {
            orderCodeLabel.snp_makeConstraints(closure: { (make) in
                make.centerY.equalTo(topView)
                make.left.equalTo(topView).offset(16)
            })
            orderStatusLabel.snp_makeConstraints(closure: { (make) in
                make.top.bottom.equalTo(topView)
                make.right.equalTo(topView).offset(-16)
                make.width.equalTo(80)
            })
        }
        
        do {
            logoImgView.snp_makeConstraints(closure: { (make) in
                make.left.equalTo(centerView).offset(8)
                make.top.equalTo(centerView)
                make.width.height.equalTo(35)
            })
            shopLabel.snp_makeConstraints(closure: { (make) in
                make.centerY.equalTo(logoImgView)
                make.left.equalTo(logoImgView.snp_right)
            })
            goodNumLabel.snp_makeConstraints(closure: { (make) in
                make.left.equalTo(centerView).offset(16)
                make.bottom.equalTo(centerView)
            })
            tolPriceLabel.snp_makeConstraints(closure: { (make) in
                make.right.equalTo(centerView).offset(-16)
                make.bottom.equalTo(centerView)
            })
        }
        
        do {
            datatimeLabel.snp_makeConstraints(closure: { (make) in
                make.centerY.equalTo(bottomView)
                make.left.equalTo(bottomView).offset(16)
            })
        }
    }
    
    func updateUIWithModel(model: OrderModel) {
        //orderCodeLabel.text = "订单号:" + model.ordercode!
        orderCodeLabel.text = "订单号:" + model.tel!
        orderStatusLabel.text = model.status_title!
        shopLabel.text = model.client_name
        goodNumLabel.text = "共" + model.ordercount! + "件商品"
        tolPriceLabel.text = "合计:￥" + model.tolprice!
        datatimeLabel.text = model.inserttime
    }
    
}
