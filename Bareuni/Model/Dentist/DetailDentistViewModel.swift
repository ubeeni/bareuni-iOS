//
//  DetailDentistViewModel.swift
//  Bareuni
//
//  Created by 황인성 on 2023/09/02.
//

import Foundation
import Combine
import Moya

class DetailDentistViewModel: ObservableObject {
    @Published var detailDentist: DetailDentist? // Use an optional DetailDentist here
    private let provider = MoyaProvider<DentistAPI>()
    @Published var hospitalIdx: Int = 0
    
    init() {
//        fetchDetailDentists()
    }
    
    func fetchDetailDentists() {
        provider.request(.getDetailDentist(hospitalIdx: hospitalIdx)) { result in
            switch result {
            case let .success(response):
                do {
                    let detailDentistResponse = try response.map(DetailDentistResponse.self)
                    self.detailDentist = detailDentistResponse.result
                } catch {
                    print("Error parsing response: \(error)")
                }
                
            case let .failure(error):
                print("Network request failed: \(error)")
            }
        }
    }
    
    func updateHospitalIdx(newHospitalIdx: Int) {
        hospitalIdx = newHospitalIdx
        }
}
