//
//  OrderCallInfo.swift
//  RCXianDian
//
//  Created by user on 16/8/23.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit
import ObjectMapper

class OrderCallInfo: XDBaseModel {
    var CallInfo: [OrderModel]?

    class func requestOrderListData(completion:(orderCallInfo: OrderCallInfo?) -> ()) {
        let player = PlayerModel()
        XDRESTServices(uid: player.userid, pk: player.privateKey).get("UserOrderList", resId: player.userid, query: nil) { (responseJson, error) in
            let orderModel = Mapper<OrderCallInfo>().map(responseJson)
            completion(orderCallInfo: orderModel)
        }
    }
    
    override func mapping(map: Map) {CallInfo <- map["CallInfo"]}
    required init?(_ map: Map) {super.init(map)}
}

class OrderDetailCallInfo: XDBaseModel {
    var CallInfo: OrderModel?
    
    class func requestOrderDetailsData(completion:(orderDetailCallInfo: OrderDetailCallInfo?) -> ()) {
        let player = PlayerModel()
        XDRESTServices(uid: player.userid, pk: player.privateKey).get("UserOrderDetails", resId: "40", query: nil) { (responseJson, error) in
            let orderDetailModel = Mapper<OrderDetailCallInfo>().map(responseJson)
            completion(orderDetailCallInfo: orderDetailModel)
        }
    }
    
    override func mapping(map: Map) {CallInfo <- map["CallInfo"]}
    required init?(_ map: Map) {super.init(map)}
}


class OrderModel: Mappable {
    
    /// 订单
    var has_paid: String?
    var ordercount: String?
    var tolprice: String?
    var status: String?
    var isappraise: String?
    var deliverytime: String?
    var has_dispatched: String?
    var tel: String?
    var delivery_title: String?
    var status_title: String?
    var svtime: String?
    var client_name: String?
    var payment_title: String?
    var contact: String?
    var orderid: String?
    var delivery: String?
    var has_deliveried: String?
    var inserttime: String?
    var payment: String?
    var confirmtime: String?
    var client_id: String?
    var disname: String?
    var payprice: String?
    var price: String?
    var remark: String?
    var dislogo: String?
    var address: String?
    var ordercode: String?
    
    /// 详单
    var order_address: String?
    var sale_channel: String?
    var productDetails: String?
    var voucher: String?
    var id: String?
    var logo: String?
    var order_contact: String?
    var score: String?
    var distributerid: String?
    var clientid: String?
    var order_tel: String?
    var order_domain: String?
    var pushid: String?
    var etime: String?
    var dispatchtime: String?
    var stime: String?
    var gift: String?
    var warsehouse_id: String?
    var clientname: String?
    var voucherid: String?
    var presell_discount: String?
    var siteid: String?
    var custprice: String?
    var updatetime: String?
    var discount: String?
    var userid: String?

    var itemList: [ProductModel]?
    var statusList: [StatusModel]?
    var actionList: [ActionModel]?
    var PromptList: [AnyObject]?

    func mapping(map: Map) {
        has_paid <- map["has_paid"]
        ordercount <- map["ordercount"]
        tolprice <- map["tolprice"]
        status <- map["status"]
        isappraise <- map["isappraise"]
        deliverytime <- map["deliverytime"]
        has_dispatched <- map["has_dispatched"]
        tel <- map["tel"]
        delivery_title <- map["delivery_title"]
        status_title <- map["status_title"]

        payment <- map["payment"]
        inserttime <- map["inserttime"]
        has_deliveried <- map["has_deliveried"]
        delivery <- map["delivery"]
        contact <- map["contact"]
        payment_title <- map["payment_title"]
        client_name <- map["client_name"]
        svtime <- map["svtime"]

        confirmtime <- map["confirmtime"]
        client_id <- map["client_id"]
        payprice <- map["payprice"]
        price <- map["price"]
        remark <- map["remark"]
        dislogo <- map["dislogo"]
        address <- map["address"]
        order_address <- map["order_address"]

        productDetails <- map["productDetails"]
        voucher <- map["voucher"]
        id <- map["id"]
        logo <- map["logo"]
        order_contact <- map["order_contact"]
        score <- map["score"]
        distributerid <- map["distributerid"]
        clientid <- map["clientid"]

        order_tel <- map["order_tel"]
        order_domain <- map["order_domain"]
        pushid <- map["pushid"]
        etime <- map["etime"]
        dispatchtime <- map["dispatchtime"]
        stime <- map["stime"]
        gift <- map["gift"]
        warsehouse_id <- map["warsehouse_id"]
        
        clientname <- map["clientname"]
        voucherid <- map["voucherid"]
        presell_discount <- map["presell_discount"]
        siteid <- map["siteid"]
        custprice <- map["custprice"]
        updatetime <- map["updatetime"]
        discount <- map["discount"]
        userid <- map["userid"]
        
        itemList <- map["itemList"]
        statusList <- map["statusList"]
        actionList <- map["actionList"]
        PromptList <- map["PromptList"]
    }

    required init?(_ map: Map){}
}

class StatusModel: Mappable {
    var title: String?
    var subTitle: String?
    var inserttime: String?
    var img_url: String?
    
    func mapping(map: Map) {
        title <- map["title"]
        subTitle <- map["subTitle"]
        inserttime <- map["inserttime"]
        img_url <- map["img_url"]
    }
    
    required init?(_ map: Map){}
}

class ActionModel: Mappable {
    var title: String?
    var action: String?
    
    func mapping(map: Map) {
        title <- map["title"]
        action <- map["action"]
    }
    
    required init?(_ map: Map){}
}
