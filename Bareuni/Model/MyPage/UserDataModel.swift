//
//  UserDataModel.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/09/04.
//

import Foundation

struct GetUserInfro: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: User?
}

struct User: Codable {
    let email, nickname: String
    let gender: String?
    let age: Int
    let ortho: Bool
    let profile: String?
    
}
