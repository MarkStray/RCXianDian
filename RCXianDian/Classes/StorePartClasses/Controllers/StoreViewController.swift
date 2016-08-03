//
//  StoreViewController.swift
//  RCXianDian
//
//  Created by user on 16/7/20.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class StoreViewController: XDBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProductCallInfo.requestStoreData { (productCallInfo) in
            print("info --> \(productCallInfo!.toJSONString())")

        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
