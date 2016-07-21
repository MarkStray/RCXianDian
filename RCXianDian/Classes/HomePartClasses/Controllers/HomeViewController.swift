//
//  HomeViewController.swift
//  RCXianDian
//
//  Created by user on 16/7/15.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: XDBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        testNetLib();
        
    }
    
    func testNetLib() {
        
        Alamofire.request(.GET, "https://httpbin.org/get", parameters: ["foo": "bar"])
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        };
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

