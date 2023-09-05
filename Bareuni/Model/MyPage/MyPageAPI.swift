//
//  MyPageAPI.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/09/04.
//

import Foundation
import UIKit
import Alamofire
import KeychainSwift


class MypageAPI: ObservableObject{
    static let shared = MypageAPI()

    func changePassword(currentPW: String, newPW: String, completion: @escaping (Result<ChangePasswordResponse, Error>) -> Void){
        let url = "https://bareuni.shop/mypage/users/password"
        
        let params = ["currentPassword": currentPW, "newPassword": newPW] as Dictionary
        AF.request(url,
                   method: .patch,
                   parameters: params,
                   encoding: JSONEncoding(options: []),
                   headers: ["Content-Type":"application/json", "Accept":"application/json", "atk": KeychainSwift().get("accessToken") ?? ""])
        .responseDecodable(of: ChangePasswordResponse.self){ response in
            switch response.result {
            case .success(let result):
                // 성공적으로 디코드한 데이터를 처리
                print("비밀번호 변경 결과: \(result.message)")
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func changeNickname(nickname: String, completion: @escaping (Result<ChangeInfoResponse, Error>) -> Void){
        let url = "https://bareuni.shop/mypage/users"
        let params = ["myUpdateReq.nickname": nickname] as Dictionary
        
        AF.request(url,
                   method: .patch,
                   parameters: params,
                   encoding: JSONEncoding(options: []),
                   headers: ["Content-Type":"multipart/form-data", "Accept":"application/json", "atk": KeychainSwift().get("accessToken") ?? ""])
        .responseDecodable(of: ChangeInfoResponse.self){ response in
            print(response)
            switch response.result {
            case .success(let result):
                // 성공적으로 디코드한 데이터를 처리
                print("닉네임 변경 결과: \(result.message)")
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func changeAge(age: Int,completion: @escaping (Result<ChangeInfoResponse, Error>) -> Void){
        let url = "https://bareuni.shop/mypage/users"
        let params = ["myUpdateReq.age": age] as Dictionary
        AF.request(url,
                   method: .patch,
                   parameters: params,
                   encoding: JSONEncoding(options: []),
                   headers: ["Content-Type":"multipart/form-data", "Accept":"application/json", "atk": KeychainSwift().get("accessToken") ?? ""])
        .responseDecodable(of: ChangeInfoResponse.self){ response in
            switch response.result {
            case .success(let result):
                // 성공적으로 디코드한 데이터를 처리
                print("나이 변경 결과: \(result.message)")
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func changeGender(gender: String,completion: @escaping (Result<ChangeInfoResponse, Error>) -> Void){
        let url = "https://bareuni.shop/mypage/users"
        let params = ["myUpdateReq.gender": gender] as Dictionary
        AF.request(url,
                   method: .patch,
                   parameters: params,
                   encoding: JSONEncoding(options: []),
                   headers: ["Content-Type":"multipart/form-data", "Accept":"application/json", "atk": KeychainSwift().get("accessToken") ?? ""])
        .responseDecodable(of: ChangeInfoResponse.self){ response in
            switch response.result {
            case .success(let result):
                // 성공적으로 디코드한 데이터를 처리
                print("성별 변경 결과: \(result.message)")
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func changeOrtho(ortho: Bool,completion: @escaping (Result<ChangeInfoResponse, Error>) -> Void){
        let url = "https://bareuni.shop/mypage/users"
        let params = ["myUpdateReq.ortho": ortho] as Dictionary
        AF.request(url,
                   method: .patch,
                   parameters: params,
                   encoding: JSONEncoding(options: []),
                   headers: ["Content-Type":"multipart/form-data", "Accept":"application/json", "atk": KeychainSwift().get("accessToken") ?? ""])
        .responseDecodable(of: ChangeInfoResponse.self){ response in
            switch response.result {
            case .success(let result):
                // 성공적으로 디코드한 데이터를 처리
                print("교정 유무 변경 결과: \(result.message)")
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
   
    
}
