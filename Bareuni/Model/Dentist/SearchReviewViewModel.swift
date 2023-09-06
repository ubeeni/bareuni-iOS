//
//  SearchReviewViewModel.swift
//  Bareuni
//
//  Created by 황인성 on 2023/09/06.
//

import Foundation
import Combine
import Moya

class SearchReviewViewModel: ObservableObject {
    @Published var isSuccess = false
    @Published var searchReviews = [SearchReview]()
    private let provider = MoyaProvider<DentistAPI>()
    @Published var keyword = ""

    
    init() {
        fetchSearchReviews()
    }
    
    //    func fetchSearchDentists() {
    //        provider.request(.getSearchDentist(keyword: keyword)) { result in
    //            switch result {
    //            case let .success(response):
    //                do {
    //                    let searchDentistResponse = try response.map(SearchDentistResponse.self)
    //                    self.searchDentists = searchDentistResponse.result
    //                } catch {
    //                    print("Error parsing response: \(error)")
    //                }
    //
    //            case let .failure(error):
    //                print("Network request failed: \(error)")
    //            }
    //        }
    //    }
    func fetchSearchReviews() {
        provider.request(.getSearchReview(keyword: keyword)) { result in
            switch result {
            case let .success(response):
                do {
                    // Convert response data to a string for debugging
                    if let responseString = String(data: response.data, encoding: .utf8) {
//                        print("Response Data:\n\(responseString)")
                    } else {
                        print("Response Data is not a valid UTF-8 string.")
                    }
                    
                    let searchReviewResponse = try response.map(SearchReviewResponse.self)
                    self.searchReviews = searchReviewResponse.result
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
