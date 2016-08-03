//
//  PersonModel.swift
//  RCXianDian
//
//  Created by user on 16/8/3.
//  Copyright © 2016年 rrcc. All rights reserved.
//

import UIKit

class PersonModel: NSObject {
    var img: String?
    var title: String?
    var detailTitle: String?
    var arrowHidden: Bool?
    var lineHidden: Bool?
    
    class func loadPersonData() -> [[PersonModel]] {
        
        let modelDicList = DataStruct.personCenter
        
        var personDataList: [[PersonModel]] = [[PersonModel]]()
        
        
        for dicList in modelDicList {
            
            var personModelList: [PersonModel] = [PersonModel]()
            for modelDic in dicList {
                
                let model = PersonModel()
                model.img = modelDic["img"] as? String
                model.title = modelDic["title"] as? String
                model.detailTitle = modelDic["detailTitle"] as? String
                model.arrowHidden = modelDic["arrowHidden"] as? Bool
                model.lineHidden = modelDic["lineHidden"] as? Bool
                
                personModelList.append(model)
            }
            
            personDataList.append(personModelList)
        }
        
        return personDataList
    }
    
}
