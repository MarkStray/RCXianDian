//
//  StoreViewController.swift
//  RCXianDian
//
//  Created by user on 16/7/20.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class StoreViewController: XDBaseViewController {
    
    //MARK:- Instance Varible
    var headerSearchView: StoreSearchView!

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
    
    //MARK:- Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSearchView()
        
        initialCategoryTableView()

        initialProductTableView()
        
        requestStoreData()
    }
    
    //MARK:- UI Initial
    func initialSearchView() {
        headerSearchView = StoreSearchView(frame: CGRectZero, searchViewAction: {
            printLog("---header click")
        })
        
        view.addSubview(headerSearchView)
    }
    
    func initialCategoryTableView() {
        
        categoryTableView = XDTableView(frame: CGRectZero, style: .Plain)
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        view.addSubview(categoryTableView)
    }
    
    func initialProductTableView() {
        productVC.delegate = self
        view.addSubview(productVC.view)
        addChildViewController(productVC)
    }
    
    //MARK:- Layout
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        headerSearchView.snp_makeConstraints { (make) in
            make.top.left.right.equalTo(view)
            make.height.equalTo(40)
        }
        
        categoryTableView.snp_makeConstraints { (make) in
            make.top.equalTo(headerSearchView.snp_bottom)
            make.left.equalTo(view)
            make.width.equalTo(SCREEN_WIDTH/4)
            make.height.equalTo(SCREEN_HEIGHT-64-49-40)
        }
    }

    
    //MARK:- Data Request
    func requestStoreData() {
        ProductCallInfo.requestStoreData { (productCallInfo) in
            printLog(productCallInfo!.toJSON())
            
            self.productCallInfo = productCallInfo
        }
    }
    //MARK:- Action
    
}

//MARK:- Extension

//MARK:- UITableView delegate & dataSource
extension StoreViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let CELLIDENTIFIER = "CategoryTableViewCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(CELLIDENTIFIER) as? CategoryTableViewCell
        if cell == nil {
            cell = CategoryTableViewCell(style: .Default, reuseIdentifier: CELLIDENTIFIER)
            cell?.selectionStyle = .Default
        }
        
        cell?.titleLabel.text = categoryDict[categoryList[indexPath.row]]!
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        productVC.categortSelectedIndexPath = indexPath
    }
}

//MARK:- ProductViewControllerDelegate
extension StoreViewController: ProductViewControllerDelegate {
    
    func willDisplayHeaderView(section: Int) {
        categoryTableView.selectRowAtIndexPath(NSIndexPath(forRow: section, inSection: 0), animated: true, scrollPosition: UITableViewScrollPosition.Middle)
    }

    func didEndDisplayingHeaderView(section: Int) {
        categoryTableView.selectRowAtIndexPath(NSIndexPath(forRow: section + 1, inSection: 0), animated: true, scrollPosition: UITableViewScrollPosition.Middle)
    }
    
}

