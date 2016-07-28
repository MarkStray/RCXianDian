//
//  String+Extension.swift
//  RCXianDian
//
//  Created by user on 16/7/26.
//  Copyright © 2016年 rrcc. All rights reserved.
//


/// 注意：要使用本分类，需要在 桥接文件 中添加以下头文件导入
/// #import <CommonCrypto/CommonCrypto.h>

extension String  {
    /// 返回字符串的 MD5 散列结果
    var md5: String! {
        let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
        let strLen = CC_LONG(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)
        
        CC_MD5(str!, strLen, result)
        
        let hash = NSMutableString()
        for i in 0..<digestLen {
            hash.appendFormat("%02x", result[i])
        }
        
        result.dealloc(digestLen)
        
        return hash.copy() as! String
    }
}


extension String {
    //编码
    var base64Encode: String! {
        let plainData = self.dataUsingEncoding(NSUTF8StringEncoding)
        let base64String = plainData?.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
        return base64String as String!
    }
    
    //解码
    var base64Decode: String! {
        let decodeData = NSData(base64EncodedString: self, options: NSDataBase64DecodingOptions(rawValue: 0))
        let decodeString = NSString(data: decodeData!, encoding: NSUTF8StringEncoding)
        return decodeString as! String
    }
}


