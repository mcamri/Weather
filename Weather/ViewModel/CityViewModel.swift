//
//  CityViewModel.swift
//  Weather
//
//  Created by Muchamad Chozinul Amri on 2/6/19.
//  Copyright © 2019 Muchamad Chozinul Amri. All rights reserved.
//

import Foundation

struct CityViewModel {
    var cities:[City]
    
    func cityCount() -> Int {
        return cities.count
    }
    
    func cityName(_ indexPath:IndexPath) -> String {
        return cities[indexPath.row].name ?? ""
    }
    
    func cityId(_ indexPath:IndexPath) -> String {
        return "\(cities[indexPath.row].id ?? 0)"
    }
}
