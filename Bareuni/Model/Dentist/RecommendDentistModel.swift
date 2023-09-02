//
//  RecommendDentistModel.swift
//  Bareuni
//
//  Created by 황인성 on 2023/08/28.
//

import Foundation

// MARK: - RecommendDentist
struct RecommendDentistResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [RecommendDentist]
}

// MARK: - Result
struct RecommendDentist: Codable, Identifiable {
    let hospitalIdx: Int64
    let hosName, address: String
    let score: Double
    let reviewCnt: Int64
    let summary: String
    
    var id: Int64 { hospitalIdx } // Using hospitalIdx as the id
}

