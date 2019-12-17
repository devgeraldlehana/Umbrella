//
//  ModelForecastListItem.swift
//  Umbrella
//
//  Created by Gerald.Lehana on 2019/12/12.
//  Copyright © 2019 Nigrescent. All rights reserved.
//

import Foundation

public struct ModelForecastListItem {
    private(set) var dt:Double
    private(set) var sunrise:Double
    private(set) var sunset:Double
    private(set) var temp:ModelTemp?
    private(set) var pressure:Double
    private(set) var humidity:Int
    private(set) var weathers:[ModelWeather] = []
    private(set) var speed:Double
    private(set) var deg:Int
    private(set) var clouds:Double
    
    init(dictionary:[String:Any]) {
        dt = dictionary["dt"] as? Double ?? 0
        
        sunrise = dictionary["sunrise"] as? Double ?? 0
        
        sunset = dictionary["sunset"] as? Double ?? 0
        
        if  let tmpValue = dictionary["temp"] as? [String:Any]{
            temp = ModelTemp.init(dictionary:tmpValue)
        }
        
        pressure = dictionary["pressure"] as? Double ?? 0
        
        humidity = dictionary["humidity"] as? Int ?? 0
        
        if let tmpArray = dictionary["weather"] as? NSArray{
            for case let data as [String:Any] in tmpArray{
                weathers.append(ModelWeather.init(dictionary:data))
            }
        }
        
        speed = dictionary["speed"] as? Double ?? 0
        
        deg = dictionary["deg"] as? Int ?? 0
        
        clouds = dictionary["sunset"] as? Double ?? 0
        
    }
}
