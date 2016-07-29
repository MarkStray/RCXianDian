//
//  XDBaseRequestParam.swift
//  RCXianDian
//
//  Created by user on 16/7/29.
//  Copyright © 2016年 rrcc. All rights reserved.
//

/**
 *
 */
protocol XDBaseRequestParamProtocol {
    mutating func buildRequestParam() -> [String: String]?
}
