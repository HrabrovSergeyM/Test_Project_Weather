//
//  FavoritesViewController.swift
//  Test_Project_Weather
//
//  Created by Sergey Hrabrov on 11.12.2023.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    private let favoritesView = FavoritesView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Favorites"
        
        view.addSubview(favoritesView)
        
        NSLayoutConstraint.activate([
            favoritesView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            favoritesView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            favoritesView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            favoritesView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}
