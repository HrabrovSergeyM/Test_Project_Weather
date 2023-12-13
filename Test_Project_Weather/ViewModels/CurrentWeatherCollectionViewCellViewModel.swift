//
//  CurrentWeatherCollectionViewCellViewModel.swift
//  Test_Project_Weather
//
//  Created by Sergey Hrabrov on 13.12.2023.
//

import WeatherKit
import Foundation

struct CurrentWeatherCollectionViewCellViewModel {
    private let model: CurrentWeather
    
    init(model: CurrentWeather) {
        self.model = model
    }
    
    public var condition: WeatherCondition {
        return model.condition
    }
    
    public var temperature: String {
        return model.temperature.description
    }
    
    public var iconName: String {
        return model.symbolName
    }
}
