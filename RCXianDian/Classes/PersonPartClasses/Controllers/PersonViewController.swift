//
//  PersonViewController.swift
//  RCXianDian
//
//  Created by user on 16/7/20.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class PersonViewController: XDBaseViewController {
    
    //MARK:- Instance Varible
    var personTableView: XDTableView!
    
    var headerView = PersonHeaderView()
    
    var personData = PersonModel.loadPersonData()
    
    //MARK:- Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialHeaderView();
        initialTableView();
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.showTabBar()
        navigationController?.navigationBarHidden = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBarHidden = false
    }
    
    //MARK:- UI Initial
    func initialHeaderView() -> () {
        view.addSubview(headerView)
        headerView.iconView.iconMobileLabel.text = "1380000000"
        headerView.snp_makeConstraints { (make) in
            make.top.left.right.equalTo(view)
            make.height.equalTo(140)
        }
    }
    
    func initialTableView() -> () {
        personTableView = XDTableView(frame: CGRectZero, style: .Grouped)
        personTableView.delegate = self
        personTableView.dataSource = self
        view.addSubview(personTableView)
        
        personTableView.snp_makeConstraints { (make) in
            make.top.equalTo(headerView.snp_bottom)
            make.left.right.equalTo(view)
            make.height.equalTo(SCREEN_HEIGHT-140-49)
        }
    }
    
    
    //MARK:- Data Request
    


    //MARK:- Action

    
}

//MARK:- Extension

extension PersonViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return personData.count
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.min
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personData[section].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let CELLIDENTIFIER = "PersonTableViewCell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(CELLIDENTIFIER) as? PersonTableViewCell
        
        if cell == nil {
            cell = PersonTableViewCell(style: .Default, reuseIdentifier: CELLIDENTIFIER)
        }
        
        let model = personData[indexPath.section][indexPath.row]
        
        cell?.updateUIWithModel(model)
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                self.navigationController?.pushViewController(OrderListViewController(), animated: true)
            }
            if indexPath.row == 1 {
                self.navigationController?.pushViewController(PurchaseRecordViewController(), animated: true)
            }
        }
        
        if indexPath.section == 1 {
            self.navigationController?.pushViewController(BalanceViewController(), animated: true)
        }
        
        if indexPath.section == 2 {
            if indexPath.row == 0 {
                //TODO: 客服电话
            }
            if indexPath.row == 1 {
                self.navigationController?.pushViewController(QAViewController(), animated: true)
            }
            if indexPath.row == 2 {
                //TODO: 修改密码
            }
        }
        
        if indexPath.section == 3 {
            //TODO: 注销登录
        }
    }
}


