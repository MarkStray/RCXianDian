//
//  HomeCallInfo.swift
//  RCXianDian
//
//  Created by user on 16/7/25.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit
import ObjectMapper

class HomeCallInfo: XDBaseModel {
    
    var CallInfo: HomeCallInfoModel?
    
    
    class func requestHomeData(completion:((homeCallInfo: HomeCallInfo?)-> Void)) {
        
        XDRESTServices().get("SiteMarket", resId: "43924664", query: nil) { (responseJson, error) in
            
//            var homeModel: HomeCallInfo?
//            if error == nil {
//                do {
//                    try homeModel = HomeCallInfo(dictionary:responseJson as! [NSObject : AnyObject])
//                } catch let error as NSError {
//                    // 捕获数据解析错误
//                    print ("Error: \(error.domain)")
//                }
//            } else {
//                homeModel = nil
//            }
            
            let homeModel = Mapper<HomeCallInfo>().map(responseJson)
            completion(homeCallInfo: homeModel)
        }
        
    }
    
    required init?(_ map: Map) {
        super.init(map)
    }
    
    override func mapping(map: Map) {
        CallInfo <- map["CallInfo"]
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


class HomeCallInfoModel: Mappable {
    
    var advertise: [AdvertiseModel]?
    var itemList: [ItemModel]?
    var presell: [PresellModel]?
    var shop: [ShopModel]?
    var hotBrandList: [HotBrandModel]?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        advertise <- map["advertise"]
        itemList <- map["itemList"]
        presell <- map["presell"]
        shop <- map["shop"]
        hotBrandList <- map["hotBrandList"]
    }

}


class AdvertiseModel: Mappable {
    
    var title: String?

    var url: String?

    var img_url: String?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        url <- map["url"]
        img_url <- map["img_url"]
    }
    
}

class ItemModel: Mappable {
    
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
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        skuid <- map["skuid"]
        imgurl <- map["imgurl"]
        clientid <- map["clientid"]
        avgnum <- map["avgnum"]
        price <- map["price"]
        remark <- map["remark"]
        onsale <- map["onsale"]
        spec <- map["spec"]
        skuname <- map["skuname"]
        saleprice <- map["saleprice"]
        ref <- map["ref"]
        supplierid <- map["supplierid"]
        avgweight <- map["avgweight"]
    }

    
}

class PresellModel: Mappable {
    
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
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        payonline <- map["payonline"]
        samedaydelivery <- map["samedaydelivery"]
        payondelivery <- map["payondelivery"]
        shop_desc <- map["shop_desc"]
        score <- map["score"]
        order_count <- map["order_count"]
        discount <- map["discount"]
        contact <- map["contact"]
        onsale <- map["onsale"]
        type <- map["type"]
        free_delivery <- map["free_delivery"]
        delivery_time <- map["delivery_time"]
        id <- map["id"]
        isopen <- map["isopen"]
        banner <- map["banner"]
        min_order <- map["min_order"]
        logo <- map["logo"]
        delivery_cost <- map["delivery_cost"]
        discount_limit <- map["discount_limit"]
        gift_limit <- map["gift_limit"]
        shop_name <- map["shop_name"]
        gift <- map["gift"]
    }
    
}

class ShopModel: Mappable {
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        
    }

}

class HotBrandModel: Mappable {
    
    var id: String?

    var icon: String?

    var title: String?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        icon <- map["icon"]
        title <- map["title"]
    }
}
