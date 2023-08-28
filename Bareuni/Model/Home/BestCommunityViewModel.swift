//
//  BestCommunityViewModel.swift
//  Bareuni
//
//  Created by 김유빈 on 2023/08/28.
//

import Foundation
import Combine
import Moya

class BestCommunityViewModel: ObservableObject {
    @Published var bestCommunity = [BestCommunityResult]()
    private let provider = MoyaProvider<BareuniAPI>()
    
    init() {
        fetchBestCommunity()
    }
    
    func fetchBestCommunity() {
        provider.request(.getBestCommunity) { result in
            switch result {
            case let .success(response):
                do {
                    let bestCommunityResponse = try response.map(BestCommunityModel.self)
                    self.bestCommunity = bestCommunityResponse.result
                } catch {
                    print("Error parsing response: \(error)")
                }
                
            case let .failure(error):
                print("Network request failed: \(error)")
            }
        }
    }
}
