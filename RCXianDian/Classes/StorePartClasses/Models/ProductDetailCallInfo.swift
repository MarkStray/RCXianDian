//
//  ProductDetailCallInfo.swift
//  RCXianDian
//
//  Created by user on 16/8/12.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit
import ObjectMapper

class ProductDetailCallInfo: XDBaseModel {

    var CallInfo: ProductModel?;
    
    class func requestProductDetailDataWithProductId(productId: String?, completion:((productDetailCallInfo: ProductDetailCallInfo?) -> Void)) {
        // resId "19609" "13878"
        XDRESTServices().get("UserProductDetails", resId: productId, query: nil) { (responseJson, error) in
            let productDetailModel = Mapper<ProductDetailCallInfo>().map(responseJson)
            completion(productDetailCallInfo: productDetailModel)
        }
    }
    
    override func mapping(map: Map) {CallInfo <- map["CallInfo"]}
    required init?(_ map: Map) {super.init(map)}
}