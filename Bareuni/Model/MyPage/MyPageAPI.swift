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
    func getUserInfro(completion: @escaping (Result<GetUserInfro, Error>) -> Void){
        let url = "https://bareuni.shop/users/info"
        
        AF.request(url,
                   method: .get,
                   encoding: JSONEncoding(options: []),
                   headers: ["Content-Type":"application/json", "Accept":"application/json", "atk": KeychainSwift().get("accessToken") ?? ""])
        .responseDecodable(of: GetUserInfro.self){ response in
            switch response.result {
            case .success(let result):
                // 성공적으로 디코드한 데이터를 처리
                print("유저 정보 요청 결과: \(result.message)")
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func changePassword(currentPW: String, newPW: String, completion: @escaping (Result<ChangePasswordResponse, Error>) -> Void){
        let url = "https://bareuni.shop/users/join/check-email"
        
        let params = ["currentPassword": currentPW, "newPassword": newPW] as Dictionary
        AF.request(url,
                   method: .post,
                   parameters: params,
                   encoding: JSONEncoding(options: []),
                   headers: ["Content-Type":"application/json", "Accept":"application/json"])
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
}
