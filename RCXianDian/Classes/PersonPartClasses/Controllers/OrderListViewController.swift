//
//  OrderListViewController.swift
//  RCXianDian
//
//  Created by yliu on 16/8/20.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class OrderListViewController: XDBaseViewController {

    //MARK:- Instance Varible
    
    var orderList: [OrderModel]? {
        didSet {
            orderListTableView.reloadData()
        }
    }
    
    var orderListTableView = XDTableView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64), style: .Grouped)
   
    //MARK:- Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialUI()
        
        requestOrderListData()
    }
    
    //MARK:- UI Initial
    func initialUI() {
        title = "我的订单"

        orderListTableView.delegate = self
        orderListTableView.dataSource = self
        view.addSubview(orderListTableView)
    }
    
    //MARK:- Data Request
    func requestOrderListData() {
        OrderCallInfo.requestOrderListData { (orderCallInfo) in
            printLog(orderCallInfo!.toJSON())
            self.orderList = orderCallInfo?.CallInfo
        }
        
        //OrderDetailCallInfo.requestOrderDetailsData { (orderDetailCallInfo) in
            //printLog(orderDetailCallInfo!.toJSON())
        //}
    }
    
    //MARK:- Action

}

//MARK:- Extension

extension OrderListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        guard orderList != nil else {
            return 0
        }
        return orderList!.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.min
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return OrderListTableViewCell.cellHeight
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let CELLIDENTIFIER = "OrderListTableViewCell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(CELLIDENTIFIER) as? OrderListTableViewCell
        
        if cell == nil {
            cell = OrderListTableViewCell(style: .Default, reuseIdentifier: CELLIDENTIFIER)
        }
        
        let model = orderList![indexPath.section]
        cell?.updateUIWithModel(model)
                
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //let model = orderList![indexPath.section]
        self.navigationController?.pushViewController(OrderStatusViewController(), animated: true)
    }
    
}