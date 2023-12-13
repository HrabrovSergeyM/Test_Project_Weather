//
//  FavoritesViewController.swift
//  Test_Project_Weather
//
//  Created by Sergey Hrabrov on 11.12.2023.
//

import UIKit
import CoreLocation

class FavoritesViewController: UIViewController {
    
    private let favoritesView = FavoritesView()
    
    private var cities: [City] = [
        City(name: "London", location: CLLocation(latitude: 51.509865, longitude: -0.118092)),
        City(name: "Berlin", location: CLLocation(latitude: 52.520008, longitude: 13.404954)),
        City(name: "Tokyo", location: CLLocation(latitude: 35.689487, longitude: 139.691711)),
        City(name: "Beijing", location: CLLocation(latitude: 39.904200, longitude: 116.407396)),
        City(name: "Washington", location: CLLocation(latitude: 38.895110, longitude: -77.036370)),
        City(name: "Paris", location: CLLocation(latitude: 48.856613, longitude: 2.352222)),
        City(name: "Rome", location: CLLocation(latitude: 41.902782, longitude: 12.496366)),
        City(name: "Madrid", location: CLLocation(latitude: 40.416775, longitude: -3.703790)),
        City(name: "Athens", location: CLLocation(latitude: 37.983810, longitude: 23.727539)),
        City(name: "Prague", location: CLLocation(latitude: 50.075539, longitude: 14.437800)),
        City(name: "Seoul", location: CLLocation(latitude: 37.566536, longitude: 126.977966)),
        City(name: "Bangkok", location: CLLocation(latitude: 13.756331, longitude: 100.501762)),
        City(name: "Mumbai", location: CLLocation(latitude: 19.076090, longitude: 72.877426)),
        City(name: "Shanghai", location: CLLocation(latitude: 31.230416, longitude: 121.473701)),
        City(name: "Istanbul", location: CLLocation(latitude: 41.008240, longitude: 28.978359)),
        City(name: "Cairo", location: CLLocation(latitude: 30.033018, longitude: 31.209618)),
        City(name: "Lagos", location: CLLocation(latitude: 6.524379, longitude: 3.379206)),
        City(name: "Nairobi", location: CLLocation(latitude: -1.286389, longitude: 36.817223)),
        City(name: "Johannesburg", location: CLLocation(latitude: -26.204103, longitude: 28.047305)),
        City(name: "Casablanca", location: CLLocation(latitude: 33.573110, longitude: -7.589843))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Favorites"
        
        favoritesView.delegate = self
        view.addSubview(favoritesView)
        
        NSLayoutConstraint.activate([
            favoritesView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            favoritesView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            favoritesView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            favoritesView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        favoritesView.configure(with: cities)
    }
}

extension FavoritesViewController: FavoritesViewDelegate {
    func didSelectCity(_ city: City) {
        let weatherVC = WeatherViewController()
        weatherVC.selectedLocation = city.location
        weatherVC.title = city.name
        navigationController?.pushViewController(weatherVC, animated: true)
    }
}
