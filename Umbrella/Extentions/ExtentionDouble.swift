//
//  ExtentionFloat.swift
//  Umbrella
//
//  Created by Gerald.Lehana on 2019/12/16.
//  Copyright © 2019 Nigrescent. All rights reserved.
//

import Foundation

extension Double {
    var degreeValue: String {
        return String(format: "%.0f", self) + "°"
    }
    
    var dayOfTheWeek : String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.timeZone = .current
        return dateFormatter.string(from: date)
    }
}
