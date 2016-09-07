//
//  OrderInfoViewController.swift
//  RCXianDian
//
//  Created by yliu on 16/8/20.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class OrderInfoViewController: XDBaseViewController {

    private let OrderInfoTableViewCellIdentifier = "OrderInfoTableViewCell"
    private let OrderDetailInfoTableViewCellIdentifier = "OrderDetailInfoTableViewCell"
    private let OrderInfoHeaderReusableViewCellIdentifier = "OrderInfoHeaderView"

    //MARK:- Instance Varible
    
    //优惠信息
    var preferInfoList = [[String: String]]()

    //其他信息
    var extraInfoList = [[String: String]]()
    
    
    var orderDetailModel: OrderModel? {
        didSet {
            buildPreferInfoData()
            buildExtraInfoData()
        }
    }
    
    var orderInfoTableView: XDTableView!
    
    //MARK:- Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()

        initialTableView()
    }
    
    //MARK:- UI Initial
    func initialTableView() {
        orderInfoTableView = XDTableView(frame: CGRectMake(0, 0, view.width, view.height), style: .Grouped)
        printLog("enable \(orderInfoTableView.scrollEnabled)")
        orderInfoTableView.delegate = self
        orderInfoTableView.dataSource = self
        
        orderInfoTableView.tableFooterView = {
            let footerView = UIView()
            footerView.backgroundColor = UIColor.whiteColor()
            footerView.height = 60
            return footerView
        }()
        
        orderInfoTableView.registerClass(OrderInfoTableViewCell.self, forCellReuseIdentifier: OrderInfoTableViewCellIdentifier)
        orderInfoTableView.registerClass(OrderDetailInfoTableViewCell.self, forCellReuseIdentifier: OrderDetailInfoTableViewCellIdentifier)
        orderInfoTableView.registerClass(OrderInfoHeaderView.self, forHeaderFooterViewReuseIdentifier: OrderInfoHeaderReusableViewCellIdentifier)
        
        view.addSubview(orderInfoTableView)
        
        //orderInfoTableView.reloadData()
    }
    
    //MARK:- Build Data
    func buildPreferInfoData() {
        if let gift = orderDetailModel?.gift {
            preferInfoList.append(["title": "  赠品:", "detail": gift, "align": "left", "color": "gray", "font": "14"])
        }
        if let discount = orderDetailModel?.discount {
            preferInfoList.append(["title": "  满减:", "detail": "-￥"+discount, "align": "right", "color": "gray", "font": "14"])
        }
        if let voucher = orderDetailModel?.voucher {
            preferInfoList.append(["title": "  红包:", "detail": voucher, "align": "right", "color": "gray", "font": "14"])
        }
        if let custprice = orderDetailModel?.custprice {
            preferInfoList.append(["title": "  合计:", "detail": "￥"+custprice, "align": "right", "color": "red", "font": "18"])
        }
    }
    
    func buildExtraInfoData() {
        extraInfoList.append(["订单号    :": (orderDetailModel?.order_tel)!])
        extraInfoList.append(["联系人    :": (orderDetailModel?.order_contact)!])
        extraInfoList.append(["手机号    :": (orderDetailModel?.order_tel)!])
        extraInfoList.append(["商户名称 :": (orderDetailModel?.clientname)!])
        extraInfoList.append(["配送方式 :": (orderDetailModel?.delivery_title)!])
        extraInfoList.append(["配送地址 :": (orderDetailModel?.order_address)!])
        extraInfoList.append(["支付方式 :": (orderDetailModel?.payment_title)!])
        extraInfoList.append(["下单时间 :": (orderDetailModel?.inserttime)!])
        extraInfoList.append(["预约时间 :": (orderDetailModel?.svtime)!])
        extraInfoList.append(["备注信息 :": (orderDetailModel?.remark)!])
    }
    
}

//MARK:- Extension
extension OrderInfoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return (orderDetailModel?.itemList?.count)!
        } else if section == 1 {
            return preferInfoList.count
        } else {
            return extraInfoList.count
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.min
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 60
        } else if indexPath.section == 1 {
            return 40
        } else {
            let extraDict = extraInfoList[indexPath.row] as NSDictionary
            let detail = extraDict.allValues.last as? String
            return height(17, str: detail!, width: SCREEN_WIDTH-16*4-30, fSize: 14) + 25
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCellWithIdentifier(OrderInfoTableViewCellIdentifier, forIndexPath: indexPath) as! OrderInfoTableViewCell
            let model = orderDetailModel?.itemList![indexPath.row]
            cell.updateUIWithModel(model)
            return cell
        } else {
            
            let cell = tableView.dequeueReusableCellWithIdentifier(OrderDetailInfoTableViewCellIdentifier, forIndexPath: indexPath) as! OrderDetailInfoTableViewCell
            
            if indexPath.section == 1 {
                let title = preferInfoList[indexPath.row]["title"]
                let detail = preferInfoList[indexPath.row]["detail"]
                
                let align = preferInfoList[indexPath.row]["align"]
                let color = preferInfoList[indexPath.row]["color"]
                let font = preferInfoList[indexPath.row]["font"]
                
                cell.detailLabel.textAlignment = .Right
                if align == "left" {
                    cell.detailLabel.textAlignment = .Left
                }
                
                cell.detailLabel.textColor = CELL_LIGHT_COLOR
                if color == "red" {
                    cell.detailLabel.textColor = CELL_RED_COLOR
                }
                
                cell.detailLabel.font = FONTSIZE_DEFAULT
                if color == "18" {
                    cell.detailLabel.font = FONTSIZE_LARGE
                }
                
                cell.titleLabel.text = title
                cell.detailLabel.text = detail
                
                cell.lineView.hidden = true
            } else {
                
                let title = (extraInfoList[indexPath.row] as NSDictionary).allKeys.last as? String
                let detail = (extraInfoList[indexPath.row] as NSDictionary).allValues.last as? String
                cell.titleLabel.text = title
                cell.detailLabel.text = detail
            }
            
            return cell
        }
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerV = tableView.dequeueReusableHeaderFooterViewWithIdentifier(OrderInfoHeaderReusableViewCellIdentifier) as! OrderInfoHeaderView
        if section == 0 {
            headerV.titleLabel.text = "订单明细"
            headerV.backgView.backgroundColor = UIColor.RGBA(240, g: 240, b: 240, a: 0.8)
        } else if section == 1 {
            headerV.titleLabel.text = "优惠合计"
            headerV.backgView.backgroundColor = UIColor.whiteColor()
        } else {
            headerV.titleLabel.text = "其他信息"
            headerV.backgView.backgroundColor = UIColor.RGBA(240, g: 240, b: 240, a: 0.8)
        }
        return headerV
    }
}