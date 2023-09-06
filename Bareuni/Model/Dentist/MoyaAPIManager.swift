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
    case getDentistReview
    case getSearchDentist(keyword: String)
    case getSearchReview(keyword: String)
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
            return "hospital/near"
        case .getDentistReview:
            return "reviews"
        case .getSearchDentist:
            return "hospital/search"
        case .getSearchReview:
            return "reviews/search"
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
        case .getDentistReview:
            return .get
        case .getSearchDentist:
            return .get
        case .getSearchReview:
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
        case .getDentistReview:
            return Data()
        case .getSearchDentist:
            return Data()
        case .getSearchReview:
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
        case .getDentistReview:
            return .requestPlain
        case .getSearchDentist(keyword: let keyword):
            return .requestParameters(parameters: ["keyword": keyword], encoding: URLEncoding.default)
        case .getSearchReview(keyword: let keyword):
            return .requestParameters(parameters: ["keyword": keyword], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
