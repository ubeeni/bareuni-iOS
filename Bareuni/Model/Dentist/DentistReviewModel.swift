//
//  ReviewModel2.swift
//  Bareuni
//
//  Created by 황인성 on 2023/09/04.
//

import Foundation

// MARK: - Review
struct DentistReviewResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [DentistReview]
}

// MARK: - Result
struct DentistReview: Codable {
    let reviewIdx: Int
    let createdAt: String
//    let updatedAt: JSONNull?
    let user: dentistUser
    let content: String
    let totalScore: Int
    let receipt: Bool
    let images: [String]
}

// MARK: - User
struct dentistUser: Codable {
    let userIdx: Int
    let nickName: String
//    let profile: JSONNull?
}
