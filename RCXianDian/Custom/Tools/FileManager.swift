//
//  Timer.swift
//  文件缓存操作
//
//  Created by timer_open on 16/7/22.
//  Copyright © 2016年 timer_open. All rights reserved.
//

import UIKit

class Timer: NSObject {
    //MARK:-----------------------获取缓存大下-----------------------
    static func returnCacheSize()->String{
        return String(format: "%2fMB",Timer.forderSizeAtPath(NSHomeDirectory()))
        
    }
    //MARK:-----------------------删除缓存的方法-----------------------
    //    目前只是做示范  至于到时候存在哪个文件夹呢  写入这个文件夹名就好
    static func cleanCache(comletion:()->Void){
        Timer.delelteFolder(NSHomeDirectory()+"/Documents")
        Timer.delelteFolder(NSHomeDirectory()+"/Library")
        Timer.delelteFolder(NSHomeDirectory()+"/tmp")
        //回调做接下来的处理
        comletion()
        
    }
    
    //    计算单个文件的大小
    static func returnFileSize(path:String) ->Double{
        let manage = NSFileManager.defaultManager()
        var fileSize : Double = 0
        do{
            fileSize = try manage.attributesOfItemAtPath(path)["NSFileSize"] as!Double
        }catch{
        }
        return fileSize/1024/1024
    }
    //    遍历所有子目录返回文件大小
    static func forderSizeAtPath(folderPath:String) ->Double{
        let manage = NSFileManager.defaultManager()
        if !manage.fileExistsAtPath(folderPath) {
            return 0
        }
        let chidfilePath = manage.subpathsAtPath(folderPath)
        var fileSize:Double = 0
        for path in chidfilePath! {
            let fileAbsoluePath = folderPath+"/"+path
            fileSize += Timer.returnFileSize(fileAbsoluePath)
        }
        return fileSize
    }
    //    删除单个文件
    static func deleteFile(path:String){
        let manage = NSFileManager.defaultManager()
        do{
            try manage.removeItemAtPath(path)
        }catch{
        }
    }
    //    删除文件夹下的所有问价
    static func delelteFolder(folderPath:String){
        let manage = NSFileManager.defaultManager()
        if !manage.fileExistsAtPath(folderPath) {
        }
        let chidfilePath = manage.subpathsAtPath(folderPath)
        for path in chidfilePath! {
            let fileAbsoluePath = folderPath+"/"+path
            Timer.deleteFile(fileAbsoluePath)
        }
    }
}
