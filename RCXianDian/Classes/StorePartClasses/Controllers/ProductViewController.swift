//
//  ProductViewController.swift
//  RCXianDian
//
//  Created by user on 16/8/3.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class ProductViewController: XDBaseViewController {

    var productTableView: XDTableView!
    
    var productDictList: [String: [ProductModel]]? {
        didSet {
            productTableView.reloadData()
        }
    }
    
    var categoryList = [String]()//brandid list
    var categoryDict = [String: String?]()//brandid:brandname
    
    var productCallInfo: ProductCallInfo? {
        didSet {
            productDictList = ProductCallInfo.filterCategoryMatchProducts(productCallInfo?.CallInfo, withCategoryList: categoryList)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialCategoryTableView()
    }

    func initialCategoryTableView() {
        productTableView = XDTableView(frame: CGRectZero, style: .Plain)
        productTableView.delegate = self
        productTableView.dataSource = self
        productTableView.backgroundColor = UIColor.whiteColor()
    }

}

extension ProductViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return categoryList.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
        //return productDictList![categoryList[section]]!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let CELLIDENTIFIER = "ProductTableViewCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(CELLIDENTIFIER) as? ProductTableViewCell
        if cell == nil {
            cell = ProductTableViewCell(style: .Default, reuseIdentifier: CELLIDENTIFIER)
        }
        
        return cell!
    }
}



