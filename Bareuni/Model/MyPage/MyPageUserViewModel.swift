//
//  MyPageUserViewModel.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/09/05.
//

import Foundation
import Alamofire
import SwiftUI
import Combine
import KeychainSwift

class MyPageUserViewModel: ObservableObject {
    @Published var user: MypageUser?
    @Published var errorMessage: String?
    
  //  private var cancellables: Set<AnyCancellable> = []
        
    init() {
        fetchTodos()
    }
    
    func fetchTodos() {
      getUserInfro(completion: {
          result in
          switch result {
          case .success(let response):
              self.user = response.result
          case .failure(let error):
              print("error: \(error)")
          }
      })
    }
    
    func getUserInfro(completion: @escaping (Result<GetUserInfoResponse, Error>) -> Void){
        let url = "https://bareuni.shop/users/info"
        
        AF.request(url,
                   method: .get,
                   encoding: JSONEncoding(options: []),
                   headers: ["Content-Type":"application/json", "Accept":"application/json", "atk": KeychainSwift().get("accessToken") ?? ""])
        .responseDecodable(of: GetUserInfoResponse.self){ response in
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
}
