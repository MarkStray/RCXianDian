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
        navigationController?.navigationBarHidden = true
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
            cell?.selectionStyle = .None
        }
        
        let model = personData[indexPath.section][indexPath.row]
        
        cell?.updateUIWithModel(model)
        
        return cell!
    }

}


