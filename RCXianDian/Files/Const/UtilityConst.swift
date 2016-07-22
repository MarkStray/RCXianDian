//
//  UtilityConst.swift
//  RCXianDian
//
//  Created by user on 16/7/20.
//  Copyright © 2016年 rrcc. All rights reserved.
//

let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height


let GLOBAL_COLOR      = UIColorFromHEX(0x299C19)    // 绿色
let BACKGROUND_COLOR  = UIColorFromHEX(0xf3f3f3)    // 灰色
let TEXT_COLOR        = UIColorFromHEX(0xff4f00)    // 黄色

func RGBColor(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
}

func RGBAColor(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

func UIColorFromHEX(hexValue: Int) -> UIColor {
    return UIColor(red: ((CGFloat)((hexValue & 0xFF0000) >> 16))/255.0, green: ((CGFloat)((hexValue & 0xFF00) >> 8))/255.0, blue: ((CGFloat)(hexValue & 0xFF))/255.0, alpha: 1)
}

extension UIColor {
    
    class func RGB(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
    }
    
    class func RGBA(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    
    class func HEX(hexValue: Int) -> UIColor {
        return UIColor(red: ((CGFloat)((hexValue & 0xFF0000) >> 16))/255.0, green: ((CGFloat)((hexValue & 0xFF00) >> 8))/255.0, blue: ((CGFloat)(hexValue & 0xFF))/255.0, alpha: 1)
    }
}


