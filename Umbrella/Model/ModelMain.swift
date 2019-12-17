//
//  ModelMain.swift
//  Umbrella
//
//  Created by Gerald.Lehana on 2019/12/12.
//  Copyright © 2019 Nigrescent. All rights reserved.
//

import Foundation

public struct ModelMain {
    private(set) var temp:Double
    private(set) var feelsLike:Double
    private(set) var tempMin:Double
    private(set) var tempMax:Double
    private(set) var pressure:Double
    private(set) var humidity:Double
    
    init(dictionary:[String:Any]) {
        temp = dictionary["temp"] as? Double ?? 0.0
        feelsLike = dictionary["feels_like"] as? Double ?? 0.0
        tempMin = dictionary["temp_min"] as? Double ?? 0.0
        tempMax = dictionary["temp_max"] as? Double ?? 0.0
        pressure = dictionary["pressure"] as? Double ?? 0.0
        humidity = dictionary["humidity"] as? Double ?? 0.0
        
    }
}
