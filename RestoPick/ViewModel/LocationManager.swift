//
//  LocationManager.swift
//  RestoPick
//
//  Created by ZML on 2023/06/25.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager: CLLocationManager?
    @Published var showErrorAlert = false
    @Published var latitude: Double = 35.6812
    @Published var longitude: Double = 139.7671

    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
    }

    
    func requestLocation() {
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
           
            self.latitude = location.coordinate.latitude
            self.longitude = location.coordinate.longitude
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get location: \(error)")
        showErrorAlert = true 
    }
}
