//
//  WeatherViewController.swift
//  Test_Project_Weather
//
//  Created by Sergey Hrabrov on 11.12.2023.
//

import UIKit

class WeatherViewController: UIViewController {
    
    private let currentWeatherView = CurrentWeatherView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Weather"
        setupView()
        getLocation()
       
    }
    
    private func getLocation() {
        LocationManager.shared.getCurrentLocation { location in
            print(String(describing: location))
            
        }
    }
    
    private func setupView() {
        view.addSubview(currentWeatherView)
        
        NSLayoutConstraint.activate([
            currentWeatherView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            currentWeatherView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            currentWeatherView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            currentWeatherView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
