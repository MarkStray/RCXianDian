//
//  QATableViewCell.swift
//  RCXianDian
//
//  Created by user on 16/8/23.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class QATableViewCell: XDTableViewCell {
    var qImgView = UIImageView()
    var aImgView = UIImageView()
    var qLabel = UILabel()
    var aLabel = UILabel()
    
    override func initialUI() {
        lineView.hidden = true

        qLabel.textColor = CELL_DARK_COLOR
        qLabel.font = UIFont.systemFontOfSize(14)
        
        aLabel.textColor = CELL_LIGHT_COLOR
        aLabel.font = UIFont.systemFontOfSize(14)
        aLabel.numberOfLines = 0
        
        qImgView.image = UIImage(imageNamed: .questionN)
        aImgView.image = UIImage(imageNamed: .answerN)

        self.contentView.addSubview(qImgView)
        self.contentView.addSubview(aImgView)
        self.contentView.addSubview(qLabel)
        self.contentView.addSubview(aLabel)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        qImgView.snp_makeConstraints { (make) in
            make.top.equalTo(self.contentView).offset(8)
            make.left.equalTo(self.contentView).offset(16)
            make.width.height.equalTo(24).priority(999)
        }
        
        aImgView.snp_makeConstraints { (make) in
            make.top.equalTo(qImgView.snp_bottom).offset(10)
            make.left.equalTo(self.contentView).offset(16)
            make.width.height.equalTo(24).priority(999)
        }
        
        qLabel.snp_makeConstraints { (make) in
            make.top.equalTo(qImgView)
            make.left.equalTo(qImgView.snp_right).offset(8)
            make.right.equalTo(self.contentView).offset(-16)
            make.height.equalTo(24)
        }
        
        aLabel.snp_makeConstraints { (make) in
            make.top.equalTo(aImgView)
            make.left.equalTo(aImgView.snp_right).offset(8)
            make.right.equalTo(self.contentView).offset(-16)
            make.bottom.equalTo(self.contentView).offset(-8)
        }
    }
}
