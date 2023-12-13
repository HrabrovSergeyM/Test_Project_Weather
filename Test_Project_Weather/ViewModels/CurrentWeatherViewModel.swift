//
//  CurrentWeatherViewModel.swift
//  Test_Project_Weather
//
//  Created by Sergey Hrabrov on 13.12.2023.
//

import Foundation

enum WeatherViewModel {
    case current(vm: CurrentWeatherCollectionViewCellViewModel)
    case hourly(vms: [HourlyWeatherCollectionViewCellViewModel])
    case daily(vms: [DailyWeatherCollectionViewCellViewModel])
}
