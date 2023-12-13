//
//  ViewController.swift
//  Test_Project_Weather
//
//  Created by Sergey Hrabrov on 11.12.2023.
//

import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }

    private func setupTabs() {
        let favoritesVC = FavoritesViewController()
        let weatherVC = WeatherViewController()
        
        for vc in [weatherVC, favoritesVC] {
            vc.navigationItem.largeTitleDisplayMode = .automatic
        }
        
        let navFavorites = UINavigationController(rootViewController: favoritesVC)
        let navWeather = UINavigationController(rootViewController: weatherVC)
        
        navWeather.tabBarItem = UITabBarItem(title: "Weather",
                                               image: UIImage(systemName: "thermometer.low"),
                                               tag: 1)
        navFavorites.tabBarItem = UITabBarItem(title: "Favorites",
                                               image: UIImage(systemName: "star"),
                                               tag: 2)
        
        for nav in [navWeather, navFavorites] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers([navWeather, navFavorites], animated: true)
    }
    
}

