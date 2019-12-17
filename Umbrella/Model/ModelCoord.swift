//
//  ModelCoord.swift
//  Umbrella
//
//  Created by Gerald.Lehana on 2019/12/12.
//  Copyright © 2019 Nigrescent. All rights reserved.
//

import Foundation

public struct ModelCoord {
    private(set) var lon:Float
    private(set) var lat:Float
    
    init(dictionary:[String:Any]) {
        lon = dictionary["lon"] as? Float ?? 0.0
        lat = dictionary["lat"] as? Float ?? 0.0
    }
}
