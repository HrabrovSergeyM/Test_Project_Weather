//
//  WeatherViewController.swift
//  Test_Project_Weather
//
//  Created by Sergey Hrabrov on 11.12.2023.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {

    private let currentWeatherView = CurrentWeatherView()
    var selectedLocation: CLLocation?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Weather"
        setupView()
        getLocation()
    }

    private func getLocation() {
        if let selectedLocation = selectedLocation {
            WeatherManager.shared.getWeather(for: selectedLocation) { [weak self] in
                DispatchQueue.main.async {
                    guard let currentWeather = WeatherManager.shared.currentlyWeather else {
                        return
                    }
                    self?.currentWeatherView.configure(with: [
                        .current(vm: .init(model: currentWeather)),
                        .hourly(vms: WeatherManager.shared.hourlyWeather.compactMap({.init(model: $0)})),
                        .daily(vms: WeatherManager.shared.dailyWeather.compactMap({.init(model: $0)}))
                    ])
                }
            }
        } else {
            LocationManager.shared.getCurrentLocation { [weak self] location in
                WeatherManager.shared.getWeather(for: location) { [weak self] in
                    DispatchQueue.main.async {
                        guard let currentWeather = WeatherManager.shared.currentlyWeather else {
                            return
                        }
                        self?.currentWeatherView.configure(with: [
                            .current(vm: .init(model: currentWeather)),
                            .hourly(vms: WeatherManager.shared.hourlyWeather.compactMap({.init(model: $0)})),
                            .daily(vms: WeatherManager.shared.dailyWeather.compactMap({.init(model: $0)}))
                        ])
                    }
                }
            }
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
