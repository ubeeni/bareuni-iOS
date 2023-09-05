//
//  SearchDentistViewModel.swift
//  Bareuni
//
//  Created by 황인성 on 2023/09/05.
//

import Foundation
import Combine
import Moya

class SearchDentistViewModel: ObservableObject {
    @Published var searchDentists = [SearchDentist]()
    private let provider = MoyaProvider<DentistAPI>()
    @Published var keyword = "교정"
    
    init() {
        fetchSearchDentists()
    }
    
    func fetchSearchDentists() {
        provider.request(.getSearchDentist(keyword: keyword)) { result in
            switch result {
            case let .success(response):
                do {
                    let searchDentistResponse = try response.map(SearchDentistResponse.self)
                    self.searchDentists = searchDentistResponse.result
                } catch {
                    print("Error parsing response: \(error)")
                }
                
            case let .failure(error):
                print("Network request failed: \(error)")
            }
        }
    }
}
