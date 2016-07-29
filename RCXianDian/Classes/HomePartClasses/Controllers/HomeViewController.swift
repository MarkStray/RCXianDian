//
//  HomeViewController.swift
//  RCXianDian
//
//  Created by user on 16/7/15.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit


class HomeViewController: XDBaseViewController {

    var homeTableView = UITableView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-49), style: UITableViewStyle.Plain)
    
    var homeCallInfoModel: HomeCallInfoModel?
    
    var homeDataSource = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
        self.view.addSubview(homeTableView)
        
        
        HomeCallInfo.requestHomeData { (homeCallInfo) in
            //print("info --> \(homeCallInfo!.toDictionary())")
            //print("info --> \(homeCallInfo)")

            self.homeCallInfoModel = homeCallInfo?.CallInfo
            
            print("--- \(homeCallInfo?.CallInfo?.advertise[0].title)")
            
            self.homeDataSource = (self.homeCallInfoModel?.presell)!
            
            self.homeTableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeDataSource.count
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let reuseID = "SHOPTABLEVIEWCELLID"
        var cell = tableView.dequeueReusableCellWithIdentifier(reuseID) as? ShopTableViewCell
        
        if cell == nil {
            cell = ShopTableViewCell(style: .Default, reuseIdentifier: reuseID)
        }
        
//        let presellModel = (homeDataSource as NSArray).objectAtIndex(indexPath.row) as! PresellModel
//        cell?.updateUIWithModel(presellModel)
        
        return cell!
    }
}


