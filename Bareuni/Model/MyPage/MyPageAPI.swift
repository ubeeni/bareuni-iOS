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
}
