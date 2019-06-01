//
//  Coordinator.swift
//  Weather
//
//  Created by Muchamad Chozinul Amri on 1/6/19.
//  Copyright © 2019 Muchamad Chozinul Amri. All rights reserved.
//

import UIKit

protocol Coordinator:AnyObject {
    var children:[Coordinator] {get set}
    var nav:UINavigationController {get set}
    
    func start()
}
