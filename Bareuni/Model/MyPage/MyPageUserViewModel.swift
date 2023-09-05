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
    @Published var data: MypageUser?
    @Published var errorMessage: String?

    private var cancellables: Set<AnyCancellable> = []

    func fetchData() {
        let url = "https://bareuni.shop/users/info"
        let header: HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json",
            "atk": KeychainSwift().get("accessToken") ?? ""
        ]

        AF.request(url, method: .get, headers: header)
            .validate()
            .publishDecodable(type: GetUserInfoResponse.self)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }

                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.errorMessage = "데이터 가져오기 실패: \(error)"
                }
            }, receiveValue: { [weak self] response in
                guard let self = self else { return }

                if let result = response.value?.result {
                    self.data = result
                } else {
                    self.errorMessage = "데이터 파싱 실패"
                }
            })
            .store(in: &cancellables)
    }
}
