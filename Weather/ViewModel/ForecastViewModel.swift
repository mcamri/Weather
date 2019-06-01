//
//  ForecastViewModel.swift
//  Weather
//
//  Created by Muchamad Chozinul Amri on 1/6/19.
//  Copyright © 2019 Muchamad Chozinul Amri. All rights reserved.
//

import UIKit

struct ForecastViewModel {
    var forecast:Forecast
    
    func forecastCount() -> Int {
        return forecast.list?.count ?? 0
    }
    
    func city(_ indexPath:IndexPath) -> String {
        return forecast.city?.name ?? ""
    }
    
    func time(_ indexPath:IndexPath) -> String {
        if let forecasts = forecast.list,
            forecasts.count > indexPath.row,
            let dt = forecasts[indexPath.row].dt_txt {
            return dt
        }else {
            return ""
        }
    }
    
    func temp(_ indexPath:IndexPath) -> String {
        if let forecasts = forecast.list,
            forecasts.count > indexPath.row,
            let temp = forecasts[indexPath.row].main?.temp {
            return "Temperature: " + "\(temp)"
        }else {
            return "Temperature: " + "-"
        }
    }
    
    func tempMin(_ indexPath:IndexPath) -> String {
        if let forecasts = forecast.list,
            forecasts.count > indexPath.row,
            let tempMin = forecasts[indexPath.row].main?.temp_min{
            return "Min Temperature: \(tempMin)"
        }else {
            return "Min Temperature: " + "-"
        }
    }
    
    func tempMax(_ indexPath:IndexPath) -> String {
        if let forecasts = forecast.list,
            forecasts.count > indexPath.row,
            let tempMax = forecasts[indexPath.row].main?.temp_max {
            return "Max Temperature: \(tempMax)"
        }else {
            return "Max Temperature: -"
        }
    }
    
    func pressure(_ indexPath:IndexPath) -> String {
        if let forecasts = forecast.list,
            forecasts.count > indexPath.row,
            let pressure = forecasts[indexPath.row].main?.pressure {
            return "Pressure: \(pressure)"
        }else {
            return "Pressure: -"
        }
    }
    
    func seaLevel(_ indexPath:IndexPath) -> String {
        if let forecasts = forecast.list,
            forecasts.count > indexPath.row,
            let seaLevel = forecasts[indexPath.row].main?.sea_level {
            return "Sea Level: \(seaLevel)"
        }else {
            return "Sea Level: -"
        }
    }
    
    func grdnLevel(_ indexPath:IndexPath) -> String {
        if let forecasts = forecast.list,
            forecasts.count > indexPath.row,
            let level = forecasts[indexPath.row].main?.grnd_level {
            return "Ground Level: \(level)"
        }else {
            return "Ground Level: -"
        }
    }
    
    func humidity(_ indexPath:IndexPath) -> String {
        if let forecasts = forecast.list,
            forecasts.count > indexPath.row,
            let humidity = forecasts[indexPath.row].main?.humidity {
            return "Humidity: \(humidity)"
        }else {
            return "Humidity: -"
        }
    }
    
    func tempKf(_ indexPath:IndexPath) -> String {
        if let forecasts = forecast.list,
            forecasts.count > indexPath.row,
            let tempkf = forecasts[indexPath.row].main?.temp_kf {
            return "Temp KF: \(tempkf)"
        }else {
            return "Temp KF: -"
        }
    }
    
    func windSpeed(_ indexPath:IndexPath) -> String {
        if let forecasts = forecast.list,
            forecasts.count > indexPath.row,
            let speed = forecasts[indexPath.row].wind?.speed {
            return "Wind Speed: \(speed)"
        }else {
            return "Wind Speed: -"
        }
    }
    
    func windCourse(_ indexPath:IndexPath) -> String {
        if let forecasts = forecast.list,
            forecasts.count > indexPath.row,
            let deg = forecasts[indexPath.row].wind?.deg {
            return "Wind Course: \(deg)"
        }else {
            return "Wind Course: -"
        }
    }
    
    func main(_ indexPath:IndexPath) -> String {
        if let forecasts = forecast.list,
            forecasts.count > indexPath.row,
            let weather = forecasts[indexPath.row].weather,
            weather.count > 0,
            let main = weather[0].main {
            return main
        }else {
            return ""
        }
    }
    
    func description(_ indexPath:IndexPath) -> String {
        if let forecasts = forecast.list,
            forecasts.count > indexPath.row,
            let weather = forecasts[indexPath.row].weather,
            weather.count > 0,
            let desc = weather[0].description {
            return desc
        }else {
            return ""
        }
    }
    
    func iconUrl(_ indexPath:IndexPath, completion: @escaping ((UIImage)->())){
        if let forecasts = forecast.list,
            forecasts.count > indexPath.row,
            let weather = forecasts[indexPath.row].weather,
            weather.count > 0,
            let iconUrl = weather[0].icon{
            let urlString = URL_ICON+iconUrl+".png"
            if let url = URL(string: urlString){
                DispatchQueue.global().async {
                    if let data = try? Data( contentsOf:url),
                        let image = UIImage(data: data)
                    {
                        
                        DispatchQueue.main.async {
                            completion(image)
                        }
                    }else{
                        
                        DispatchQueue.main.async {
                            completion(UIImage())
                        }
                    }
                }
            }else {
                completion(UIImage())
            }
            
        }else {
            completion(UIImage())
        }
    }
    
}
