//
//  PersonHeaderView.swift
//  RCXianDian
//
//  Created by user on 16/8/3.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class PersonHeaderView: UIView {

    var iconView = IconView()
    
    var iconViewClick: (Void -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //背景图片
        layer.contents = UIImage(imageNamed: .mineBGN)?.CGImage
        
        iconView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(PersonHeaderView.iconViewAction)))
        addSubview(iconView)
    }
    
    convenience init(frame: CGRect, iconClickAction: (Void -> Void)) {
        self.init(frame: frame)
        iconViewClick = iconClickAction
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        iconView.snp_makeConstraints { (make) in
            make.width.equalTo(SCREEN_WIDTH/3)
            make.height.equalTo(120)
            make.centerX.equalTo(self)
            make.bottom.equalTo(self)
        }
    }
    
    func iconViewAction() {
        iconViewClick?()
    }
}


class IconView: UIView {
    
    var iconImageView = UIImageView()
    var iconMobileLabel = UILabel()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
        
        iconImageView.image = UIImage(imageNamed: .minePortraitN)
        addSubview(iconImageView)
        
        iconMobileLabel.font = UIFont.systemFontOfSize(18)
        iconMobileLabel.textColor = UIColor.whiteColor()
        iconMobileLabel.textAlignment = .Center
        addSubview(iconMobileLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        iconImageView.snp_makeConstraints { (make) in
            make.top.equalTo(self.snp_top).offset(5)
            make.width.height.equalTo(80)
            make.centerX.equalTo(self.centerX)
        }
        
        iconMobileLabel.snp_makeConstraints { (make) in
            make.top.equalTo(iconImageView.snp_bottom).offset(5)
            make.left.equalTo(self.snp_left)
            make.right.equalTo(self.snp_right)
            make.height.equalTo(21)
        }
    }
}


