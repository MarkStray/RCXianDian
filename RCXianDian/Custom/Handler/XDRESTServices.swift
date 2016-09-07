//
//  XDRESTServices.swift
//  RCXianDian
//
//  Created by user on 16/7/29.
//  Copyright © 2016年 rrcc. All rights reserved.
//


class XDRESTServices: NSObject {
    
    let server = "http://rest.dev.2b.renrencaichang.com/"
    //let server = "http://rest.2b.renrencaichang.com/"

    var isNeedAuth: Bool
    var userId: String?
    var privateKey: String?
    
    /**
     不需要认证的初始化
     
     - returns: rest请求对象
     */
    override init() {
        isNeedAuth = false
    }
    
    /**
     需要认证的初始化
     
     - parameter uid: 用户标识ID
     - parameter pk:  私钥
     
     - returns: rest请求对象
     */
    init(uid: String?, pk: String?) {
        isNeedAuth = true
        userId = uid
        privateKey = pk
    }
    
    //MARK:- 外部接口
    func get(res: String?, resId: String?, query: [String: String]?, completion:responseCompletionHandle) {
        
        if res == nil {return}
        if res!.isEmpty {return}
        
        var queryStr = res!
        
        if resId != nil {
            queryStr += "/"+resId!+"?"
        } else {
            queryStr += "?"
        }
        
        if query != nil {
            queryStr += toString(query)!
        }
        
        if isNeedAuth {
            queryStr = auth(queryStr, resId: resId, payload: nil)!
        }
            
        self.get(queryStr, completion: completion)
    }
    
    func post(res: String?, resId: String?, query: [String: String]?, post: [String: String]?, completion:responseCompletionHandle) {
        if res == nil {return}
        if res!.isEmpty {return}
        
        var queryStr = res!
        
        if resId != nil {
            queryStr += "/"+resId!+"?"
        } else {
            queryStr += "?"
        }
        
        if query != nil {
            queryStr += toString(query)!
        }
        
        if post == nil {return}
        
        var postParam = [String: String]()
        if isNeedAuth {
            let payload = toString(post)?.base64Encode
            queryStr = auth(queryStr, resId: resId, payload: payload)!
            
            postParam["payload"] = payload
        }

        self.post(queryStr, param: postParam, completion: completion)
    }
    
    func put(res: String?, resId: String?, query: [String: String]?, post: [String: String]?, completion:responseCompletionHandle) {
        if res == nil {return}
        if res!.isEmpty {return}
        
        var queryStr = res!
        
        if resId != nil {
            queryStr += "/"+resId!+"?"
        } else {
            queryStr += "?"
        }
        
        if query != nil {
            queryStr += toString(query)!
        }
        
        if post == nil {return}
        
        var postParam = [String: String]()
        if isNeedAuth {
            let payload = toString(post)?.base64Encode
            queryStr = auth(queryStr, resId: resId, payload: payload)!
            
            postParam["payload"] = payload
        }
        
        self.put(queryStr, param: postParam, completion: completion)
    }
    
    func delete(res: String?, resId: String?, query: [String: String]?, completion:responseCompletionHandle) {
        if res == nil {return}
        if res!.isEmpty {return}
        
        if resId == nil {return}
        if resId!.isEmpty {return}
        
        if !isNeedAuth {return}
        
        var queryStr = res!+"/"+resId!+"?"
        
        if query != nil {
            queryStr += toString(query)!
        }
        
        queryStr = auth(queryStr, resId: resId, payload: nil)!
        
        self.delete(queryStr, completion: completion)
    }

    //MARK:- 私有方法
    private func get(query: String?, completion:responseCompletionHandle) {
        let url = server + query!
        XDHTTPServices.requestUrl(.GET, urlStr: url, completion: completion)
    }
    
    private func post(query: String?, param: [String: String]?, completion:responseCompletionHandle) {
        let url = server + query!
        XDHTTPServices.requestUrl(.POST, urlStr: url, param: param, completion: completion)
    }
    
    private func put(query: String?, param: [String: String]?, completion:responseCompletionHandle) {
        let url = server + query!
        XDHTTPServices.requestUrl(.PUT, urlStr: url, param: param, completion: completion)
    }
    
    //method "delete" with obj-c selector delete conflicts with method
    //"delete" form superclass NSObject with the same obj-c selector
    // obj-c 不支持方法重载
    // 1 重命名
    // 2 不去继承NSObject
    // 3 + private 不会暴露给 obj-c
    // 4 @objc(methodNew:)
    // 5 @nonobjc
    private func delete(query: String?, completion:responseCompletionHandle) {
        let url = server + query!
        XDHTTPServices.requestUrl(.DELETE, urlStr: url, completion: completion)
    }
    
    private func toString(param: [String: String]?) -> String? {
        if param == nil {
            return ""
        }
        if param!.count == 0 {
            return ""
        }
        var result = ""
        for (k,v) in param! {
            result += "&"+k+"="+v
        }
        
        return result
    }
    
    private func auth(res: String?, resId: String?, payload: String?) -> String? {
        
        var resource = res
        var resourceID: String?
        var payloadStr: String?
        
        if (userId!.isEmpty || privateKey!.isEmpty) {
            return nil
        }
        
        let timeStamp = String(Int(NSDate().timeIntervalSince1970))
        
        if (resId == nil) {
            resourceID = ""
        } else {
            resourceID = resId
        }
        
        if (payload == nil) {
            payloadStr = ""
        } else {
            payloadStr = payload
        }
        
        let publicKey = (privateKey!+resourceID!+timeStamp+payloadStr!).md5
        
        resource = resource!+"&uid="+userId!+"&t="+timeStamp+"&k="+publicKey
        
        return resource
    }
    
}



