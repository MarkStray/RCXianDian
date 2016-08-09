//
//  ShoppingCarViewController.swift
//  RCXianDian
//
//  Created by user on 16/8/8.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class ShoppingCarViewController: XDBaseViewController {

    var productList: [ProductModel]? {
        didSet {
            if productList?.count > 0 {
                productTableView.hidden = false
                bottomView.hidden = false
                
                emptyView.hidden = true
                
                productTableView.reloadData()
            } else {
                productTableView.hidden = true
                bottomView.hidden = true
                
                emptyView.hidden = false
            }
        }
    }
    
    var productTableView: XDTableView!
    var bottomView: ShoppingCarBottomView!
    var emptyView: ShoppingCarEmptyView!

    override func viewDidLoad() {
        super.viewDidLoad()

        initialNav()
        initialTableView()
        initialBottomView()
        initialEmptyView()
        initialData()
    }
    
    func initialNav() {
        title = "购物车"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "dustbin")?.imageWithRenderingMode(.AlwaysOriginal), landscapeImagePhone: nil, style: .Plain, target: self, action: #selector(clearShoppingCar))
        navigationController!.interactivePopGestureRecognizer!.enabled = false;
    }

    func initialTableView() {
        productTableView = XDTableView(frame: CGRectZero, style: .Plain)
        productTableView.delegate = self
        productTableView.dataSource = self
        view.addSubview(productTableView)
        
        productTableView.snp_makeConstraints { (make) in
            make.top.left.equalTo(view)
            make.width.equalTo(view.width)
            make.height.equalTo(view.height-49)
        }
    }
    
    func initialBottomView() {
        bottomView = ShoppingCarBottomView(frame: CGRectZero, handleAction: { (Void) in
            printLog("goHandle")
        })
        bottomView.shoppingCarVC = self
        view.addSubview(bottomView)
        
        bottomView.snp_makeConstraints { (make) in
            make.left.bottom.equalTo(view)
            make.width.equalTo(view.width)
            make.height.equalTo(49)
        }
    }
    
    func initialEmptyView() {
        emptyView = ShoppingCarEmptyView()
        view.addSubview(emptyView)
        
        emptyView.snp_makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(view)
        }
    }
    
    func initialData() {
        productList = ShoppingCarManager.sharedShoppingCar.getProductList()
    }
    
    //MARK:- Action
    func clearShoppingCar() {
        UIAlertView(title: "提示", message: "是否要清空购物车?", delegate: self, cancelButtonTitle: "取消", otherButtonTitles: "确定").show()
    }

}

extension ShoppingCarViewController: UIAlertViewDelegate {
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if alertView.cancelButtonIndex != buttonIndex {
            productList?.removeAll()
            ShoppingCarManager.sharedShoppingCar.removeAllProducts()
        }
    }
}

extension ShoppingCarViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = productList?.count {return count}
        return 0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let CELLIDENTIFIER = "ProductTableViewCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(CELLIDENTIFIER) as? ProductTableViewCell
        if cell == nil {
            cell = ProductTableViewCell(style: .Default, reuseIdentifier: CELLIDENTIFIER)
        }
        
        let model = productList?[indexPath.row]
        cell?.updateUIWithModel(model)
        
        return cell!
    }
}
