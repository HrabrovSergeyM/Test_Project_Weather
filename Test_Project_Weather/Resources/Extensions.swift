//
//  Extensions.swift
//  Test_Project_Weather
//
//  Created by Sergey Hrabrov on 11.12.2023.
//

import UIKit
import WeatherKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}

extension UIColor {
    static func color(forWeatherType weatherType: WeatherCondition) -> UIColor {
        switch weatherType {
        case .blizzard, .blowingDust, .blowingSnow, .breezy, .frigid, .hurricane, .isolatedThunderstorms, .snow, .strongStorms, .tropicalStorm, .windy, .wintryMix:
            return UIColor.blue.withAlphaComponent(0.2)
        case .hot, .sunFlurries, .sunShowers:
            return UIColor.systemYellow.withAlphaComponent(0.2)
        case .cloudy, .foggy, .haze, .mostlyClear, .mostlyCloudy, .partlyCloudy, .smoky:
            return UIColor.systemGray.withAlphaComponent(0.2)
        case .drizzle, .freezingDrizzle, .rain, .sleet, .thunderstorms:
            return UIColor.systemTeal.withAlphaComponent(0.2)
        case .flurries, .heavyRain, .heavySnow, .scatteredThunderstorms:
            return UIColor.systemPurple.withAlphaComponent(0.2)
        case .freezingRain:
            return UIColor.systemIndigo.withAlphaComponent(0.2)
        case .hail:
            return UIColor.systemGray.withAlphaComponent(0.2)
        case .clear:
            return UIColor.lightGray.withAlphaComponent(0.1)
        @unknown default:
            return UIColor.systemGray
        }
    }
}
