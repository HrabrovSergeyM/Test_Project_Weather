//
//  CurrentWeatherCollectionViewCell.swift
//  Test_Project_Weather
//
//  Created by Sergey Hrabrov on 13.12.2023.
//

import UIKit

class CurrentWeatherCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "CurrentWeatherCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("CurrentWeatherCollectionViewCell unsupported")
    }
}
