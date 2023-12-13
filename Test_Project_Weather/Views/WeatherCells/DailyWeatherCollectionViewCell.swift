//
//  DailyWeatherCollectionViewCell.swift
//  Test_Project_Weather
//
//  Created by Sergey Hrabrov on 13.12.2023.
//

import UIKit

class DailyWeatherCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "DailyWeatherCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .purple
    }
    
    required init?(coder: NSCoder) {
        fatalError("DailyWeatherCollectionViewCell unsupported")
    }
}
