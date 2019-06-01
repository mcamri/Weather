//
//  JSONCityStore.swift
//  Weather
//
//  Created by Muchamad Chozinul Amri on 2/6/19.
//  Copyright © 2019 Muchamad Chozinul Amri. All rights reserved.
//

import Foundation

struct JSONCityStore:CityStore {
    
    func cities(_ callback: @escaping (CityViewModel) -> ()) {
        
        DispatchQueue.global().async {
            guard let path = Bundle.main.url(forResource: "city.list", withExtension:"json") else {
                callback(CityViewModel(cities: [City]()))
                return
            }
            
            guard let jsonData = try? Data(contentsOf: path, options: .mappedIfSafe) else {
                callback(CityViewModel(cities: [City]()))
                return
            }
            
            guard let cities = try? JSONDecoder().decode([City].self, from: jsonData) else {
                callback(CityViewModel(cities: [City]()))
                return
            }
            
            callback(CityViewModel(cities: cities))
        }
        
    }
    
    
}
