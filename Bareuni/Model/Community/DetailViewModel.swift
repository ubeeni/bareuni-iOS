//
//  DetailViewModel.swift
//  Bareuni
//
//  Created by 김유빈 on 2023/09/05.
//

import Foundation
import Combine
import Moya

class DetailViewModel: ObservableObject {
    @Published var detail: PostResult?
    private let provider = MoyaProvider<BareuniAPI>()
    
    init() {
        fetchCommunityDetail()
    }
    
    func fetchCommunityDetail() {
        provider.request(.getCommunityDetail) { result in
            switch result {
            case let .success(response):
                do {
                    let communitydetailResponse = try response.map(PostModel.self)
                    self.detail = communitydetailResponse.result
                } catch {
                    print("Error parsing response: \(error)")
                }
                
            case let .failure(error):
                print("Network request failed: \(error)")
            }
        }
    }
}
