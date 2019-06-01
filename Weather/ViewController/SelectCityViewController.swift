//
//  SelectCityViewController.swift
//  Weather
//
//  Created by Muchamad Chozinul Amri on 2/6/19.
//  Copyright © 2019 Muchamad Chozinul Amri. All rights reserved.
//

import UIKit

class SelectCityViewController: UIViewController, Storyboarded {

    var coordinator:MainCoordinator!
    var cityStore:CityStore!
    var cityViewModel:CityViewModel?
    var selectedCityId:String?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.title = "Loading Cities ..."
        cityStore.cities() {
            [weak self] citViewModel in
            DispatchQueue.main.async {
                self?.title = "Cities"
                self?.cityViewModel = citViewModel
                self?.tableView.reloadData()
            }
        }
    }
    
    

}

extension SelectCityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityViewModel?.cityCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = cityViewModel?.cityName(indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCityId = cityViewModel?.cityId(indexPath)
        self.navigationController?.popViewController(animated: true)
    }
    
}
