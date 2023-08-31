//
//  MoyaAPIManager.swift
//  Bareuni
//
//  Created by 황인성 on 2023/08/28.
//

import Foundation
import Moya


enum DentistAPI {
    case getRecommendDentist(cityPath: String)
}

extension DentistAPI: TargetType{
    var baseURL: URL {
        return URL(string: "https://bareuni.shop/")!
    }
    
    var path: String {
        switch self {
                case .getRecommendDentist(let cityPath):  // Use the parameter here
                    return "hospital/recommend/\(cityPath)"
                }
    }
    
    var method: Moya.Method {
        switch self{
        case .getRecommendDentist:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self{
        case .getRecommendDentist:
            return Data()
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getRecommendDentist:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
