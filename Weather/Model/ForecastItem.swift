//
//  Forecast.swift
//  Weather
//
//  Created by Muchamad Chozinul Amri on 1/6/19.
//  Copyright © 2019 Muchamad Chozinul Amri. All rights reserved.
//

import Foundation

struct ForecastItem: Codable {
    var dt:Int?
    var main:Main?
    var weather:[Weather]?
    var clouds:Clouds?
    var wind:Wind?
    var sys:Sys?
    var dt_txt:String?
}
