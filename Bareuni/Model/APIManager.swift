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
    case getCommunity
    case postWrite(content: String)
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
        case .getCommunity:
            return "community"
        case .postWrite:
            return "community"
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .getBestDentist:
            return .get
        case .getBestCommunity:
            return .get
        case .getCommunity:
            return .get
        case .postWrite:
            return .post
        }
    }
    
    var sampleData: Data {
        switch self{
        case .getBestDentist:
            return Data()
        case .getBestCommunity:
            return Data()
        case .getCommunity:
            return Data()
        case .postWrite:
            return Data()
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getBestDentist:
            return .requestPlain
        case .getBestCommunity:
            return .requestPlain
        case .getCommunity:
            return .requestPlain
        case .postWrite(let content):
            let parameters: [String: Any] = ["content": content]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getBestDentist:
            return nil
        case .getBestCommunity:
            return nil
        case .getCommunity:
            return ["Content-Type": "application/json",
                    "Accept": "application/json",
                    "atk": KeychainSwift().get("accessToken") ?? ""]
        case .postWrite:
            return ["Content-Type": "application/json",
                    "Accept": "application/json",
                    "atk": KeychainSwift().get("accessToken") ?? ""]
        }
    }
    
}
