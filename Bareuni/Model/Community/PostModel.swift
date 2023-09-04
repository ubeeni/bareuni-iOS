//
//  PostModel.swift
//  Bareuni
//
//  Created by 김유빈 on 2023/08/10.
//

import Foundation

struct PostModel: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: PostResult?
}

struct PostResult: Codable {
    let communityIdx: Int
    let user: User
    let content: String
    let commentList: [CommentList]?
}

struct CommentList: Codable {
    let communityIdx, commentIdx: Int
    let user: User
    let comment, commentCreatedAt: String
}
