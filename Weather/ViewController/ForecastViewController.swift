//
//  ViewController.swift
//  Weather
//
//  Created by Muchamad Chozinul Amri on 1/6/19.
//  Copyright © 2019 Muchamad Chozinul Amri. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController, Storyboarded {

    var coordinator:MainCoordinator!
    var forecastAPI:ForecastAPI!
    var forecastViewModel:ForecastViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Forecast"
        forecastAPI.getForecast("524901"){
            [weak self] viewModel in
            self?.forecastViewModel = viewModel
            print(viewModel)
            
        }
    }


}

