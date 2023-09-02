//
//  BestDentistViewModel.swift
//  Bareuni
//
//  Created by 김유빈 on 2023/08/28.
//

import Foundation
import Combine
import Moya

class BestDentistViewModel: ObservableObject {
    @Published var bestDentists = [BestDentistResult]()
    private let provider = MoyaProvider<BareuniAPI>()
    
    init() {
        fetchBestDentists()
    }
    
    func fetchBestDentists() {
        provider.request(.getBestDentist) { result in
            switch result {
            case let .success(response):
                do {
                    let bestDentistResponse = try response.map(BestDentistModel.self)
                    self.bestDentists = bestDentistResponse.result
                } catch {
                    print("Error parsing response: \(error)")
                }
                
            case let .failure(error):
                print("Network request failed: \(error)")
            }
        }
    }
}
