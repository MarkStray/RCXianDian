//
//  ShoppingCarManager.swift
//  RCXianDian
//
//  Created by user on 16/8/8.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class ShoppingCarManager: NSObject {
    
    // ShoppingCar单例
    private static let instance = ShoppingCarManager()
    class var sharedShoppingCar: ShoppingCarManager {
        return instance
    }
    
    //MARK:- 私有存储字典
    private var purchaseModelDict = NSMutableDictionary()
    private var purchaseTotalPriceDict = NSMutableDictionary()
    
    private var allPrice = Float(0)
    
    /******************/
    internal var merchantShop: PresellModel? //当前店铺
    
    //MARK:- 开放API
    
    ///是否满足起订价
    func canGoHandle() -> (Bool, Float) {
        if allPrice >= Float((merchantShop?.min_order)!)! {return (true, Float(0))}
        return (false, Float((merchantShop?.min_order)!)! - allPrice)
    }
    
    ///购物车产品总价
    func getTotalPrice() -> Float {
        return allPrice
    }

    ///购物车产品列表
    func getProductList() -> [ProductModel] {
        return purchaseModelDict.allValues as! [ProductModel]
    }
    
    ///购物车订单字符串
    func getOrderListStr() -> String {
        var tempStr = (merchantShop?.id)! + ":"
        
        for model in getProductList() {
            tempStr += model.skuid! + "," + String(model.count) + ";"
        }
        
        tempStr.removeAtIndex(tempStr.endIndex)
        
        return tempStr
    }
    
    ///清空购物车
    func removeAllProducts() {
        purchaseModelDict.removeAllObjects()
        purchaseTotalPriceDict.removeAllObjects()
        
        NSNotificationCenter.defaultCenter().postNotificationName(XDShoppingCarChangedNotification, object: nil, userInfo: ["badge": 0, "price": Float(0)])
    }

    
    ///更新购物车
    func updateCarProductsModel(model: ProductModel) -> Bool {
        
        let key = model.skuid!
        
        // 设置购物车最大容量
        let allKeys = purchaseModelDict.allKeys as NSArray
        
        if !(allKeys.containsObject(key)) {
            let maxCount = 999
            if allKeys.count >= maxCount {
                showAlertView("亲! 您的购物车已塞满(当前物品999件),结算后才能再次添加!")
                return false
            }
        }
        
        let tempPrice = (model.onsale==1 ?model.saleprice :model.price)! as NSString
        let price = tempPrice.floatValue * Float(model.count)
        
        // 存放购物车
        purchaseModelDict.setValue(model, forKey: key)
        purchaseTotalPriceDict.setValue(price, forKey: key)
        
        var totalPrice = Float(0)
        var badgeNumber = 0
        
        // 计算总价及数量
        for (_, v) in purchaseTotalPriceDict {
            let aPrice = v as! Float
            if aPrice == 0 {
                purchaseModelDict.removeObjectForKey(key)
                purchaseTotalPriceDict.removeObjectForKey(key)
            } else {
                badgeNumber += 1
                totalPrice += aPrice
            }
        }
        
        allPrice = totalPrice
        
        // POST NOTIFICATION
        NSNotificationCenter.defaultCenter().postNotificationName(XDShoppingCarChangedNotification, object: nil, userInfo: ["badge": badgeNumber, "price": totalPrice])
        
        return true
    }

}
