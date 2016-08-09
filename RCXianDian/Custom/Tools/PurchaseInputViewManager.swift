//
//  PurchaseInputViewManager.swift
//  RCXianDian
//
//  Created by user on 16/8/8.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class PurchaseInputViewManager: NSObject {
    
    // PurchaseInputViewManager单例
    private static let instance = PurchaseInputViewManager()
    class var sharedPurchaseInputViewManager: PurchaseInputViewManager {
        return instance
    }

}
