//
//  ViewModelBase.swift
//  Umbrella
//
//  Created by Gerald.Lehana on 2019/12/15.
//  Copyright © 2019 Nigrescent. All rights reserved.
//

import UIKit

fileprivate struct WeatherType {
    //Tuples has weatherImageName weatherIconName weatherColor
    static let sunny = ("forest_sunny", "clear", UIColor.weather.sunny)
    static let rainy = ("forest_rainy", "rain", UIColor.weather.rainy)
    static let cloudy = ("forest_cloudy", "partlysunny", UIColor.weather.cloudy)
}

class ViewModelBase: NSObject {

    fileprivate func getWeatherType(withWeatherId id:Int) -> (String, String, UIColor) {
        switch id {
        case 200...781:
            return WeatherType.rainy
        case 800:
            return WeatherType.sunny
        case 801...804:
            return WeatherType.cloudy
        default:
            return WeatherType.sunny
        }
    }
    
    func getWeatherImageName(withWeatherId id:Int) -> String {
        return getWeatherType(withWeatherId: id).0
    }
    
    func getWeatherIconName(withWeatherId id:Int) -> String {
        return getWeatherType(withWeatherId: id).1
    }
    
    func getWeatherColor(withWeatherId id:Int) -> UIColor {
        return getWeatherType(withWeatherId: id).2
    }
}
