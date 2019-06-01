//
//  CityStore.swift
//  Weather
//
//  Created by Muchamad Chozinul Amri on 2/6/19.
//  Copyright © 2019 Muchamad Chozinul Amri. All rights reserved.
//

import Foundation

protocol CityStore {
    
    func cities(_ callback: @escaping (CityViewModel)->())
    
}
