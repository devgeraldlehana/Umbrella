//
//  ModelSys.swift
//  Umbrella
//
//  Created by Gerald.Lehana on 2019/12/12.
//  Copyright © 2019 Nigrescent. All rights reserved.
//

import Foundation

public struct ModelSys {
    private(set) var type:Int
    private(set) var id:Int
    private(set) var message:Float
    private(set) var country:String?
    private(set) var sunrise:Int
    private(set) var sunset:Int
    
    init(dictionary:[String:Any]) {
        type = dictionary["type"] as? Int ?? 0
        id = dictionary["id"] as? Int ?? 0
        message = dictionary["message"] as? Float ?? 0.0
        country = dictionary["country"] as? String
        sunrise = dictionary["sunrise"] as? Int ?? 0
        sunset = dictionary["sunset"] as? Int ?? 0
    }
}
