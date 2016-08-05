//
//  StoreSearchView.swift
//  RCXianDian
//
//  Created by user on 16/8/5.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class StoreSearchView: UIView {
    
    private var backgView = UIView()
    private var imgView = UIImageView()
    private var titleLabel = UILabel()
    private var lineView = UIView()
    
    var searchViewAction: ((Void) -> (Void))?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = BACKGROUND_COLOR
        
        backgView.layer.masksToBounds = true
        backgView.layer.cornerRadius = 15
        backgView.layer.borderWidth = 1
        backgView.backgroundColor = UIColor.whiteColor()
        backgView.layer.borderColor = LINE_COLOR.CGColor
        addSubview(backgView)
        
        titleLabel.textAlignment = .Center
        titleLabel.textColor = CELL_LIGHT_COLOR
        titleLabel.font = FONTSIZE_SMALL
        titleLabel.text = "搜索产品名称"
        backgView.addSubview(titleLabel)
        
        imgView.image = UIImage(named: "search_b")
        backgView.addSubview(imgView)
        
        lineView.backgroundColor = LINE_COLOR
        addSubview(lineView)
        
        backgView.userInteractionEnabled = true
        imgView.userInteractionEnabled = true
        titleLabel.userInteractionEnabled = true

        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(StoreSearchView.searchViewClick)))
    }
    
    func searchViewClick() {
        searchViewAction?()
    }
    
    convenience init(frame: CGRect, searchViewAction: (() -> Void)?) {
        self.init(frame: frame)
        self.searchViewAction = searchViewAction
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgView.snp_makeConstraints { (make) in
            make.top.equalTo(self).offset(5)
            make.bottom.equalTo(self).offset(-5)
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
        }
        
        titleLabel.snp_makeConstraints { (make) in
            make.center.equalTo(backgView)
        }
        
        imgView.snp_makeConstraints { (make) in
            make.right.equalTo(titleLabel.snp_left)
            make.centerY.equalTo(titleLabel)
            make.width.height.equalTo(25)
        }
        
        lineView.snp_makeConstraints { (make) in
            make.left.bottom.right.equalTo(self)
            make.height.equalTo(1)
        }

    }

}
