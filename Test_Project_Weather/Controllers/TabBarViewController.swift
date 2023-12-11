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
        let searchVC = SearchViewController()
        let weatherVC = WeatherViewController()
        
        for vc in [weatherVC, favoritesVC, searchVC] {
            vc.navigationItem.largeTitleDisplayMode = .automatic
        }
        
        let navFavorites = UINavigationController(rootViewController: favoritesVC)
        let navSearch = UINavigationController(rootViewController: searchVC)
        let navWeather = UINavigationController(rootViewController: weatherVC)
        
        navWeather.tabBarItem = UITabBarItem(title: "Weather",
                                               image: UIImage(systemName: "thermometer.low"),
                                               tag: 1)
        navFavorites.tabBarItem = UITabBarItem(title: "Favorites",
                                               image: UIImage(systemName: "star"),
                                               tag: 2)
        navSearch.tabBarItem = UITabBarItem(title: "Search",
                                               image: UIImage(systemName: "magnifyingglass"),
                                               tag: 3)
        
        for nav in [navWeather, navFavorites, navSearch] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers([navWeather, navFavorites, navSearch], animated: true)
    }
    
}

