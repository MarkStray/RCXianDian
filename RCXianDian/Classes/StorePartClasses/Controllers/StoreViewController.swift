//
//  StoreViewController.swift
//  RCXianDian
//
//  Created by user on 16/7/20.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class StoreViewController: XDBaseViewController {
    
    var headerSearchBar: UISearchBar!

    var categoryTableView: XDTableView!
    
    var productVC = ProductViewController()
    
    var categoryList = [String]()//brandid list
    var categoryDict = [String: String?]()//brandid:brandname

    var productCallInfo: ProductCallInfo? {
        didSet {
            
            for products in (productCallInfo?.CallInfo)! {
                
                categoryDict[products.brandid!] =  products.brandname
            }
            
            categoryList = Array(categoryDict.keys)

            categoryTableView.reloadData()

            productVC.categoryDict = categoryDict
            productVC.categoryList = categoryList
            productVC.productCallInfo = productCallInfo
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSearchView()
        
        initialCategoryTableView()

        initialProductTableView()
        
        requestStoreData()
    }
    
    func initialSearchView() {
        
    }
    
    func initialCategoryTableView() {
        
        categoryTableView = XDTableView(frame: CGRectZero, style: .Plain)
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        view.addSubview(categoryTableView)
        
        categoryTableView.snp_makeConstraints { (make) in
            make.top.left.equalTo(view)
            make.width.equalTo(SCREEN_WIDTH/4)
            make.height.equalTo(SCREEN_HEIGHT-64-49)
        }
    }
    
    func initialProductTableView() {
        productVC.view.hidden = true
        view.addSubview(productVC.productTableView)

        productVC.productTableView.snp_makeConstraints { (make) in
            make.top.right.equalTo(view)
            make.width.equalTo(SCREEN_WIDTH/4*3)
            make.height.equalTo(SCREEN_HEIGHT-64-49)
        }
    }
    
    func requestStoreData() {
        ProductCallInfo.requestStoreData { (productCallInfo) in
            printLog(productCallInfo!.toJSON())
            
            self.productCallInfo = productCallInfo
        }
    }

    
}


extension StoreViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let CELLIDENTIFIER = "CategoryTableViewCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(CELLIDENTIFIER) as? CategoryTableViewCell
        if cell == nil {
            cell = CategoryTableViewCell(style: .Default, reuseIdentifier: CELLIDENTIFIER)
            
            let selImgView = UIImageView(frame: cell!.bounds)
            selImgView.image = UIImage(named: "cellSelected")
            
            cell?.selectedBackgroundView = selImgView
        }
        
        cell?.titleLabel.text = categoryDict[categoryList[indexPath.row]]!
        
        return cell!
    }
}



