//
//  DataModel.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/28.
//

import Foundation
import Alamofire
import UIKit

struct EmailCheckResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: Bool?
}

struct SignUpRequest {
    var email: String
    var password: String
    var file: UIImage?
    var nickname: String
    var gender: String
    var age: Int
    var ortho: Bool
    var reception: Bool
    init() {
        email = ""
        password = ""
        nickname = ""
        gender = ""
        age = 0
        ortho = false
        reception = false
        file = nil
        
    }
}
struct SignUpResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
}


struct LoginResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [Token]?

}
struct ReissueResponse: Codable {
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
struct LogoutResponse: Codable{
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: String?
}





