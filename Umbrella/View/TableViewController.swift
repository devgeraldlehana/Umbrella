//
//  TableViewController.swift
//  Umbrella
//
//  Created by Gerald.Lehana on 2019/12/12.
//  Copyright © 2019 Nigrescent. All rights reserved.
//

import UIKit
import CoreLocation

class TableViewController: UITableViewController, CLLocationManagerDelegate {
    
    fileprivate var locationManager:CLLocationManager!
    fileprivate var viewModel:ViewModelWeather!
    
    // MARK: - Views -
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInsetAdjustmentBehavior = .never
        locationManager = setUpLocationManager()
        viewModel = setUpViewModel()
    }
    
    fileprivate func setUpViewModel() -> ViewModelWeather{
        let webService = ServerAPI()
        return ViewModelWeather(service: webService)
    }
    
    fileprivate func updateUiComponents() {
        self.tableView.backgroundColor = viewModel.viewBackgroundColor
        self.tableView.reloadData()
    }
    
    fileprivate func presentAlert(withManager locationManager:CLLocationManager,
                                  withViewModel viewModel:ViewModelWeather,
                                  withMessage message:String) {
        let alert = UIAlertController(title: viewModel.genericErrorTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: viewModel.negativeAlertButton, style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: viewModel.positiveAlertButton, style: .default, handler: { _ in
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Location Services -
    fileprivate func setUpLocationManager() -> CLLocationManager {
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 10000
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        return locationManager
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        viewModel.resetCollection()
        self.locationManager.stopUpdatingLocation()
        if let lat = locations.first?.coordinate.latitude, let lon = locations.first?.coordinate.longitude {
            viewModel.getCurrent(withLong: lon, withLat: lat) { errorMessage in
                if let message = errorMessage {
                    self.presentAlert(withManager: self.locationManager, withViewModel: self.viewModel, withMessage: message)
                } else {
                    self.updateUiComponents()
                }
            }
        } else {
            self.presentAlert(withManager: self.locationManager, withViewModel: self.viewModel, withMessage: viewModel.genericErrorMessage)
        }
    }
    
    // MARK: - Table view data source -
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = viewModel.getCellViewModel(withIndexPath: indexPath)
        let cell = UITableViewCell.dequeueCell(self.tableView, indexPath, cellViewModel.cellIdentitifier)
        cell.decorateUsingViewModel(viewModel: cellViewModel.cellData)
        return cell
    }
    
}
