//
//  LocationManager.swift
//  Test_Project_Weather
//
//  Created by Sergey Hrabrov on 11.12.2023.
//

import CoreLocation
import Foundation

final class LocationManager: NSObject, CLLocationManagerDelegate {

    private let manager = CLLocationManager()

    static let shared = LocationManager()

    private var locationFetchCompletion: ((CLLocation) -> Void)?

    private var location: CLLocation? {
        didSet {
            guard let location else {
                return
            }
            locationFetchCompletion?(location)
        }
    }

    public func getCurrentLocation(completion: @escaping (CLLocation) -> Void) {

        self.locationFetchCompletion = completion

        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        self.location = location
        manager.stopUpdatingLocation()
    }
}
