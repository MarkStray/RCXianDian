//
//  XDBaseModel.swift
//  RCXianDian
//
//  Created by user on 16/7/16.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit
import ObjectMapper


////MARK:- 字典合并拓展
//extension Dictionary {
//    //  将字典合并到当前字典
//    mutating func merge<K, V>(dict: [K: V]) {
//        for (k, v) in dict {
//            self.updateValue(v as! Value, forKey: k as! Key)
//        }
//    }
//}
//
//// 模型缓冲，[类名: 模型信息字典]
//private var modelCache = [String: [String: String]]()
//
////MARK:- 基对象
//class XDBaseModel: NSObject {
//    
//    var Success: AnyObject?;
//    var ErrorCode: AnyObject?;
//    var ErrorMsg: String?;
//    var CallInfo: AnyObject?;
//
//    // 自定义 mapping for key
//    class func customClassMapping() -> [String: String]? {
//        // 子类重写 自定义映射key
//        return [:]
//    }
//
//}

////MARK:- 继承自JSONModel
//class XDBaseModel: JSONModel {
//
//    var Success = -999;
//    var ErrorCode = -999;
//    var ErrorMsg: String?;
//}

//MARK:- 使用AlamofireObjectMapper 需要实现Mappable协议
class XDBaseModel: Mappable {
    
    var Success = -999;
    var ErrorCode = -999;
    var ErrorMsg: String?;
    
    func mapping(map: Map) {
        Success <- map["Success"]
        ErrorCode <- map["ErrorCode"]
        ErrorMsg <- map["ErrorMsg"]
    }
    
    required init?(_ map: Map) {}
}


//
////MARK:- 实例化对象
//extension XDBaseModel {
//    /**
//     字典转模型
//     
//     - parameter dict: 数据字典
//     - parameter cls:  模型类
//     
//     - returns: 模型对象
//     */
//    func objectWithDictionary(dict: NSDictionary, cls: AnyClass) -> AnyObject? {
//        if dict == NSNull() {
//            return nil
//        }
//        
//        if !(dict.isKindOfClass(NSDictionary.self)) {
//            return nil
//        }
//        
//        // 动态获取命名空间
//        let ns = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
//        
//        // 实例化对象
//        let obj = (cls as! NSObject.Type).init()
//        
//        // 模型信息
//        let infoDict = getWholeModelInfo(cls)
//        
//        // 遍历模型字典
//        for (k, v) in infoDict {
//            
//            if let value: AnyObject? = dict[k] {
//                
//                if value == nil {continue}
//                
//                if v.isEmpty {
//                    
//                        obj.setValue(value, forKey: k)
//                } else {
//                    
//                    let type = "\(value!.classForCoder)"
//
//                    if type == "NSDictionary" {
//                        
//                        if let subObj: AnyObject = objectWithDictionary(value as! NSDictionary, cls: NSClassFromString(ns + "." + v)!) {
//                            obj.setValue(subObj, forKey: k)
//                        }
//                        
//                    } else if type == "NSArray" {
//                        
//                        if let subObj: AnyObject = objectsWithArray(value as! NSArray, cls: NSClassFromString(ns + "." + v)!) {
//                            obj.setValue(subObj, forKey: k)
//                        }
//                    }
//                }
//                
//            }
//        }
//        
//        return obj
//    }
//    
//    /**
//     创建自定义对象数组
//     
//     - parameter array: 字典数组
//     - parameter cls:   模型类
//     
//     - returns: 模型数组
//     */
//    func objectsWithArray(array: NSArray, cls: AnyClass) -> NSArray? {
//        
//        var list = [AnyObject]()
//        
//        for value in array {
//            let type = "\(value.classForCoder)"
//            
//            if type == "NSDictionary" {
//                if let subObj: AnyObject = objectWithDictionary(value as! NSDictionary, cls: cls) {
//                    list.append(subObj)
//                }
//            } else if type == "NSArray" {
//                if let subObj: AnyObject = objectsWithArray(value as! NSArray, cls: cls) {
//                    list.append(subObj)
//                }
//            }
//        }
//        
//        if list.count > 0 {
//            return list
//        } else {
//            return nil
//        }
//    }
//
//    /**
//     模型转字典
//     
//     - parameter obj: 模型对象
//     
//     - returns: 字典信息
//     */
//    func objectToDictionary(obj: AnyObject) -> [String: AnyObject]? {
//        // 1. 取出对象模型字典
//        let infoDict = getWholeModelInfo(obj.classForCoder)
//        
//        var result = [String: AnyObject]()
//        // 2. 遍历字典
//        for (k, v) in infoDict {
//            var value: AnyObject? = obj.valueForKey(k)
//            if value == nil {
//                value = NSNull()
//            }
//            
//            if v.isEmpty || value === NSNull() {
//                result[k] = value
//            } else {
//                let type = "\(value!.classForCoder)"
//                
//                var subValue: AnyObject?
//                if type == "NSArray" {
//                    subValue = objectToArray(value! as! [AnyObject])
//                } else {
//                    subValue = objectToDictionary(value!)
//                }
//                if subValue == nil {
//                    subValue = NSNull()
//                }
//                result[k] = subValue
//            }
//        }
//        
//        if result.count > 0 {
//            return result
//        } else {
//            return nil
//        }
//    }
//
//    /**
//     模型数组转字典数组
//     
//     - parameter array: 模型数组
//     
//     - returns: 字典数组
//     */
//    func objectToArray(array: [AnyObject]) -> [AnyObject]? {
//        
//        var result = [AnyObject]()
//        
//        for value in array {
//            let type = "\(value.classForCoder)"
//            
//            var subValue: AnyObject?
//            if type == "NSArray" {
//                subValue = objectToArray(value as! [AnyObject])
//            } else {
//                subValue = objectToDictionary(value)
//            }
//            if subValue != nil {
//                result.append(subValue!)
//            }
//        }
//        
//        if result.count > 0 {
//            return result
//        } else {
//            return nil
//        }
//    }
//}
//
////MARK:- 私有方法
//extension XDBaseModel {
//    /**
//     加载完整类信息
//     
//     - returns: 模型类完整信息
//     */
//    func getWholeModelInfo(cls: AnyClass) -> [String: String] {
//        
//        // 检测缓冲池
//        if let cache = modelCache["\(cls)"] {
//            return cache
//        }
//        
//        var currentCls: AnyClass = cls
//        
//        var infoDict = [String: String]()
//        
//        while let parent: AnyClass = currentCls.superclass() {
//            
//            infoDict.merge(modelInfo(currentCls))
//            currentCls = parent
//            
//            if "\(parent)" == "NSObject" {
//                break
//            }
//        }
//        
//        // 写入缓冲池
//        modelCache["\(cls)"] = infoDict
//        
//        return infoDict
//    }
//    
//    /**
//     模型转字典
//     
//     - parameter cls: 模型对象
//     
//     - returns: 字典信息
//     */
//    func modelInfo(cls: AnyClass) -> [String: String] {
//        
//        // 检测缓冲池
//        if let cache = modelCache["\(cls)"] {
//            return cache
//        }
//        
//        // 运行时 获取model 成员变量列表
//        var count: UInt32 = 0
//        let ivars = class_copyIvarList(cls, &count)
//        
//        // 检测自定义key的映射
//        var mappingDict: [String: String]?
//        if cls.respondsToSelector(#selector(XDBaseModel.customClassMapping)) {
//            mappingDict = cls.customClassMapping()
//        }
//        
//        var infoDict = [String: String]()
//        
//        for i in 0 ..< count {
//            let ivar = ivars[Int(i)]
//            let keyName = String.fromCString(ivar_getName(ivar))!
//            
//            let type = mappingDict?[keyName] ?? ""
//            
//            infoDict[keyName] = type
//        }
//        
//        free(ivars)
//        
//        // 写入缓冲池
//        modelCache["\(cls)"] = infoDict
//        print("infoDict \(infoDict)")
//        
//        return infoDict
//    }
//}
//
////MARK:- (反)序列化对象
////extension XDBaseModel: NSCoding {
////    func init?(coder aDecoder: NSCoder) {
////        fatalError("init(coder:) has not been implemented")
////    }
////    
////    func encodeWithCoder(aCoder: NSCoder) {
////        
////    }
////}
//
////MARK:- 对象描述
//extension XDBaseModel {
//    
//    override var description: String {
//        let infoDict = getWholeModelInfo(self.classForCoder)
//        
//        var descStr = "[\(self.classForCoder)] \n-->\n"
//        
//        for (k, _) in infoDict {
//            descStr += "--> \(k): \(self.valueForKey(k))"
//        }
//        
//        return descStr
//    }
//}


