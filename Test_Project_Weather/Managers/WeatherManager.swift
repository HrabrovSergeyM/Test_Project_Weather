//
//  WeatherManager.swift
//  Test_Project_Weather
//
//  Created by Sergey Hrabrov on 11.12.2023.
//

import Foundation
import CoreLocation
import WeatherKit

final class WeatherManager {
    static let shared = WeatherManager()
    
    let service = WeatherService.shared
    
    public private(set) var currentlyWeather: CurrentWeather?
    public private(set) var hourlyWeather: [HourWeather] = []
    public private(set) var dailyWeather: [DayWeather] = []
    
    private init() {
        
    }
    
    public func getWeather(for location: CLLocation, completion: @escaping () -> Void) {
        Task {
            do {
                let result = try await service.weather(for: location)
                
                self.currentlyWeather = result.currentWeather
                self.hourlyWeather = result.hourlyForecast.forecast
                self.dailyWeather = result.dailyForecast.forecast
                
                print("Current: \(result.currentWeather)")
                
                completion()
            } catch {
                print(String(describing: error))
            }
        }
    }
}
