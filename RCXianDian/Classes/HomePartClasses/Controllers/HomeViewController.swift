//
//  HomeViewController.swift
//  RCXianDian
//
//  Created by user on 16/7/15.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class HomeViewController: XDBaseViewController {

    let cellHeight = CGFloat(75);
    
    var homeTableView = UITableView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-49), style: UITableViewStyle.Plain)
    
    var adView = XDBaseADView(frame: CGRectMake(0, 0, SCREEN_WIDTH, 120))
    
    var homeCallInfoModel: HomeCallInfoModel?
    
    var homeDataSource = [PresellModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
        adView.delegate = self
        homeTableView.tableHeaderView = adView
        homeTableView.tableFooterView = UIView()
        self.view.addSubview(homeTableView)
        
        
        
        HomeCallInfo.requestHomeData { (homeCallInfo) in
            print("info --> \(homeCallInfo!.toJSONString())")

            self.homeCallInfoModel = homeCallInfo?.CallInfo
            
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK:- BaseADViewdelegate
extension HomeViewController: BaseADViewdelegate {
    func BaseADViewClickIndex(index: NSInteger) {
        print("index \(index)")
    }
}

//MARK:- UITableView delegate & dataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeDataSource.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return cellHeight;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let reuseID = "SHOPTABLEVIEWCELLID"
        var cell = tableView.dequeueReusableCellWithIdentifier(reuseID) as? ShopTableViewCell
        
        if cell == nil {
            cell = ShopTableViewCell(style: .Default, reuseIdentifier: reuseID)
            cell?.height = cellHeight
        }
        
        let presellModel = homeDataSource[indexPath.row]
        cell?.updateUIWithModel(presellModel)
        
        return cell!
    }
}



