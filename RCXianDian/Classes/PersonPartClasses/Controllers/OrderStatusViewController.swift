//
//  OrderStatusViewController.swift
//  RCXianDian
//
//  Created by yliu on 16/8/20.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class OrderStatusViewController: XDBaseViewController {

    //MARK:- Instance Varible
    
    var orderDetailModel: OrderModel?
    
    var orderStatusTableView: XDTableView!
    
    var bottomView = UIView()
    
    //MARK:- Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialTableView()
    }
    
    //MARK:- UI Initial
    func initialTableView() {
        orderStatusTableView = XDTableView(frame: CGRectMake(0, 0, view.width, view.height), style: .Plain)
        orderStatusTableView.scrollEnabled = true
        orderStatusTableView.delegate = self
        orderStatusTableView.dataSource = self
        view.addSubview(orderStatusTableView)
        
        orderStatusTableView.reloadData()
    }
    
    //MARK:- Action
}

//MARK:- Extension

extension OrderStatusViewController: UITableViewDelegate, UITableViewDataSource {
        
//        func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//            return 0
//        }
    
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            guard self.orderDetailModel?.statusList != nil else {
                return 0
            }
            return self.orderDetailModel!.statusList!.count
        }
        
//        func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//            return 10
//        }
//        
//        func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//            return CGFloat.min
//        }
    
        
        func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            let model = self.orderDetailModel!.statusList![indexPath.row]
            return height(17, str: model.subTitle!, width: SCREEN_WIDTH-16*4-30, fSize: 14) + 55
        }
        
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
            let CELLIDENTIFIER = "OrderStatusTableViewCell"
            
            var cell = tableView.dequeueReusableCellWithIdentifier(CELLIDENTIFIER) as? OrderStatusTableViewCell
            
            if cell == nil {
                cell = OrderStatusTableViewCell(style: .Default, reuseIdentifier: CELLIDENTIFIER)
            }
            
            let model = self.orderDetailModel!.statusList![indexPath.row]
            cell?.updateUIWithModel(model)
            
            if indexPath.row == 0 {
                cell?.upView.hidden = true
            }
            if indexPath.row == self.orderDetailModel!.statusList!.count-1 {
                cell?.downView.hidden = true
            }
            
            return cell!
        }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        printLog(indexPath.row)
    }
        
}