//
//  ModelForecast.swift
//  Umbrella
//
//  Created by Gerald.Lehana on 2019/12/12.
//  Copyright © 2019 Nigrescent. All rights reserved.
//

import Foundation

public struct ModelForecast {
    
    
    private(set) var city:ModelCity?
    private(set) var cod:Int
    private(set) var message:Double
    private(set) var cnt:Int
    private(set) var list:[ModelForecastListItem] = []
    
    init(dictionary:[String:Any]) {
        cod = dictionary["cod"] as? Int ?? 0
        
        message = dictionary["message"] as? Double ?? 0.0
        
        if  let tmpValue = dictionary["city"] as? [String:Any]{
            city = ModelCity.init(dictionary:tmpValue)
        }
        
        cnt = dictionary["cnt"] as? Int ?? 0
        
        if let tmpArray = dictionary["list"] as? NSArray{
            for case let data as [String:Any] in tmpArray{
                list.append(ModelForecastListItem.init(dictionary:data))
            }
        }
    }
}
