 //
 //  UIExtension.swift
 //  扩展
 //
 //  Created by timer_open on 16/7/21.
 //  Copyright © 2016年 timer_open. All rights reserved.
 //
 
 import UIKit
 //MARK:UILabel
 extension UILabel{
//    func left() ->CGFloat{
//        return self.frame.origin.x
//    }
//    func right() ->CGFloat{
//        return  self.frame.origin.x + self.width()
//    }
//    func top() ->CGFloat{
//        return self.frame.origin.y
//    }
//    func botom() ->CGFloat{
//        return self.frame.origin.y + self.height()
//    }
//    func setLeft(x:CGFloat){
//        var frame = self.frame
//        frame.origin.x = x
//        self.frame = frame
//    }
//    func setRight(right:CGFloat){
//        var frame = self.frame
//        frame.origin.x = right - self.width()
//        self.frame = frame
//    }
//    func setBottom(bottom:CGFloat){
//        var frame = self.frame
//        frame.origin.y = bottom - self.height()
//        self.frame = frame
//    }
//    func setTop(y:CGFloat){
//        var frame = self.frame
//        frame.origin.y = y
//        self.frame = frame
//        
//    }
//    func height() ->CGFloat{
//        return self.frame.size.height
//    }
//    func width()  ->CGFloat{
//        return self.frame.size.width
//    }
//    func centerX() ->CGFloat{
//        return self.center.x
//    }
//    func centerY() ->CGFloat{
//        return self.center.y
//    }
//    func setWidth(width:CGFloat){
//        var frame = self.frame;
//        frame.size.width = width;
//        self.frame = frame
//    }
//    func setHeight(height:CGFloat){
//        var frame = self.frame;
//        frame.size.height = height;
//        self.frame = frame
//    }
//    func setCenterX(centerX:CGFloat){
//        var point = self.center
//        point = CGPointMake(centerX, self.center.y)
//        self.center = point
//    }
//    func setCenterY(centerY:CGFloat){
//        var point = self.center
//        point = CGPointMake(self.center.y,centerY)
//        self.center = point
//    }
    //MARK:----------------------------字体划线-----------------------------
    func IsWithStrikeThrough(){
        let attr = NSMutableAttributedString(string: self.text!)
        let count = self.text?.characters.count
        attr.addAttribute(NSStrikethroughStyleAttributeName, value: NSNumber(integer: 1), range: NSMakeRange(0, count!))
        self.attributedText = attr
        self.sizeToFit()
    }
    //MARK:---------------------------富文本处理价格字符串-------------------
    func diverseStringOriginalStr(original : String, conversionStr :String, Font : UIFont, Color : UIColor){
        let attr = NSMutableAttributedString(string: original as String)
        let strrange = (original as NSString) .rangeOfString(conversionStr as String)
        attr.addAttribute(NSForegroundColorAttributeName, value: Color, range: strrange)
        attr.addAttribute(NSFontAttributeName, value: Font, range: strrange)
        self.attributedText = attr
    }
    
 }
 
 
