//
//  XDHTTPServices.swift
//  RCXianDian
//
//  Created by user on 16/7/26.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import Alamofire

class XDHTTPServices {
    
    //'Method' is ambiguous for type lookup in this context 
    // 和runtime Method冲突 需要加命名空间 Alamofire
    
    class func requestUrl(method: Alamofire.Method, urlStr: URLStringConvertible, param: [String: AnyObject]? = nil, completion:(finished: Bool, response: AnyObject?) -> Void) {
        
        Alamofire.request(method, urlStr, parameters: param).responseJSON(completionHandler: { (response) in
            
            //print(response.request)  // original URL request
            //print(">>> 1")
            //print(response.response) // URL response
            //print(">>> 2")
            //print(response.data)     // server data
            //print(">>> 3")
            //print(response.result)   // result of response serialization
            //print(">>> 4")
            //print(response.result.value)   // result of response serialization JSON

            if let JSON = response.result.value {
                completion(finished: true, response: JSON)
            } else {
                completion(finished: false, response:nil)
            }
        })
    }
    
    
}