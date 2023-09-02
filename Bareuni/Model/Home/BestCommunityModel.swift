//
//  BestCommunityModel.swift
//  Bareuni
//
//  Created by 김유빈 on 2023/08/28.
//

import Foundation

struct BestCommunityModel: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [BestCommunityResult]
}

struct BestCommunityResult: Codable, Identifiable {
    var id: Int64 { communityIdx }
    let communityIdx: Int64
    let createdAt: String
    //let updatedAt: String
    let content: String
    let likeCnt: Int
}
