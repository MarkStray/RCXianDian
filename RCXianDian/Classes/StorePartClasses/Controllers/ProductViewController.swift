//
//  ProductViewController.swift
//  RCXianDian
//
//  Created by user on 16/8/3.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class ProductViewController: XDBaseViewController {
    
    //MARK:- Instance Varible
    
    private var lastOffsetY  = CGFloat(0)
    private var isScrollDown = false
    weak var delegate: ProductViewControllerDelegate?
    
    var categortSelectedIndexPath: NSIndexPath? {
        didSet {
            productTableView?.selectRowAtIndexPath(NSIndexPath(forRow: 0, inSection: categortSelectedIndexPath!.row), animated: true, scrollPosition: .Top)
        }
    }

    
    var productTableView: XDTableView!
    private let headViewIdentifier = "ProductHeadView"

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
            printLog(productDictList)
        }
    }

    //MARK:- Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialView()
        initialCategoryTableView()
    }
    
    //MARK:- UI Initial
    func initialView() {
        view = UIView(frame: CGRectMake(SCREEN_WIDTH/4, 40, SCREEN_WIDTH/4*3, SCREEN_HEIGHT-64-40))
    }
    
    func initialCategoryTableView() {
        productTableView = XDTableView(frame: CGRectZero, style: .Plain)
        productTableView.delegate = self
        productTableView.dataSource = self
        productTableView.backgroundColor = UIColor.whiteColor()
        productTableView.tableFooterView = ProductTableFooterView()
        productTableView.registerClass(ProductHeadView.self, forHeaderFooterViewReuseIdentifier: headViewIdentifier)
        view.addSubview(productTableView)
    }
    
    //MARK:- Layout
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        productTableView.snp_makeConstraints { (make) in
            make.top.left.right.equalTo(view)
            make.height.equalTo(SCREEN_HEIGHT-64-49-40)
        }
    }

    //MARK:- Data Request

    //MARK:- Action

}

//MARK:- Extension

//MARK:- UITableView delegate & dataSource

extension ProductViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return categoryList.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productDictList![categoryList[section]]!.count
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
        
        let model = productDictList![categoryList[indexPath.section]]![indexPath.row]
        cell?.updateUIWithModel(model)
        
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterViewWithIdentifier(headViewIdentifier) as! ProductHeadView
        headerView.titleLabel.text = categoryDict[categoryList[section]]!
        return headerView
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //TODO:
    }
    
    //MARK:- Displaying
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if !isScrollDown {
            delegate?.willDisplayHeaderView!(section)
        }
    }
    
    func tableView(tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        if isScrollDown {
            delegate?.didEndDisplayingHeaderView!(section)
        }
    }
}

//MARK:- UIScrollViewDelegate
extension ProductViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(scrollView: UIScrollView) {
        isScrollDown = lastOffsetY < scrollView.contentOffset.y
        lastOffsetY = scrollView.contentOffset.y
    }
}

//MARK:- Displaying Protocol
@objc protocol ProductViewControllerDelegate: NSObjectProtocol {
    
    optional func willDisplayHeaderView(section: Int)
    optional func didEndDisplayingHeaderView(section: Int)
}




