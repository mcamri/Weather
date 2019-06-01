//
//  MainCoordinator.swift
//  Weather
//
//  Created by Muchamad Chozinul Amri on 1/6/19.
//  Copyright © 2019 Muchamad Chozinul Amri. All rights reserved.
//

import Foundation


import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var children = [Coordinator]()
    var nav: UINavigationController
    var cityId = "524901"
    
    init(nav: UINavigationController) {
        self.nav = nav
    }
    
    func start() {
        nav.delegate = self
        let vc = ForecastViewController.instantiate()
        vc.coordinator = self
        vc.cityId = cityId
        vc.forecastAPI = NativeForecastAPI()
        self.nav.pushViewController(vc, animated: true)
    }
    
    func selectCity() {
        let vc = SelectCityViewController.instantiate()
        vc.coordinator = self
        vc.cityStore = JSONCityStore()
        self.nav.pushViewController(vc, animated: true)
    }
    
    func childDidFinish(_ child:Coordinator) {
        for (index, coordinator) in children.enumerated() {
            if coordinator === child {
                children.remove(at: index)
                break
            }
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from)  else {
            return
        }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if let vc = fromViewController as? SelectCityViewController {
            self.cityId = vc.selectedCityId ?? self.cityId
            let vc = self.nav.viewControllers.first as! ForecastViewController
            vc.cityId = self.cityId
            vc.reloadData()
        }
        
    }
}
