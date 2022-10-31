//
//  LocationManagers.swift
//  UberSwiftUIDemo
//
//  Created by Macbook on 22.09.2022.
//

import CoreLocation

class LocationManagers: NSObject, ObservableObject {
    private let locationManagers = CLLocationManager()
    
    override init() {
        super.init()
        locationManagers.delegate = self
        locationManagers.desiredAccuracy = kCLLocationAccuracyBest
        locationManagers.requestWhenInUseAuthorization()
        locationManagers.startUpdatingLocation()
    }
}

extension LocationManagers: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard !locations.isEmpty else { return }
         print(locations.first)
        locationManagers.startUpdatingLocation()
    }
}
