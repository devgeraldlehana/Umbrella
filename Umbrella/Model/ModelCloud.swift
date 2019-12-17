//
//  ModelCloud.swift
//  Umbrella
//
//  Created by Gerald.Lehana on 2019/12/12.
//  Copyright © 2019 Nigrescent. All rights reserved.
//

import Foundation

public struct ModelCloud {
    private(set) var all:Int
    
    init(dictionary:[String:Any]) {
        all = dictionary["all"] as? Int ?? 0
    }
}
