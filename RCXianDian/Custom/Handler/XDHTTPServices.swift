//
//  XDHTTPServices.swift
//  RCXianDian
//
//  Created by user on 16/7/26.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import Alamofire

//MARK: 第三方网络框架的包装类 后续如果需要替换网络框架 直接在该类中替换

typealias responseCompletionHandle = (responseJson: AnyObject?, error: NSError?) -> Void

class XDHTTPServices: NSObject {
    
    //'Method' is ambiguous for type lookup in this context 
    // 和runtime Method冲突 需要加命名空间 Alamofire
    
    //返回原生的数据
    class func requestUrl(method: Alamofire.Method, urlStr: URLStringConvertible, param: [String: AnyObject]? = nil, completion: responseCompletionHandle) {
        
        print("-----urlStr -->\n \"\(urlStr)\"")
        print("-----param -->\n \"\(param)\"")

        Alamofire.request(method, urlStr, parameters: param).responseJSON(completionHandler: { (response) in
            completion(responseJson: response.result.value, error: response.result.error)
        })
    }
    
    //import AlamofireObjectMapper
    /*
    class func testAlamofireObjectMapper() {
        Alamofire.request(.GET, "http://rest.dev.2b.renrencaichang.com/SiteMarket/43924664").responseObject { (response: Response<HomeCallInfo, NSError>) in
            let homeModel = response.result.value
            print("responseObject \(homeModel?.toJSONString())")
        }
    }*/
    
    // finished 标记是否完成
    //@available(*, deprecated, message="Use requestUrl(method: Alamofire.Method, urlStr: URLStringConvertible, param: [String: AnyObject]? = nil, completion: responseCompletionHandle")

    /*
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
    }*/
    
}