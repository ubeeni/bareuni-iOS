//
//  CommunityViewModel.swift
//  Bareuni
//
//  Created by 김유빈 on 2023/09/03.
//

import Foundation
import Combine
import Moya

class CommunityViewModel: ObservableObject {
    @Published var community = [CommunityResult]()
    private let provider = MoyaProvider<BareuniAPI>()
    
    init() {
        fetchCommunity()
    }
    
    func fetchCommunity() {
        provider.request(.getCommunity) { result in
            switch result {
            case let .success(response):
                do {
                    let communityResponse = try response.map(CommunityModel.self)
                    self.community = communityResponse.result
                } catch {
                    print("에러 Error parsing response: \(error)")
                }
                
            case let .failure(error):
                print("Network request failed: \(error)")
            }
        }
    }
}
