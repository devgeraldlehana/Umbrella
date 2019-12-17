//
//  ModelWeather.swift
//  Umbrella
//
//  Created by Gerald.Lehana on 2019/12/12.
//  Copyright © 2019 Nigrescent. All rights reserved.
//

import Foundation

public struct ModelWeather {
    private(set) var id:Int
    private(set) var main:String?
    private(set) var description:String?
    private(set) var icon:String?
    
    init(dictionary:[String:Any]) {
        id = dictionary["id"] as? Int ?? 0
        main = dictionary["main"] as? String
        description = dictionary["description"] as? String
        icon = dictionary["icon"] as? String
    }
}
