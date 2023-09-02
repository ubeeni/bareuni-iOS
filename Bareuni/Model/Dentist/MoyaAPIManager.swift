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
    case getDetailDentist(hospitalIdx: Int)
    case getNearDentist(address: String)
}

extension DentistAPI: TargetType{
    var baseURL: URL {
        return URL(string: "https://bareuni.shop/")!
    }
    
    var path: String {
        switch self {
                case .getRecommendDentist(let cityPath):
                    return "hospital/recommend/\(cityPath)"
        case .getDetailDentist(let hospitalIdx):
            return "hospital/\(hospitalIdx)"
        case .getNearDentist:
            return "/hospital/near"
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .getRecommendDentist:
            return .get
        case .getDetailDentist:
            return .get
        case .getNearDentist:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self{
        case .getRecommendDentist:
            return Data()
        case .getDetailDentist:
            return Data()
        case .getNearDentist:
            return Data()
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getRecommendDentist:
            return .requestPlain
        case .getDetailDentist:
            return .requestPlain
        case .getNearDentist(let address):
            return .requestParameters(parameters: ["address": address], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
