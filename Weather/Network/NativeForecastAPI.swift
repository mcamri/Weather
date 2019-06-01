//
//  NativeForecastAPI.swift
//  Weather
//
//  Created by Muchamad Chozinul Amri on 1/6/19.
//  Copyright © 2019 Muchamad Chozinul Amri. All rights reserved.
//

import Foundation

struct NativeForecastAPI:ForecastAPI {
    
    func getForecast(_ cityId: String, _ callback: @escaping ((ForecastViewModel?) -> ())) {
        let path = "/data/2.5/forecast"
        let urlString = "\(URL_FORECAST)\(path)?id=\(cityId)&APPID=\(APP_ID)"
        print(urlString)
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) {(data, response, error ) in
                guard error == nil else {
                    callback(nil)
                    return
                }
                guard let content = data else {
                    callback(nil)
                    return
                }
                guard let forecast = try? JSONDecoder().decode(Forecast.self, from: content) else {
                    callback(nil)
                    return
                }
                callback(ForecastViewModel(forecast: forecast))
            }.resume()
        }
        
    }
    
}
