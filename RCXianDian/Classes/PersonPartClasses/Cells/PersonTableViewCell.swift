//
//  PersonTableViewCell.swift
//  RCXianDian
//
//  Created by user on 16/8/3.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class PersonTableViewCell: XDTableViewCell {

    var iconImgView = UIImageView()
    var titleLabel = UILabel()
    var detailTitleLabel = UILabel()
    var arrowImgView = UIImageView()
    var lineView = UIView()
    
    override func initialUI() {
        
        titleLabel.textColor = CELL_DARK_COLOR
        titleLabel.font = UIFont.systemFontOfSize(14)
        
        detailTitleLabel.textColor = CELL_LIGHT_COLOR
        titleLabel.font = UIFont.systemFontOfSize(12)
        
        arrowImgView.image = UIImage(named: "mine-arrow")
        lineView.backgroundColor = LINE_COLOR
        
        self.contentView.addSubview(iconImgView)
        self.contentView.addSubview(arrowImgView)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(detailTitleLabel)
        self.contentView.addSubview(lineView)
    }
    

    override func layoutSubviews() {
        super.layoutSubviews()

        iconImgView.snp_makeConstraints { (make) in
            make.top.bottom.equalTo(self.contentView)
            make.left.equalTo(self.contentView.snp_left).offset(16)
            make.width.equalTo(iconImgView.snp_height)
        }
        
        titleLabel.snp_makeConstraints { (make) in
            make.centerY.equalTo(self.contentView.snp_centerY)
            make.left.equalTo(iconImgView.snp_right).offset(8)
            make.height.equalTo(21)
        }
        
        arrowImgView.snp_makeConstraints { (make) in
            make.top.bottom.equalTo(self.contentView)
            make.right.equalTo(self.contentView.snp_right).offset(-16)
            make.width.equalTo(iconImgView.snp_height)
        }

        detailTitleLabel.snp_makeConstraints { (make) in
            make.centerY.equalTo(self.contentView.snp_centerY)
            make.right.equalTo(arrowImgView.snp_right).offset(-8)
            make.height.equalTo(21)
        }
        
        lineView.snp_makeConstraints { (make) in
            make.bottom.equalTo(contentView.snp_bottom)
            make.left.equalTo(contentView.snp_left).offset(16)
            make.right.equalTo(contentView.snp_right).offset(-16)
            make.height.equalTo(1)
        }
    }
    
    func updateUIWithModel(model: PersonModel?) {
        
        titleLabel.text = model?.title
        
        detailTitleLabel.text = model?.detailTitle
        
        iconImgView.image = UIImage(named: (model?.img)!)

        //arrowImgView.hidden = (model?.arrowHidden)!
        
        lineView.hidden = (model?.lineHidden)!
    }
}
