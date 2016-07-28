//
//  HomeCallInfo.swift
//  RCXianDian
//
//  Created by user on 16/7/25.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit
import Alamofire

class HomeCallInfo: XDBaseModel {
    
    var CallInfo: HomeCallInfoModel?;
    
    
    class func requestHomeData(completion:(finished: Bool, data: HomeCallInfo?)-> Void) {
        
        XDHTTPServices.requestUrl(.GET, urlStr: "http://rest.dev.2b.renrencaichang.com/SiteMarket/43924664", param: nil) { (finished, response) in
            
            var homeModel: HomeCallInfo?

            if finished {
                
                do {
                    try homeModel = HomeCallInfo(dictionary:response as! [NSObject : AnyObject])
                } catch let error as NSError {
                    // 捕获数据解析错误
                    print ("Error: \(error.domain)")
                }
            } else {
                homeModel = nil
            }
            
            completion(finished: finished, data: homeModel)
        }
    }

//    override class func keyMapper() -> JSONKeyMapper {
//        
//        var mappingDict = [String: String]()
//        
//        mappingDict["CallInfo"] = "HomeCallInfoModel"
//        
//        return JSONKeyMapper(dictionary: mappingDict)
//    }

//    override class func customClassMapping() -> [String : String]? {
//        var mappingDict = [String: String]()
//        
//        mappingDict["advertise"] = "AdvertiseModel"
//        mappingDict["itemList"] = "ItemModel"
//        mappingDict["presell"] = "PresellModel"
//        mappingDict["shop"] = "ShopModel"
//        mappingDict["hotBrandList"] = "HotBrandModel"
//        return mappingDict
//    }
}

class HomeCallInfoModel: JSONModel {
    
    var advertise: [AdvertiseModel]?
    var itemList: [ItemModel]?
    var presell: [PresellModel]?
    var shop: [ShopModel]?
    var hotBrandList: [HotBrandModel]?
    
    
//    override class func keyMapper() -> JSONKeyMapper {
//        
//        var mappingDict = [String: String]()
//        
//        mappingDict["advertise"] = "AdvertiseModel"
//        mappingDict["itemList"] = "ItemModel"
//        mappingDict["presell"] = "PresellModel"
//        mappingDict["shop"] = "ShopModel"
//        mappingDict["hotBrandList"] = "HotBrandModel"
//        
//        return JSONKeyMapper(dictionary: mappingDict)
//    }
//
}


class AdvertiseModel: JSONModel {
    
    var title: String?

    var url: String?

    var img_url: String?
    
}

class ItemModel: JSONModel {
    
    var id: String?

    var skuid: String?

    var imgurl: String?

    var clientid: String?

    var avgnum: String?

    var price: String?

    var remark: String?

    var onsale: String?

    var spec: String?

    var skuname: String?

    var saleprice: String?

    var ref: Int = 0

    var supplierid: Int = 0

    var avgweight: String?
    
}

class PresellModel: JSONModel {
    
    var payonline: String?

    var samedaydelivery: String?

    var payondelivery: String?

    var shop_desc: String?

    var score: Int = 0

    var order_count: String?

    var discount: String?

    var contact: String?

    var onsale: Int = 0

    var type: String?

    var free_delivery: String?

    var delivery_time: String?

    var id: String?

    var isopen: String?

    var banner: String?

    var min_order: String?

    var logo: String?

    var delivery_cost: String?

    var discount_limit: String?

    var gift_limit: String?

    var shop_name: String?

    var gift: String?
    
}

class ShopModel: JSONModel {
    
}

class HotBrandModel: JSONModel {
    
    var id: String?

    var icon: String?

    var title: String?
    
}
