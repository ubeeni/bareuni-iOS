//
//  ReviewViewModel2.swift
//  Bareuni
//
//  Created by 황인성 on 2023/09/04.
//

import Foundation
import Combine
import Moya

class DentistReviewViewModel: ObservableObject {
    @Published var dentistReviews = [DentistReview]()
    private let provider = MoyaProvider<DentistAPI>()
    
    init() {
        fetchDetailDentists()
    }
    
    func fetchDetailDentists() {
        provider.request(.getDentistReview) { result in
            switch result {
            case let .success(response):
                do {
                    let dentistReviewResponse = try response.map(DentistReviewResponse.self)
                    self.dentistReviews = dentistReviewResponse.result
                } catch {
                    print("Error parsing response: \(error)")
                }
                
            case let .failure(error):
                print("Network request failed: \(error)")
            }
        }
    }
}
