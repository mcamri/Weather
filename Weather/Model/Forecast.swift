//
//  Forecast.swift
//  Weather
//
//  Created by Muchamad Chozinul Amri on 1/6/19.
//  Copyright © 2019 Muchamad Chozinul Amri. All rights reserved.
//

import Foundation

struct Forecast: Codable {
    var cod:String?
    var message:Double?
    var cnt:Int?
    var list:[ForecastItem]?
    var city:City?
}
