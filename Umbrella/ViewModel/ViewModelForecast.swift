//
//  ViewModelForecast.swift
//  Umbrella
//
//  Created by Gerald.Lehana on 2019/12/13.
//  Copyright © 2019 Nigrescent. All rights reserved.
//

import UIKit

class ViewModelForecast: ViewModelBase {
    private(set) var title:NSAttributedString!
    private(set) var temp:NSAttributedString!
    private(set) var icon:String!
    
    init(withTitle title:String,
         withTemp temp:String,
         withIcon icon:String) {
        self.title = NSAttributedString.init(text: title, textColor: UIColor.weather.text, textFont: UIFont.general.forecast)
        self.temp = NSAttributedString.init(text: temp, textColor: UIColor.weather.text, textFont: UIFont.general.forecast)
        self.icon = icon
    }
}
