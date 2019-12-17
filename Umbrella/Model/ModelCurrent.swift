//
//  ModelCurrent.swift
//  Umbrella
//
//  Created by Gerald.Lehana on 2019/12/12.
//  Copyright © 2019 Nigrescent. All rights reserved.
//

import Foundation

public struct ModelCurrent {
    private(set) var coord:ModelCoord?
    private(set) var weathers:[ModelWeather] = []
    private(set) var base:String?
    private(set) var main:ModelMain?
    private(set) var wind:ModelWind?
    private(set) var cloud:ModelCloud?
    private(set) var dt:Int
    private(set) var sys:ModelSys?
    private(set) var timeZone:Int
    private(set) var id:Int
    private(set) var name:String?
    private(set) var cod:Int
    
    init(dictionary:[String:Any]) {
        if  let tmpValue = dictionary["coord"] as? [String:Any]{
            coord = ModelCoord.init(dictionary:tmpValue)
        }
        
        if let tmpArray = dictionary["weather"] as? NSArray{
            for case let data as [String:Any] in tmpArray{
                weathers.append(ModelWeather.init(dictionary:data))
            }
        }
        
        base = dictionary["base"] as? String
        
        if  let tmpValue = dictionary["main"] as? [String:Any]{
            main = ModelMain.init(dictionary:tmpValue)
        }
        
        if  let tmpValue = dictionary["wind"] as? [String:Any]{
            wind = ModelWind.init(dictionary:tmpValue)
        }
        
        if  let tmpValue = dictionary["clouds"] as? [String:Any]{
            cloud = ModelCloud.init(dictionary:tmpValue)
        }
        
        dt = dictionary["dt"] as? Int ?? 0
        
        if  let tmpValue = dictionary["clouds"] as? [String:Any]{
            cloud = ModelCloud.init(dictionary:tmpValue)
        }
        
        timeZone = dictionary["timeZone"] as? Int ?? 0
        
        name = dictionary["name"] as? String
        
        cod = dictionary["cod"] as? Int ?? 0
        
        id = dictionary["id"] as? Int ?? 0
    }
}

