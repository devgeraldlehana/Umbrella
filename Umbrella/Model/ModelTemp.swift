//
//  ModelTemp.swift
//  Umbrella
//
//  Created by Gerald.Lehana on 2019/12/16.
//  Copyright © 2019 Nigrescent. All rights reserved.
//

import Foundation

public struct ModelTemp {
    private(set) var day:Double
    private(set) var min:Double
    private(set) var max:Double
    private(set) var night:Double
    private(set) var eve:Double
    private(set) var morn:Double
    
    init(dictionary:[String:Any]) {
        day = dictionary["day"] as? Double ?? 0.0
        min = dictionary["min"] as? Double ?? 0.0
        max = dictionary["max"] as? Double ?? 0.0
        night = dictionary["night"] as? Double ?? 0.0
        eve = dictionary["eve"] as? Double ?? 0.0
        morn = dictionary["morn"] as? Double ?? 0.0
    }
}
