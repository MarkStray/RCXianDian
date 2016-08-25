//
//  RedDot.swift
//  RCXianDian
//
//  Created by user on 16/8/8.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

private let RedDotAnimationDuration: NSTimeInterval = 0.2

class RedDot: UIView {

    // RedDot单例
    private static let instance = RedDot()
    class var sharedRedDot: RedDot {
        return instance
    }

    private var numberLabel = UILabel()
    private var redDotImgView = UIImageView()

    var number: Int = 0 {
        didSet {
            if number == 0 {
                numberLabel.text = "0"
                hidden = true
            } else {
                if number > 99 {
                    numberLabel.font = UIFont.systemFontOfSize(8)
                } else {
                    numberLabel.font = UIFont.systemFontOfSize(10)
                }
                
                numberLabel.text = String(number)
                hidden = false
            }
            // animation
            reddotAnimation()
        }
    }
    
    private func reddotAnimation() {
        
        UIView.animateWithDuration(RedDotAnimationDuration, animations: { 
            self.transform = CGAffineTransformMakeScale(1.3, 1.3)
            }) { (completion) in
               UIView.animateWithDuration(RedDotAnimationDuration, animations: {
                self.transform = CGAffineTransformIdentity
               })
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        redDotImgView.image = UIImage(imageNamed: .redDotN)
        addSubview(redDotImgView)
        
        numberLabel.textColor = UIColor.whiteColor()
        numberLabel.textAlignment = .Center
        addSubview(numberLabel)
        
        hidden = true
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(RedDot.shoppingCarDidChange), name: XDShoppingCarChangedNotification, object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: XDShoppingCarChangedNotification, object: nil)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        redDotImgView.snp_makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(self)
        }
        
        numberLabel.snp_makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(self)
        }
    }
    
    //MARK:- Action
    func shoppingCarDidChange(notify: NSNotification) {
        let badgeNumber = notify.userInfo!["badge"] as! Int
        number = badgeNumber
    }
}
