//
//  HomeViewController.swift
//  RCXianDian
//
//  Created by user on 16/7/15.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class HomeViewController: XDBaseViewController {
    
    //MARK:- Instance Varible
    var homeTableView: XDTableView!
    
    var adView = XDBaseADView(frame: CGRectMake(0, 0, SCREEN_WIDTH, 120))
    
    var homeCallInfoModel: HomeCallInfoModel?
    
    var homeDataSource = [PresellModel]()
    
    //MARK:- Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        initialHomeTableView()

        requestHomeData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.showTabBar()
    }
    
    //MARK:- UI Initial
    func initialHomeTableView() {
        homeTableView = XDTableView(frame: CGRectZero, style: .Grouped)
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        adView.delegate = self
        homeTableView.tableHeaderView = adView
        homeTableView.tableFooterView = UIView()
        view.backgroundColor = UIColor.redColor()
        view.addSubview(homeTableView)

        homeTableView.snp_makeConstraints { (make) in
            make.top.left.right.equalTo(view)
            make.height.equalTo(SCREEN_HEIGHT-64-49)
        }
    }
    
    //MARK:- Data Request
    func requestHomeData() {
        
        HomeCallInfo.requestHomeData { (homeCallInfo) in
            printLog(homeCallInfo!.toJSON())
            
            self.homeCallInfoModel = homeCallInfo?.CallInfo
            
            /*********************/
            ShoppingCarManager.sharedShoppingCar.merchantShop = self.homeCallInfoModel?.presell?.first
            /*********************/

            let advertiseList = self.homeCallInfoModel?.advertise
            
            let imagesArray = NSMutableArray()
            
            for AdvertiseModel in advertiseList! {
                let imageUrl = AdvertiseModel.img_url!.stringByRemovingPercentEncoding
                imagesArray.addObject(imageUrl!)
            }
            self.adView.initViewWithImageUrls(imagesArray)
            
            self.homeDataSource = (self.homeCallInfoModel?.presell)!
            
            self.homeTableView.reloadData()
        }
    }
    //MARK:- Action

    
}

//MARK:- Extension

//MARK:- BaseADViewdelegate
extension HomeViewController: BaseADViewdelegate {
    func BaseADViewClickIndex(index: NSInteger) {
        printLog("index \(index)")
    }
}

//MARK:- UITableView delegate & dataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeDataSource.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return ShopTableViewCell.cellHeight;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let reuseID = "SHOPTABLEVIEWCELLID"
        var cell = tableView.dequeueReusableCellWithIdentifier(reuseID) as? ShopTableViewCell
        
        if cell == nil {
            cell = ShopTableViewCell(style: .Default, reuseIdentifier: reuseID)
            cell?.height = ShopTableViewCell.cellHeight
        }
        
        let presellModel = homeDataSource[indexPath.row]
        cell?.updateUIWithModel(presellModel)
        
        return cell!
    }
}



