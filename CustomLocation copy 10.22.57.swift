//
//  CustomLocation.swift
//  LoginPageApplication
//
//  Created by Macbook on 24.11.2022.
//

import Foundation
import CoreLocation

struct CustomLocation: Identifiable {
    let id = UUID()
    let latilude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latilude, longitude: longitude)
    }
}
