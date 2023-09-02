//
//  APIManager.swift
//  Bareuni
//
//  Created by 김유빈 on 2023/08/28.
//

import Foundation
import Moya
import KeychainSwift

enum BareuniAPI {
    case getBestDentist
    case getBestCommunity
}

extension BareuniAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://bareuni.shop/")!
    }
    
    var path: String {
        switch self {
        case .getBestDentist:
            return "hospital/best"
        case .getBestCommunity:
            return "community/best"
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .getBestDentist:
            return .get
        case .getBestCommunity:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self{
        case .getBestDentist:
            return Data()
        case .getBestCommunity:
            return Data()
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getBestDentist:
            return .requestPlain
        case .getBestCommunity:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json",
                "Accept": "application/json",
                "atk": KeychainSwift().get("accessToken") ?? ""]
    }
    
}
