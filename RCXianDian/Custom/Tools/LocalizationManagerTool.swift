//
//  LocalizationManagerTool.swift
//  RCXianDian
//
//  Created by user on 16/7/21.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit


class LocalizationManagerTool: NSObject {
    
    //class func setValue<ValueType,KeyType>(value: ValueType, forKey defaultName: KeyType) {
    //}
    
    class func setObject(value: AnyObject?, forKey defaultName: String) {
        NSUserDefaults.standardUserDefaults().setObject(value, forKey:defaultName);
    }
    
    class func objectForKey(defaultName: String) -> AnyObject? {
        return NSUserDefaults.standardUserDefaults().objectForKey(defaultName);
    }
    
    class func setBool(value: Bool, forKey defaultName: String) {
        NSUserDefaults.standardUserDefaults().setBool(value, forKey:defaultName);
    }

    class func boolForKey(defaultName: String) -> Bool {
        return NSUserDefaults.standardUserDefaults().boolForKey(defaultName);
    }
}
