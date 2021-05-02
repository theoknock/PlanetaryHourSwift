//
//  LocationViewModel.swift
//  PlanetaryHourSwift
//
//  Created by Xcode Developer on 5/2/21.
//

import Foundation
import CoreLocation

class LocationViewModel: NSObject, ObservableObject {
    @Published var userLocation: CLLocation = CLLocation(latitude: 0.0, longitude: 0.0)
    private var locationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
    }
}

extension LocationViewModel: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .denied {
            userLocation = CLLocation(latitude: 0.0, longitude: 0.0)
        } else if status == .authorizedAlways || status == .authorizedWhenInUse {
            manager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        userLocation = location
    }
}
