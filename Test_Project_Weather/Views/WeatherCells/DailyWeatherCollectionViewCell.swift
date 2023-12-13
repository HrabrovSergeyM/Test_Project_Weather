//
//  DailyWeatherCollectionViewCell.swift
//  Test_Project_Weather
//
//  Created by Sergey Hrabrov on 13.12.2023.
//

import UIKit

class DailyWeatherCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "DailyWeatherCollectionViewCell"
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 22, weight: .bold)
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
        
        contentView.backgroundColor = UIColor.systemGray6
               contentView.layer.cornerRadius = 8
               contentView.layer.borderWidth = 1
               contentView.layer.borderColor = UIColor.clear.cgColor
               contentView.layer.masksToBounds = true
               
               layer.shadowColor = UIColor.black.cgColor
               layer.shadowOffset = CGSize(width: 0, height: 2)
               layer.shadowRadius = 4.0
               layer.shadowOpacity = 0.3
               layer.masksToBounds = false
        
        contentView.addSubviews(timeLabel, icon, tempLabel)
        
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("DailyWeatherCollectionViewCell unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            timeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            timeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 4),
            timeLabel.heightAnchor.constraint(equalToConstant: 40),
            
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            icon.leftAnchor.constraint(equalTo: timeLabel.rightAnchor, constant: 10),
            icon.heightAnchor.constraint(equalToConstant: 32),
            
            tempLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            tempLabel.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 20),
            tempLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        tempLabel.text = nil
        timeLabel.text = nil
        icon.image = nil
    }
    
    public func configure(with vm: DailyWeatherCollectionViewCellViewModel) {
        icon.image = UIImage(systemName: vm.iconName)
        tempLabel.text = vm.temperature
        timeLabel.text = vm.day
    }
}
