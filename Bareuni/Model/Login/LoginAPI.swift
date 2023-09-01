//
//  LoginAPI.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/27.
//

import Foundation
import UIKit
import Alamofire
import KeychainSwift


struct LoginAPI{
    static let shared = LoginAPI()
    let serverDir = "http://54.180.54.10:8080"
    
    func checkEmail(email: String, completion: @escaping (Result<CheckEmailResponse, Error>) -> Void){
        let url = "https://bareuni.shop/users/join/check-email"
        
        let params = ["email": email] as Dictionary
        AF.request(url,
                   method: .post,
                   parameters: params,
                   encoding: JSONEncoding(options: []),
                   headers: ["Content-Type":"application/json", "Accept":"application/json"])
        .responseJSON{ response in
            switch response.result {
            case .success(let result):
                // 성공적으로 디코드한 데이터를 처리
                if let jsonData = try? JSONSerialization.data(withJSONObject: result, options: []),
                   let rtn = try? JSONDecoder().decode(CheckEmailResponse.self, from: jsonData) {
                    // 성공적으로 디코드한 데이터를 처리
                    completion(.success(rtn))
                }
                else {
                    let error = NSError(domain: "DecodingError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Decoding failed"])
                    completion(.failure(error))
                }
            case .failure(let error):
                // 실패 시 에러 처리
                completion(.failure(error))
            }
        }
    }
    func verifyEmail(email: String, completion: @escaping (Result<VerifyEmailResponse, Error>) -> Void){
        let url = "https://bareuni.shop/users/email"
        let params = ["email": email] as Dictionary

        AF.request(url,
                   method: .post,
                   parameters: params,
                   encoding: JSONEncoding(options: []),
                   headers: ["Content-Type":"application/json", "Accept":"application/json"])
        .responseJSON{ response in
            switch response.result {
            case .success(let result):
                // 성공적으로 디코드한 데이터를 처리
                if let jsonData = try? JSONSerialization.data(withJSONObject: result, options: []),
                   let rtn = try? JSONDecoder().decode(VerifyEmailResponse.self, from: jsonData) {
                    // 성공적으로 디코드한 데이터를 처리
                    completion(.success(rtn))
                }
                else {
                    let error = NSError(domain: "DecodingError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Decoding failed"])
                    completion(.failure(error))
                }
            case .failure(let error):
                // 실패 시 에러 처리
                completion(.failure(error))
            }
        }
    }
    
    func signUp(photo: UIImage?, email: String, password: String, nickname: String, gender: String, age: Int, ortho: Bool, completion: @escaping (Result<SignUpResponse, Error>) -> Void){
        let url = "https://bareuni.shop/users/join"
        
        let params = ["userJoinReq.email": email, "userJoinReq.age": age, "userJoinReq.password": password, "userJoinReq.nickname": nickname, "userJoinReq.gender": gender,  "userJoinReq.ortho": ortho, "userJoinReq.provider": "일반"] as Dictionary
        
        let header : HTTPHeaders = [
                    "Content-Type" : "multipart/form-data" ]
        
        //multipart 업로드
        AF.upload(multipartFormData: { (multipart) in
            if(photo != nil){
                //이미지 데이터를 POST할 데이터에 덧붙임
//                if let imageData = photo!.pngData(self: photo){
//                    multipart.append(imageData, withName: "file", fileName: "photo.png", mimeType: "image/png")
//                }
                if let image = photo!.jpegData(compressionQuality: 1) {
                    multipart.append(image, withName: "file", fileName: "\(nickname).jpg", mimeType: "image/jpeg") // jpeg 파일로 전송
                }
            }
            //이미지 데이터 외에 같이 전달할 데이터 (여기서는 user, emoji, date, content 등)
            for (key, value) in params {
                multipart.append("\(value)".data(using: .utf8, allowLossyConversion: false)!, withName: "\(key)")
            }
            print("upload: \(multipart)")
        }, to: url
                  ,method: .post        //전달 방식
                  ,headers: header).responseJSON{ response in
            print(response)

            switch response.result {
            case .success(let result):
                // 성공적으로 디코드한 데이터를 처리
                if let jsonData = try? JSONSerialization.data(withJSONObject: result, options: []),
                   let rtn = try? JSONDecoder().decode(SignUpResponse.self, from: jsonData) {
                    // 성공적으로 디코드한 데이터를 처리
                    completion(.success(rtn))
                }
                else {
                    let error = NSError(domain: "DecodingError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Decoding failed"])
                    completion(.failure(error))
                }
            case .failure(let error):
                // 실패 시 에러 처리
                completion(.failure(error))
            }
        }
    }
    
    func login(email: String, password: String, completion: @escaping (Result<LoginResponse, Error>) -> Void){
        let url = "https://bareuni.shop/users/login"
        
        let params = ["email": email, "password": password] as Dictionary
        AF.request(url,
                   method: .post,
                   parameters: params,
                   encoding: JSONEncoding(options: []),
                   headers: ["Content-Type":"application/json", "Accept":"application/json"])
        .responseJSON{ response in
            switch response.result {
            case .success(let result):
                // 성공적으로 디코드한 데이터를 처리
                if let jsonData = try? JSONSerialization.data(withJSONObject: result, options: []),
                   let rtn = try? JSONDecoder().decode(LoginResponse.self, from: jsonData) {
                    // 성공적으로 디코드한 데이터를 처리
                    completion(.success(rtn))
                }
                else {
                    let error = NSError(domain: "DecodingError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Decoding failed"])
                    completion(.failure(error))
                }
            case .failure(let error):
                // 실패 시 에러 처리
                completion(.failure(error))
            }
        }
        
    }
    
    func logout(completion: @escaping (Result<GeneralResponse, Error>) -> Void){
        let url = "\(serverDir)/users/logout"
        let accessToken = UserDefaults.standard.string(forKey: "accessToken")!
        AF.request(url,
                   method: .delete,
                   headers: ["Content-Type":"application/json", "Accept":"application/json", "atk": KeychainSwift().get("accessToken")!])
        .responseJSON{ response in
                switch response.result {
                case .success(let data):
                    if let jsonData = try? JSONSerialization.data(withJSONObject: data, options: []),
                       let rtn = try? JSONDecoder().decode(GeneralResponse.self, from: jsonData) {
                        // 성공적으로 디코드한 데이터를 처리
                        completion(.success(rtn))
                    }
                    else {
                        let error = NSError(domain: "DecodingError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Decoding failed"])
                        completion(.failure(error))
                    }
                case .failure(let error):
                    // 실패 시 에러 처리
                    completion(.failure(error))
                }
            }
    }
    
    func reissue(completion: @escaping (Result<ReissueResponse, Error>) -> Void){
        let url = "\(serverDir)/users/logout"
        let accessToken = UserDefaults.standard.string(forKey: "accessToken")
        AF.request(url,
                   method: .post,
                   headers: ["Content-Type":"application/json", "Accept":"application/json", "atk":KeychainSwift().get("accessToken")!])
        .responseJSON{ response in
                switch response.result {
                case .success(let data):
                    if let jsonData = try? JSONSerialization.data(withJSONObject: data, options: []),
                       let rtn = try? JSONDecoder().decode(ReissueResponse.self, from: jsonData) {
                        // 성공적으로 디코드한 데이터를 처리
                        completion(.success(rtn))
                    }
                    else {
                        let error = NSError(domain: "DecodingError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Decoding failed"])
                        completion(.failure(error))
                    }
                case .failure(let error):
                    // 실패 시 에러 처리
                    completion(.failure(error))
                }
            }

    }
}

