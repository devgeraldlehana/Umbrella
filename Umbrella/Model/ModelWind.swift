//
//  ModelWind.swift
//  Umbrella
//
//  Created by Gerald.Lehana on 2019/12/12.
//  Copyright © 2019 Nigrescent. All rights reserved.
//

import Foundation

public struct ModelWind {
    private(set) var speed:Float
    private(set) var deg:Float
    
    init(dictionary:[String:Any]) {
        speed = dictionary["speed"] as? Float ?? 0.0
        deg = dictionary["deg"] as? Float ?? 0.0
    }
}
