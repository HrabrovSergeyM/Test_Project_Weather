//
//  CurrentWeatherCollectionViewCell.swift
//  Test_Project_Weather
//
//  Created by Sergey Hrabrov on 13.12.2023.
//

import UIKit
import WeatherKit

class CurrentWeatherCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "CurrentWeatherCollectionViewCell"
    
    private var cellBackgroundColor: UIColor = .clear {
        didSet {
            contentView.backgroundColor = cellBackgroundColor
        }
    }
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 62, weight: .medium)
        return label
    }()
    
    private let conditionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 34, weight: .regular)
        return label
    }()
    
    private let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = backgroundColor
        contentView.layer.cornerRadius = 12
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 0.3
        layer.masksToBounds = false
        
        contentView.addSubviews(tempLabel, conditionLabel, icon)
        
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("CurrentWeatherCollectionViewCell unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            tempLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            tempLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            tempLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            icon.heightAnchor.constraint(equalToConstant: 55),
            icon.widthAnchor.constraint(equalToConstant: 55),
            icon.topAnchor.constraint(equalTo: tempLabel.bottomAnchor),
            icon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            conditionLabel.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 10),
            conditionLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor),
            conditionLabel.heightAnchor.constraint(equalToConstant: 80),
            conditionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 15),
            conditionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        conditionLabel.text = nil
        tempLabel.text = nil
        icon.image = nil
    }
    
    public func configure(with vm: CurrentWeatherCollectionViewCellViewModel) {
        cellBackgroundColor = UIColor.color(forWeatherType: vm.condition)
        icon.image = UIImage(systemName: vm.iconName)
        conditionLabel.text = vm.condition.description
        tempLabel.text = vm.temperature
    }
}
