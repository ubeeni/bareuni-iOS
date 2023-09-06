//
//  DeleteViewModel.swift
//  Bareuni
//
//  Created by 김유빈 on 2023/09/06.
//

import Foundation
import Moya

class DeleteViewModel: ObservableObject {
    @Published var deleteModel: DeleteModel?
    @Published var errorMessage: String?

    private let provider = MoyaProvider<BareuniAPI>()

    func deletePost() {
        provider.request(.deletePost) { result in
            switch result {
            case let .success(response):
                do {
                    self.deleteModel = try response.map(DeleteModel.self)
                } catch {
                    self.errorMessage = "Failed to decode data: \(error.localizedDescription)"
                }

            case let .failure(error):
                print("Network request failed: \(error)")
            }
        }
    }
}
