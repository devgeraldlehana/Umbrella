//
//  ViewModelCurrent.swift
//  Umbrella
//
//  Created by Gerald.Lehana on 2019/12/12.
//  Copyright © 2019 Nigrescent. All rights reserved.
//

import UIKit

class ViewModelCurrent: ViewModelBase {
    private(set) var viewBackgroundColor:UIColor!
    private(set) var title, subTitle, currentTemp, minTemp, maxTemp:NSAttributedString!
    private(set) var weatherImage:String!
    
    init(withTitle title:String,
         withSubTitle subTitle:String,
         withCurrentTemp currentTemp:String,
         withCurrentTempSub currentTempSub:String,
         withMinTemp minTemp:String,
         withMinTempSub minTempSub:String,
         withMaxTemp maxTemp:String,
         withMaxTempSub maxTempSub:String,
         withWeatherImage weatherImage:String) {
        
        self.title = NSAttributedString.init(text: title, textColor: UIColor.weather.text, textFont: UIFont.general.title)
        
        self.subTitle = NSAttributedString.init(text: subTitle, textColor: UIColor.weather.text, textFont: UIFont.general.subTitle)
        
        self.currentTemp = NSAttributedString.init(text1: currentTemp, text2: currentTempSub, textColor: UIColor.weather.text, textFont1: UIFont.general.tempHeading, textFont2: UIFont.general.tempSubHeading)
        
        self.minTemp = NSAttributedString.init(text1: minTemp, text2: minTempSub, textColor: UIColor.weather.text, textFont1: UIFont.general.tempHeading, textFont2: UIFont.general.tempSubHeading)
        
        self.maxTemp = NSAttributedString.init(text1: maxTemp, text2: maxTempSub, textColor: UIColor.weather.text, textFont1: UIFont.general.tempHeading, textFont2: UIFont.general.tempSubHeading)
        self.weatherImage = weatherImage
    }
}
