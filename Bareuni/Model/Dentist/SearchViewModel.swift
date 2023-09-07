//
//  SearchViewModel.swift
//  Bareuni
//
//  Created by 황인성 on 2023/09/07.
//

import Foundation
import Combine
import Moya

class SearchViewModel: ObservableObject {
    @Published var isSuccessReview = false
    @Published var searchReviews = [SearchReview]()
    private let provider = MoyaProvider<DentistAPI>()
    @Published var keyword = ""
    
    @Published var isSuccessDentist = false
    @Published var searchDentists = [SearchDentist]()
    
    

    
    init() {
        fetchSearchReviews()
        fetchSearchDentists()
    }
    
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
                    self.isSuccessReview = true
                } catch {
                    print("Error parsing response: \(error)")
                    self.isSuccessReview = false
                }
                
            case let .failure(error):
                print("Network request failed: \(error)")
            }
        }
    }
    
    func fetchSearchDentists() {
        provider.request(.getSearchDentist(keyword: keyword)) { result in
            switch result {
            case let .success(response):
                do {
                    // Convert response data to a string for debugging
                    if let responseString = String(data: response.data, encoding: .utf8) {
                        print("Response Data:\n\(responseString)")
                    } else {
                        print("Response Data is not a valid UTF-8 string.")
                    }
                    
                    let searchDentistResponse = try response.map(SearchDentistResponse.self)
                    self.searchDentists = searchDentistResponse.result
                    self.isSuccessDentist = true
                } catch {
                    print("Error parsing response: \(error)")
                    self.isSuccessDentist = false
                }
                
            case let .failure(error):
                print("Network request failed: \(error)")
            }
        }
    }
    
}
