//
//  RecommendDentistViewModel.swift
//  Bareuni
//
//  Created by 황인성 on 2023/08/28.
//

import Foundation
import CoreLocation
import Combine
import Moya


class RecommendDentistViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var recommendedDentists = [RecommendDentist]()
    private let provider = MoyaProvider<DentistAPI>()
    @Published var selectedCities = [String]()
    @Published var isSuccess1 = true
    @Published var isSuccess2 = true
    
    private var locationManager = CLLocationManager()
    
    @Published var currentLocation: CLLocation?
    @Published var currentAddress = ""
    
    @Published var nearDentists = [RecommendDentist]()
//    @Published var selectedCities = [String]()
    
    override init() {
        super.init()
        setupLocationManager()
//        fetchNearDentists()
    }
    
    func fetchRecommendedDentists() {
        let cityPath = selectedCities.joined(separator: ",")
        provider.request(.getRecommendDentist(cityPath: cityPath)) { result in
            switch result {
            case let .success(response):
                do {
                    let recommendDentistResponse = try response.map(RecommendDentistResponse.self)
                    self.recommendedDentists = recommendDentistResponse.result
                    self.isSuccess1 = true
                } catch {
                    print("Error parsing response: \(error)")
                    self.isSuccess1 = false
                }
                
            case let .failure(error):
                print("Network request failed: \(error)")
            }
        }
    }
    
    
    func fetchNearDentists() {
        provider.request(.getNearDentist(address: currentAddress)) { result in
            switch result {
            case let .success(response):
                do {
                    let nearDentistResponse = try response.map(RecommendDentistResponse.self)
                    self.nearDentists = nearDentistResponse.result
                } catch {
                    print("Error parsing response: \(error)")
                }
                
            case let .failure(error):
                print("Network request failed: \(error)")
            }
        }
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            currentLocation = location
            reverseGeocodeLocation(location)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location error: \(error.localizedDescription)")
    }

    
    private func reverseGeocodeLocation(_ location: CLLocation) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in
            guard let self = self else { return }
            
            if let error = error {
                print("Reverse geocode error: \(error.localizedDescription)")
                return
            }
            
            if let placemark = placemarks?.first {
                var addressComponents = [String]()
                
                if let locality = placemark.locality {
                                if locality == "서울특별시" {
                                    addressComponents.append("서울") // Change "서울특별시" to "서울"
                                } else {
                                    addressComponents.append(locality) // Keep other localities as is
                                }
                            }
                
//                if let administrativeArea = placemark.administrativeArea {
//                    addressComponents.append(administrativeArea) // 구 (District)
//                }
                
                if let subLocality = placemark.subLocality {
                    addressComponents.append(subLocality) // 동 (Neighborhood)
                }
                
                self.currentAddress = addressComponents.joined(separator: " ")
            }
        }
    }
}




