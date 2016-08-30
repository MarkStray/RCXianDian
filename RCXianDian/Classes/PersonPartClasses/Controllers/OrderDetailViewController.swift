//
//  OrderDetailViewController.swift
//  RCXianDian
//
//  Created by yliu on 16/8/20.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class OrderDetailViewController: XDBaseViewController {
    
    //MARK:- Instance Varible
    var orderDetailModel: OrderModel? {
        didSet {
            setupTopMenu()
        }
    }
    
    var topMenu: TopMenu!
    
    
    
    //MARK:- Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "订单详情"
        
        requestOrderDetailData()
        
    }
    
    //MARK:- UI Initial
    
    func setupTopMenu() {
        let orderStatusVC = OrderStatusViewController()
        orderStatusVC.title = "订单状态"
        orderStatusVC.orderDetailModel = orderDetailModel
        
        let orderInfoVC = OrderInfoViewController()
        orderInfoVC.title = "订单信息"
        orderInfoVC.orderDetailModel = orderDetailModel
        
        topMenu = TopMenu(frame: CGRectMake(0, 0, SCREEN_WIDTH, view.height), viewControllers: [orderStatusVC, orderInfoVC])
        topMenu.backgroundColor = BACKGROUND_COLOR
        view.addSubview(topMenu)
    }
    
    //MARK:- Data Request
    func requestOrderDetailData() {
        
        OrderDetailCallInfo.requestOrderDetailsData { (orderDetailCallInfo) in
            printLog(orderDetailCallInfo!.toJSON())
            self.orderDetailModel = orderDetailCallInfo?.CallInfo
        }
    }
}
