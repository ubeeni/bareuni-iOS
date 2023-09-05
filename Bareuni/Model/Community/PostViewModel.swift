//
//  PostViewModel.swift
//  Bareuni
//
//  Created by 김유빈 on 2023/08/10.
//

import Foundation
import Combine
import Moya

class PostViewModel: ObservableObject {
    @Published var posts: PostResult?
    private let provider = MoyaProvider<BareuniAPI>()

    init() {

    }

    func createPost(content: String, completion: @escaping (Bool) -> Void) {
        provider.request(.postWrite(content: content)) { result in
            switch result {
            case let .success(response):
                do {
                    let postResponse = try response.map(PostModel.self)
                    self.posts = postResponse.result
                    completion(true)
                } catch {
                    print("Error parsing response: \(error)")
                    completion(false)
                }

            case let .failure(error):
                print("Network request failed: \(error)")
                completion(false)
            }
        }
    }
}
