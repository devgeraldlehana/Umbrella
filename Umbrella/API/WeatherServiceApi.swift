//
//  WeatherServiceApi.swift
//  Umbrella
//
//  Created by Gerald.Lehana on 2019/12/17.
//  Copyright © 2019 Nigrescent. All rights reserved.
//

import Foundation

extension ServerAPI {
    
    public func getCurrentWeather(withLong lon:Double, withLat lat:Double,
                                  withCompletion completion:@escaping (Error?, ModelCurrent?) -> Void) {
        let endpoint = "weather?lat=\(lat)&lon=\(lon)"
        
        getRequest(witEndPoint: endpoint) { (error, response) in
            if let tmp = response as? [String:Any] {
                completion(nil, ModelCurrent.init(dictionary: tmp))
            } else {
                completion(error, nil)
            }
        }
    }
    
    public func getWeatherForecast(withWeatherId id:Int,
                                  withCompletion completion:@escaping (Error?, ModelForecast?) -> Void) {
        let endpoint = "forecast/daily?id=\(id)&cnt=6"
        
        getRequest(witEndPoint: endpoint) { (error, response) in
            if let tmp = response as? [String:Any] {
                completion(nil, ModelForecast.init(dictionary: tmp))
            } else {
                completion(error, nil)
            }
        }
    }
}
