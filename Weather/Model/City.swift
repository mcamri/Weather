//
//  City.swift
//  Weather
//
//  Created by Muchamad Chozinul Amri on 1/6/19.
//  Copyright © 2019 Muchamad Chozinul Amri. All rights reserved.
//

import Foundation

struct City: Codable {
    var id:Int?
    var name:String?
    var coord:Coord?
    var country:String?
    var timezone:Int
    
}
