//
//  SearchReviewModel.swift
//  Bareuni
//
//  Created by 황인성 on 2023/09/06.
//

import Foundation

// MARK: - SearchReview
struct SearchReviewResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [SearchReview]
}

// MARK: - Result
struct SearchReview: Codable, Identifiable {
    let reviewIdx: Int64
    let hospitalIdx: Int64
    let createdAt: String
//    let updatedAt: JSONNull?
    let user: SearchReviewUser
    let content: String
    let totalScore: Int
    let receipt: Bool
//    let images: JSONNull?
    
    var id: Int64 { reviewIdx }
    
//    static func ==(lhs: SearchReview, rhs: SearchReview) -> Bool {
//            // Compare the properties that determine equality
//            return lhs.reviewIdx == rhs.reviewIdx && lhs.hospitalIdx == rhs.hospitalIdx
//        }
}

// MARK: - User
struct SearchReviewUser: Codable {
    let userIdx: Int
    let nickName: String
//    let profile: String?
}
