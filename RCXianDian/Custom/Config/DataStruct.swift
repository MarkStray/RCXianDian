//
//  DataStruct.swift
//  RCXianDian
//
//  Created by user on 16/8/3.
//  Copyright © 2016年 rrcc. All rights reserved.
//


/**
 *  数据配置
 */
struct DataStruct {
    /// tabbar
    static let tabBar: [[String: String]] = {
        let item_0 = [
            "class_name": "HomeViewController",
            "image": "tabbar-main",
            "image_selected": "tabbar-main-selected",
            "title": "首页"
        ]
        let item_1 = [
            "class_name": "StoreViewController",
            "image": "tabbar-category",
            "image_selected": "tabbar-category-selected",
            "title": "商城"
        ]
        let item_2 = [
            "class_name": "PersonViewController",
            "image": "tabbar-my",
            "image_selected": "tabbar-my-selected",
            "title": "我的"
        ]
        return [item_0, item_1, item_2]
    }()
    
    /// 个人中心
    static let personCenter: [[[String: NSObject]]] = {
        let section_0 = [
            ["img": "mine-order", "title": "我的订单", "detailTitle": "", "arrowHidden": false, "lineHidden": false],
            ["img": "mine-history", "title": "我的购买记录", "detailTitle": "", "arrowHidden": false, "lineHidden": true]
        ]
        let section_1 = [
            ["img": "mine-balance", "title": "我的余额", "detailTitle": "", "arrowHidden": false, "lineHidden": true]
        ]
        let section_2 = [
            ["img": "mine-call", "title": "客服电话：  4000-285-927", "detailTitle": "", "arrowHidden": true, "lineHidden": false],
            ["img": "mine-help", "title": "常见问题", "detailTitle": "", "arrowHidden": false, "lineHidden": false],
            ["img": "mine-reset", "title": "修改密码", "detailTitle": "", "arrowHidden": true, "lineHidden": true]
        ]
        let section_3 = [
            ["img": "mine-exit", "title": "注销登录", "detailTitle": "", "arrowHidden": true, "lineHidden": true]
        ]
        return [section_0, section_1, section_2, section_3]
    }()
}



