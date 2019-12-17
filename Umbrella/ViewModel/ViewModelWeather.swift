//
//  ViewModelWeather.swift
//  Umbrella
//
//  Created by Gerald.Lehana on 2019/12/12.
//  Copyright © 2019 Nigrescent. All rights reserved.
//

import UIKit

class ViewModelWeather: ViewModelBase {
    
    private(set) var viewBackgroundColor:UIColor!
    private(set) var service:ServerAPI!
    private var collection:[(cellData:NSObject, cellIdentitifier:String)] = []
    let genericErrorMessage = "Opps... something went wrong 🙃."
    let genericErrorTitle = "Ahhh Snap"
    let negativeAlertButton = "Cancel"
    let positiveAlertButton = "Try Again"
    
    init(service:ServerAPI) {
        self.service = service
    }
    
    fileprivate func addCurrentWatherCell(withWeather weather:ModelWeather,
                                          withMain main:ModelMain) {
        
        guard let wDescription = weather.description else { return }
        
        let viewModel = ViewModelCurrent.init(withTitle: main.temp.degreeValue,
                                              withSubTitle: wDescription,
                                              withCurrentTemp: main.temp.degreeValue,
                                              withCurrentTempSub: "\nCurrent",
                                              withMinTemp: main.tempMin.degreeValue,
                                              withMinTempSub: "\nmin",
                                              withMaxTemp: main.tempMax.degreeValue,
                                              withMaxTempSub: "\nmax",
                                              withWeatherImage: getWeatherImageName(withWeatherId: weather.id))
        collection.append((cellData: viewModel, cellIdentitifier: CurrentTableViewCell.defaultReuseIdentifier))
    }
    
    fileprivate func addForecastViewModel(withWeather weather:ModelWeather, withItem item:ModelForecastListItem, withTemp temp:ModelTemp) {
        let icon = self.getWeatherIconName(withWeatherId: weather.id)
        let viewModel = ViewModelForecast.init(withTitle:item.dt.dayOfTheWeek, withTemp:temp.day.degreeValue, withIcon: icon)
        collection.append((cellData: viewModel, cellIdentitifier: ForecastTableViewCell.defaultReuseIdentifier))
    }
    
    func getCurrent(withLong lon:Double, withLat lat:Double,
                    withCompletion completion:@escaping (String?) -> Void) {
        
        service.getCurrentWeather(withLong:lon, withLat:lat) { (error, weatherCurrent) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(error.localizedDescription)
                    return
                }
                
                guard let currentModel = weatherCurrent else {
                    completion(self.genericErrorMessage)
                    return
                }
                
                self.service.getWeatherForecast(withWeatherId: currentModel.id) { (error, weatherforecast) in
                    
                    DispatchQueue.main.async {
                        if let error = error {
                            completion(error.localizedDescription)
                            return
                        }
                        
                        guard let forecastModel = weatherforecast else {
                            completion(self.genericErrorMessage)
                            return
                        }
                        
                        if let weather = currentModel.weathers.first, let main = weatherCurrent?.main {
                            self.viewBackgroundColor = self.getWeatherColor(withWeatherId: weather.id)
                            self.addCurrentWatherCell(withWeather:weather, withMain: main)
                        }
                        
                        for item in forecastModel.list {
                            if let itemWeather = item.weathers.first, let itemTemp = item.temp {
                                self.addForecastViewModel(withWeather:itemWeather, withItem:item, withTemp:itemTemp)
                            }
                        }
                        completion(nil)
                    }
                }
            }
        }
    }
    
    func getCellViewModel(withIndexPath indexpath:IndexPath) -> (cellData:NSObject, cellIdentitifier:String) {
        return collection[indexpath.row]
    }
    
    func getNumberOfRows() -> Int {
        return collection.count
    }
    
    func resetCollection() {
        collection.removeAll()
    }
}
