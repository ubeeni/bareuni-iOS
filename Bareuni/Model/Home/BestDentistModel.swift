//
//  BestDentistModel.swift
//  Bareuni
//
//  Created by 김유빈 on 2023/08/27.
//

import Foundation

struct BestDentistModel: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [BestDentistResult]
}

struct BestDentistResult: Codable, Identifiable {
    var id: Int64 { hospitalIdx }
    let hospitalIdx: Int64
    let hosName, address: String
    let score: Double
    let reviewCnt: Int64
//    let summary: String
    let images: String
}
