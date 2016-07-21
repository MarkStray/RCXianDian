//
//  ParsePlistUtil.swift
//  RCXianDian
//
//  Created by user on 16/7/21.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class ParsePlistUtil: NSObject {
    
    // OC 集合类型风格
//    class func getTabBarModelList() -> NSMutableArray {
//        
//        let path = NSBundle.mainBundle().pathForResource("TabBarModel", ofType: "plist")!
//        
//        let modelDicList = NSArray(contentsOfFile: path)!
//        
//        let tabBarModelList =  NSMutableArray()
//        
//        for modelDic in modelDicList as! [NSDictionary] {
//            let model = XDTabBarModel()
//            
//            model.className = modelDic.objectForKey("class_name") as? String
//            model.title = modelDic.objectForKey("title") as? String
//            model.image = modelDic.objectForKey("image") as? String
//            model.imageSelected = modelDic.objectForKey("imageSelected") as? String
//            
//            tabBarModelList.addObject(model)
//        }
//        
//        return tabBarModelList
//    }

    // Swift 集合类型风格
    class func getTabBarModelList() -> [XDTabBarModel] {
        
        let path: String = NSBundle.mainBundle().pathForResource("TabBarModel", ofType: "plist")!
        
        let modelDicList: [[String : String]] = NSArray(contentsOfFile: path)! as! [[String : String]]
        
        var tabBarModelList: [XDTabBarModel] =  [XDTabBarModel]()
        
        for modelDic: [String : String] in modelDicList {
            let model = XDTabBarModel()
            
            model.className = modelDic["class_name"]
            model.title = modelDic["title"]
            model.image = modelDic["image"]
            model.imageSelected = modelDic["imageSelected"]
            
            tabBarModelList.append(model)
        }
        
        return tabBarModelList
    }
    
}
