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
    var cityId:String!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var itemCellSize: CGSize!
    var itemCellsGap: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Forecast"
        itemCellSize = CGSize(width: self.view.bounds.size.width - 32, height: self.view.bounds.size.width - 32)
        itemCellsGap = 32
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "City", style: .plain, target: self, action: #selector(selectCity))
        
        self.reloadData()
    }
    
    func reloadData() {
        forecastAPI.getForecast(cityId){
            [weak self] viewModel in
            self?.forecastViewModel = viewModel
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
    @objc
    func selectCity() {
        coordinator.selectCity()
    }
    
    func configureCell(_ cell:ForecastCollectionViewCell, _ indexPath:IndexPath){
        cell.cityLabel.text = forecastViewModel?.city(indexPath)
        cell.timeLabel.text = forecastViewModel?.time(indexPath)
        cell.mainLabel.text = forecastViewModel?.main(indexPath)
        cell.descriptionLabel.text = forecastViewModel?.description(indexPath)
        cell.temperatureLabel.text = forecastViewModel?.temp(indexPath)
        cell.maxTemperatureLabel.text = forecastViewModel?.tempMax(indexPath)
        cell.minTemperatureLabel.text = forecastViewModel?.tempMin(indexPath)
        cell.pressureLabel.text = forecastViewModel?.pressure(indexPath)
        cell.seaLevelLabel.text = forecastViewModel?.seaLevel(indexPath)
        cell.humidityLabel.text = forecastViewModel?.humidity(indexPath)
        cell.tempKfLabel.text = forecastViewModel?.tempKf(indexPath)
        cell.windSpeedLabel.text = forecastViewModel?.windSpeed(indexPath)
        cell.winCourseLabel.text = forecastViewModel?.windCourse(indexPath)
        forecastViewModel?.iconUrl(indexPath) {
            [weak cell] image in
            cell?.iconView.image = image
        }
    }

}

//extension ForecastViewController: UIScrollViewDelegate {
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        let pageWidth = (itemCellSize.width + itemCellsGap)
//        let itemIndex = (targetContentOffset.pointee.x) / pageWidth
//        targetContentOffset.pointee.x = round(itemIndex) * pageWidth - (itemCellsGap / 2)
//    }
//}

extension ForecastViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecastViewModel?.forecastCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ForecastCollectionViewCell", for: indexPath) as! ForecastCollectionViewCell
        configureCell(cell, indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemCellSize
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return itemCellSize
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return itemCellsGap
    }
    
}
