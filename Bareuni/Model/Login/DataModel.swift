//
//  DataModel.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/28.
//

import Foundation
import Alamofire

struct EmailCheckResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: Bool?
}

struct SignUpResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    
    enum CodingKeys: CodingKey {
        case isSuccess, code, message
    }
}



struct LoginResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [Token]?

}


struct Token: Codable {
    let types, token, tokenExpriresTime: String
}

struct CheckEmailResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: Bool?
}

struct VerifyEmailResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: String?
}

struct GeneralResponse: Codable{
    let isSuccess: Bool
    let code: Int
    let message, result: String
}
struct ReissueResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [Token]?
}




