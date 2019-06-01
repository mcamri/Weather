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
    
    init(nav: UINavigationController) {
        self.nav = nav
    }
    
    func start() {
        nav.delegate = self
        let vc = ForecastViewController.instantiate()
        vc.coordinator = self
        self.nav.pushViewController(vc, animated: true)
    }
    
    func buy(_ selectedProduct:Int) {
       
    }
    
    func createAccount() {
       
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
        
        if let vc = fromViewController as? ForecastViewController {
            
        }
        
    }
}
