//
//  FunctionHelper.swift
//  RCXianDian
//
//  Created by user on 16/8/4.
//  Copyright © 2016年 rrcc. All rights reserved.
//

//MARK:- 全局函数 构造Color

func RGBColor(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
}

func RGBAColor(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

func UIColorFromHEX(hexValue: Int) -> UIColor {
    return UIColor(red: ((CGFloat)((hexValue & 0xFF0000) >> 16))/255.0, green: ((CGFloat)((hexValue & 0xFF00) >> 8))/255.0, blue: ((CGFloat)(hexValue & 0xFF))/255.0, alpha: 1)
}

//MARK:- 日志输出

///Edit Scheme -> Info -> Build Configuration 切换DEBUG/RELEASE模式控制日志输出
func printLog<T>(message: T, file: String = #file, method: String = #function, line: Int = #line) {
    
    #if DEBUG
        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}


//MARK:- AlertView

func showAlertView(msg: String) {
    UIAlertView(title: "提示", message: msg, delegate: nil, cancelButtonTitle: "取消", otherButtonTitles: "确定").show()
}

func showAnimationAlertView(msg: String) {
    let animationAlert = UIAlertView(title: "提示", message: msg, delegate: nil, cancelButtonTitle: nil)
    animationAlert.show()
    animationAlert.dismissWithClickedButtonIndex(animationAlert.cancelButtonIndex, animated: true)
}



