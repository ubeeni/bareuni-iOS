//
//  UserDataModel.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/09/04.
//

import Foundation

struct GetUserInfoResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: MypageUser?
}

struct MypageUser: Codable {
    var email: String
    var nickname: String
    var gender: String
    var age: Int
    var ortho: Bool
    var profile: String?
}
