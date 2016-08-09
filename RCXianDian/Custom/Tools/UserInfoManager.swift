//
//  UserInfoManager.swift
//  RCXianDian
//
//  Created by user on 16/8/8.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class UserInfoManager: NSObject {
    
    // UserInfo单例
    private static let instance = UserInfoManager()
    class var sharedUserInfo: UserInfoManager {
        return instance
    }

}
