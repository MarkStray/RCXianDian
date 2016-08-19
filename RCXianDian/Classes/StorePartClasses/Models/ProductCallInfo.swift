//
//  ProductCallInfo.swift
//  RCXianDian
//
//  Created by user on 16/8/3.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit
import ObjectMapper

class ProductCallInfo: XDBaseModel {
    var CallInfo: [ProductModel]?;

    class func requestStoreData(completion:((productCallInfo: ProductCallInfo?) -> Void)) {
        
        XDRESTServices().get("UserShopProductList", resId: nil, query: ["sid": "10032"]) { (responseJson, error) in
            let productModel = Mapper<ProductCallInfo>().map(responseJson)
            completion(productCallInfo: productModel)
        }
    }
    
    /// 产品分类
    class func filterCategoryMatchProducts(productCallInfo: [ProductModel]?, withCategoryList: [String]) -> [String: [ProductModel]]? {
        var temDictList = [String: [ProductModel]]()
        
        for brandid in withCategoryList {
            
            var temList = temDictList[brandid]
            if temList == nil {
                temList = [ProductModel]()
            }
            
            for product in productCallInfo! {
                if product.brandid == brandid {
                    temList!.append(product)
                }
            }

            printLog("brandid: \(brandid), list: \(temList)")

            //TODO: update form shopping car
            
            temDictList[brandid] = temList
        }
        return temDictList
    }
    
    override func mapping(map: Map) {CallInfo <- map["CallInfo"]}
    required init?(_ map: Map) {super.init(map)}
}

class ProductModel: Mappable {
    
    //产品模型辅助属性
    var count = 0
    
    var avgprice: Double = 0
    var brandid: String?
    var spec: String?
    var firstcode: String?
    var childbrandid: String?
    var skuname: String?
    var channelid: String?
    var imgurl: String?
    var avgweight: String?
    var onsale: Int = 0
    var saleprice: String?
    var avgnum: String?
    var salestart: String?
    var skuid: String?
    var childbrandname: String?
    var id: String?
    var saleamount: String?
    var price: String?
    var remark: String?
    var brandname: String?
    var saleexpired: String?
    
    var imageList: [ImageModel]?

    func mapping(map: Map) {
        id <- map["id"]
        skuid <- map["skuid"]
        skuname <- map["skuname"]
        price <- map["price"]
        brandid <- map["brandid"]
        brandname <- map["brandname"]
        channelid <- map["channelid"]
        childbrandid <- map["childbrandid"]
        childbrandname <- map["childbrandname"]
        avgweight <- map["avgweight"]
        avgnum <- map["avgnum"]
        avgprice <- map["avgprice"]
        spec <- map["spec"]
        remark <- map["remark"]
        imgurl <- map["imgurl"]
        firstcode <- map["firstcode"]
        onsale <- map["onsale"]
        saleprice <- map["saleprice"]
        saleamount <- map["saleamount"]
        salestart <- map["salestart"]
        saleexpired <- map["saleexpired"]
        
        imageList <- map["imageList"]
    }
    
    required init?(_ map: Map){}
}

class ImageModel: Mappable {
    
    var id: String?
    var imgurl: String?
    var index: String?
    
    func mapping(map: Map) {
        id <- map["id"]
        imgurl <- map["imgurl"]
        index <- map["index"]
    }
    
    required init?(_ map: Map){}
}

