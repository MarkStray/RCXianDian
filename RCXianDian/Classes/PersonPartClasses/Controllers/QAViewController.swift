//
//  QAViewController.swift
//  RCXianDian
//
//  Created by yliu on 16/8/20.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class QAViewController: XDBaseViewController {
    
    //MARK:- Instance Varible
    var qaDataSource = [[String: String]]() {
        didSet {
            qaTableView.reloadData()
        }
    }
    var qaTableView: XDTableView!
    
    let offScreenCell = QATableViewCell()
    
    //MARK:- Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "常见问题"
        
        initialQATableView()
        
        requestQAData()
        
    }

    //MARK:- UI Initial
    func initialQATableView() {
        qaTableView = XDTableView(frame: CGRectMake(0, 0, SCREEN_WIDTH, view.height), style: .Grouped)
        qaTableView.delegate = self
        qaTableView.dataSource = self
        /**
         * if set like this, using autolayout don't need call (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
         */
        //qaTableView.rowHeight = UITableViewAutomaticDimension;
        //qaTableView.estimatedRowHeight = 80.f;
        
        //使用本例所示方法 下面这行代码可加可不加 (最好加上 提升性能)
        //qaTableView.estimatedRowHeight = UITableViewAutomaticDimension
        
        view.addSubview(qaTableView)
        
        
    }
    
    //MARK:- Data Request
    func requestQAData() {
        XDRESTServices().get("QAndA", resId: nil, query: nil) { (responseJson, error) in
            printLog(responseJson)
            
            let resJson = responseJson as! [String: NSObject]
            guard resJson["Success"] == 1 else {
                //TODO:
                return
            }
            
            self.qaDataSource = resJson["CallInfo"] as! [[String: String]]
        }
    }
    
    //MARK:- Action
    
}

//MARK:- Extension

extension QAViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return qaDataSource.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.min
    }

    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let qaDict = qaDataSource[indexPath.section]
        let qString = qaDict["q"]
        let aString = qaDict["a"]
        offScreenCell.qLabel.text = qString
        offScreenCell.aLabel.text = aString

        /**hard coding need following code but nib not */
        
        offScreenCell.setNeedsUpdateConstraints()
        offScreenCell.updateConstraintsIfNeeded()

        // 触发cell的布局过程，会基于布局约束计算所有视图的frame。
        // （注意，你必须要在cell的-[layoutSubviews]方法中给多行的UILabel设置好preferredMaxLayoutWidth值；
        // 或者在下面2行代码前手动设置！）

        offScreenCell.qLabel.preferredMaxLayoutWidth = CGFloat(SCREEN_WIDTH-16*2-32)
        offScreenCell.aLabel.preferredMaxLayoutWidth = CGFloat(SCREEN_WIDTH-16*2-32)
        
        // Do the layout pass on the cell, which will calculate the frames for all the views based on the constraints
        // (Note that the preferredMaxLayoutWidth is set on multi-line UILabels inside the -[layoutSubviews] method
        // in the UITableViewCell subclass
        
        /** refresh layout */
        offScreenCell.setNeedsLayout()
        offScreenCell.layoutIfNeeded()
        
        // Get the actual height required for the cell
        let height = offScreenCell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height
        
        return height + 8*2 + 10 + 1
        
        //let qheight = height(17, str: qaDict["q"]!, width: SCREEN_WIDTH-16*2-24-8, fSize: 14)
        //let aheight = height(17, str: qaDict["a"]!, width: SCREEN_WIDTH-16*2-24-8, fSize: 14)
        //return qheight + aheight + 8*2 + 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let CELLIDENTIFIER = "QATableViewCell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(CELLIDENTIFIER) as? QATableViewCell

        if cell == nil {
            cell = QATableViewCell(style: .Default, reuseIdentifier: CELLIDENTIFIER)
        }
        
        let qaDict = qaDataSource[indexPath.section]
        let qString = qaDict["q"]
        let aString = qaDict["a"]
        cell?.qLabel.text = qString
        cell?.aLabel.text = aString
        
        return cell!
    }
    
}