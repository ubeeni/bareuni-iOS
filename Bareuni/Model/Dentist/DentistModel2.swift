//
//  DentistModel2.swift
//  Bareuni
//
//  Created by 황인성 on 2023/08/17.
//

import Foundation

// MARK: - DataModel
struct hospialBestResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [Hospital]
}

// MARK: - Result
struct Hospital: Codable {
    let hospitalIdx: Int
    let hosName, address: String
    let score, reviewent: Int
    let summary: String?
}
