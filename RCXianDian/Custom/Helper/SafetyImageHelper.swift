//
//  SafetyImageHelper.swift
//  RCXianDian
//
//  Created by user on 16/8/25.
//  Copyright © 2016年 rrcc. All rights reserved.
//

//MARK: 集中管理项目 image 资源名字

extension UIImage {
    convenience init!(imageNamed: ImageNamed) {
        self.init(named: imageNamed.rawValue)
    }
}

//MARK: 项目所有image resource

enum ImageNamed: String {
    
    ///首页
    case rightArrowN = "rightArrow"
    
    ///商城
    case searchBGN = "search_b"
    case cellSelectedN = "cellSelected"
    case backArrowN = "backArrow"
    
    
    ///我的
    case mineBGN = "mine-background"
    case minePortraitN = "portrait"
    case mineArrowN = "mine-arrow"
    case answerN = "a"
    case questionN = "q"

    ///地址
    
    ///购物车
    case shoppingCarN = "car"
    case addN = "add"
    case reduceN = "reduce"
    case onsaleN = "onsale"
    
    ///支付

    ///订单
    case shopLogoN = "shop-logo"
    case orderBoxN = "order-box"
    
    ///Other
    case loadingN = "loading"
    case redDotN = "redDot"
}