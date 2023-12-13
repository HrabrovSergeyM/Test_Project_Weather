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
        City(name: "Washington", location: CLLocation(latitude: 38.895110, longitude: -77.036370))
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
