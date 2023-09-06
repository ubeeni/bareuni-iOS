//
//  RecommendDentistViewModel.swift
//  Bareuni
//
//  Created by 황인성 on 2023/08/28.
//

import Foundation
import Combine
import Moya


class RecommendDentistViewModel: ObservableObject {
    @Published var recommendedDentists = [RecommendDentist]()
    private let provider = MoyaProvider<DentistAPI>()
    @Published var selectedCities = [String]()
    @Published var isSuccess = true
    
    init() {
//        fetchRecommendedDentists()
    }
    
    func fetchRecommendedDentists() {
        let cityPath = selectedCities.joined(separator: ",")
        provider.request(.getRecommendDentist(cityPath: cityPath)) { result in
            switch result {
            case let .success(response):
                do {
                    let recommendDentistResponse = try response.map(RecommendDentistResponse.self)
                    self.recommendedDentists = recommendDentistResponse.result
                    self.isSuccess = true
                } catch {
                    print("Error parsing response: \(error)")
                    self.isSuccess = false
                }
                
            case let .failure(error):
                print("Network request failed: \(error)")
            }
        }
    }
}



