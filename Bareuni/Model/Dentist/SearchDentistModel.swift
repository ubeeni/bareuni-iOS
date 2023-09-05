//
//  SearchDentistModel.swift
//  Bareuni
//
//  Created by 황인성 on 2023/09/05.
//

import Foundation

// MARK: - Ryak
struct SearchDentistResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [SearchDentist]
}

// MARK: - Result
struct SearchDentist: Codable, Identifiable, Hashable {
    let hospitalIdx: Int64
    let hosName, address: String
    let score: Double
    let reviewCnt: Int64
    let summary: String
//    let images: String
    
    var id: Int64 { hospitalIdx } // Using hospitalIdx as the id
}
