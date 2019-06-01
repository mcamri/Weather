//
//  ForecastAPI.swift
//  Weather
//
//  Created by Muchamad Chozinul Amri on 1/6/19.
//  Copyright © 2019 Muchamad Chozinul Amri. All rights reserved.
//

import Foundation

protocol ForecastAPI {
    
    func getForecast(_ cityId: String, _ callback: @escaping ((ForecastViewModel?) -> ()))
    
}
