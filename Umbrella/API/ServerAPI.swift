//
//  ServerAPI.swift
//  Umbrella
//
//  Created by Gerald.Lehana on 2019/12/12.
//  Copyright © 2019 Nigrescent. All rights reserved.
//

import Foundation


public class ServerAPI {
    
    static let shared = ServerAPI()
    let baseURL = "api.openweathermap.org"
    let baseURLVersionNumber = "data/2.5"
    let weatherKey = "bfc3fb7f53b482284e6e293a6178405c"
    
    public func getRequest(witEndPoint endPoint:String,
                            withCompletion completion:@escaping (Error?, Any?) -> Void){
        
        let baseUrlPath = "/\(baseURLVersionNumber)\("/")\(endPoint)&appid=\(weatherKey)&units=metric"
        
        let session = URLSession.shared
        let tmpbaseurl = endPoint.contains("http") ? endPoint : "https://\(baseURL)\(baseUrlPath)"
        
        
        let url = URL(string: tmpbaseurl)!
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
        
            if let httpError = error {
                completion(httpError, nil)
                return
            }
            
            guard let tmpData = data else {
                completion(nil, nil)
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: tmpData, options: [])
                print(json)
                completion(nil, json)
            } catch {
                completion(error, nil)
            }
            
        })
        task.resume()
    }
}
