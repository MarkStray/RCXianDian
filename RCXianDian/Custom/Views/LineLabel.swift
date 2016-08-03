//
//  LineLabel.swift
//  RCXianDian
//
//  Created by user on 16/8/3.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class LineLabel: UILabel {
    var isWithStrikeThrough: Bool?
    
    override func drawRect(rect: CGRect) {
        if let _ = isWithStrikeThrough {
            let context = UIGraphicsGetCurrentContext()
            
            //let redColor: [CGFloat] = [1, 0, 0, 0.8]//红色
            let blackColor: [CGFloat] = [0, 0, 0, 0.5]//黑色
            CGContextSetStrokeColor(context, blackColor)
            CGContextSetLineWidth(context, 1);
            CGContextBeginPath(context);
            
            //画直线
            let halfWayUp = rect.size.height/2 + rect.origin.y;
            
            CGContextMoveToPoint(context, rect.origin.x, halfWayUp );//开始点
            CGContextAddLineToPoint(context, rect.origin.x + rect.size.width, halfWayUp);//结束点
            //画斜线
            //CGContextMoveToPoint(context, rect.origin.x, rect.origin.y+5 );
            //CGContextAddLineToPoint(context, (rect.origin.x + rect.size.width)*0.5, rect.origin.y+rect.size.height-5); //斜线
            CGContextStrokePath(context);
        }
        
        super.drawRect(rect)
    }
}
