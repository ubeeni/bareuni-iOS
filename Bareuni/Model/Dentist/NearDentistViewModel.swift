//
//  DetailDentistViewModel.swift
//  Bareuni
//
//  Created by 황인성 on 2023/09/02.
//

//import Foundation
//import CoreLocation
//import Combine
//import Moya
//
//class NearDentistViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
//    
//    private var locationManager = CLLocationManager()
//    
//    @Published var currentLocation: CLLocation?
//    @Published var currentAddress = ""
//    
//    @Published var nearDentists = [NearDentist]()
//    private let provider = MoyaProvider<DentistAPI>()
////    @Published var selectedCities = [String]()
//    
//    override init() {
//        super.init()
//        setupLocationManager()
////        fetchNearDentists()
//    }
//    
//    func fetchNearDentists() {
//        provider.request(.getNearDentist(address: currentAddress)) { result in
//            switch result {
//            case let .success(response):
//                do {
//                    let nearDentistResponse = try response.map(NearDentistResponse.self)
//                    self.nearDentists = nearDentistResponse.result
//                } catch {
//                    print("Error parsing response: \(error)")
//                }
//                
//            case let .failure(error):
//                print("Network request failed: \(error)")
//            }
//        }
//    }
//    
//    private func setupLocationManager() {
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.startUpdatingLocation()
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.last {
//            currentLocation = location
//            reverseGeocodeLocation(location)
//        }
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print("Location error: \(error.localizedDescription)")
//    }
//
//    
//    private func reverseGeocodeLocation(_ location: CLLocation) {
//        let geocoder = CLGeocoder()
//        geocoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in
//            guard let self = self else { return }
//            
//            if let error = error {
//                print("Reverse geocode error: \(error.localizedDescription)")
//                return
//            }
//            
//            if let placemark = placemarks?.first {
//                var addressComponents = [String]()
//                
//                if let locality = placemark.locality {
//                    addressComponents.append(locality) // 시 (City)
//                }
//                
////                if let administrativeArea = placemark.administrativeArea {
////                    addressComponents.append(administrativeArea) // 구 (District)
////                }
//                
//                if let subLocality = placemark.subLocality {
//                    addressComponents.append(subLocality) // 동 (Neighborhood)
//                }
//                
//                self.currentAddress = addressComponents.joined(separator: " ")
//            }
//        }
//    }
//}

