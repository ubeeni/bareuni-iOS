//
//  DetailDentistModel.swift
//  Bareuni
//
//  Created by 황인성 on 2023/09/02.
//

import Foundation

// MARK: - RecommendDentist
struct NearDentistResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [NearDentist]
}

// MARK: - Result
struct NearDentist: Codable {
    let hospitalIdx: Int
    let hosName, address: String
    let score: Double
    let reviewCnt: Int
    let summary: String
//    let image: String
}
