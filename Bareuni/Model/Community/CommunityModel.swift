//
//  CommunityModel.swift
//  Bareuni
//
//  Created by 김유빈 on 2023/09/03.
//

import Foundation

struct CommunityModel: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [CommunityResult]
}

struct CommunityResult: Codable {
    let communityIdx: Int
    let createdAt: String
    let updatedAt: String?
    let user: User
    let content: String
    let like: Int
}

struct User: Codable {
    let userIdx: Int
    let nickName: String
    let profile: String?
}
