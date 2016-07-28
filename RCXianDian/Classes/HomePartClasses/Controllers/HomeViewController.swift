//
//  HomeViewController.swift
//  RCXianDian
//
//  Created by user on 16/7/15.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit


class HomeViewController: XDBaseViewController {

    var homeTableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomeCallInfo.requestHomeData { (finished, data) in
            if finished {
                print("info --> \(data!.toDictionary())")
            } else {
                print("网络错误")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}


