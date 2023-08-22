//
//  SignUpDataModel.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/22.
//

import Foundation

struct usersJoinRequest: Encodable {
    let email, password, nickname, gender: String
    let age: Int
    let ortho: Bool
    
    enum CodingKeys: String, CodingKey {
        case email
        case password
        case nickname
        case gender
        case age
        case ortho
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        email = try values.decode(String.self, forKey: .email)
        password = try values.decode(String.self, forKey: .password)
        nickname = try values.decode(String.self, forKey: .nickname)
        gender = try values.decode(String.self, forKey: .gender)
        age = try values.decode(Int.self, forKey: .age)
        ortho = try values.decode(Bool.self, forKey: .ortho)
      }
}

struct usersJoinResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: Result
}

// MARK: - Result
struct Result: Codable {
    let user: User
}

// MARK: - User
struct User: Codable {
    let createdAt: String
    let updatedAt: String?
    let userIdx: Int
    let email, password, nickname: String
    let name, phone: String?
    let gender: String
    let age: Int
    let ortho: Bool
    let role: String
    let provider: String?
    let profile: String
    let enabled: Bool
    let username: String
    let authorities: String?
    let accountNonExpired, credentialsNonExpired, accountNonLocked: Bool
}
