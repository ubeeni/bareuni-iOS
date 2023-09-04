//
//  DetailDentistModel.swift
//  Bareuni
//
//  Created by 황인성 on 2023/09/02.
//

import Foundation

// MARK: - DetailDentist
struct DetailDentistResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: DetailDentist?
}

// MARK: - Result
struct DetailDentist: Codable, Identifiable, Hashable {
    let hospitalIdx: Int64
    let hosName: String
    let bookable: Bool
    let closedDay: [String]
    let todayClosed: Bool
    let address, keywords, openTime, lunchTime: String
    let content, telephone: String
//    let image: String
    let totalScore: Double
    let reviewCnt: Int
    let treatment: String
    let treatmentRate: Double
    let service: String
    let serviceRate: Double
    let equipment: String
    let equipmentRate: Double
    
    var id: Int64 { hospitalIdx } // Using hospitalIdx as the id
}


