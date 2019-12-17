//
//  ModelCity.swift
//  Umbrella
//
//  Created by Gerald.Lehana on 2019/12/12.
//  Copyright © 2019 Nigrescent. All rights reserved.
//

import Foundation

public struct ModelCity {
    private(set) var id:Int
    private(set) var name:String?
    private(set) var coord:ModelCoord?
    private(set) var country:String?
    private(set) var timeZone:Int
    
    init(dictionary:[String:Any]) {
        id = dictionary["id"] as? Int ?? 0
        
        name = dictionary["name"] as? String
        
        if  let tmpValue = dictionary["coord"] as? [String:Any]{
            coord = ModelCoord.init(dictionary:tmpValue)
        }
        
        country = dictionary["country"] as? String
        
        timeZone = dictionary["timeZone"] as? Int ?? 0
    }
}
