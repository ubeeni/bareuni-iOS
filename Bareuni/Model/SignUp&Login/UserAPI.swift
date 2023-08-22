//
//  UserAPI.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/22.
//

import Foundation
import Alamofire
import UIKit


class UserAPI {
    static func postUserJoin() {
        let serverDir = "http://13.124.196.200:8080"
        let url =  serverDir + "/users/nickname"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 10
        
        
        
      
        
        // httpBody 에 parameters 추가
        do {
           // try request.httpBody = JSONSerialization.data(withJSONObject: params, options: [])
        } catch {
            print("http Body Error")
        }
        
        AF.request(request).responseString { (response) in
            switch response.result {
            case .success:
                print("POST 성공")
            case .failure(let error):
                print("🚫 Alamofire Request Error\nCode:\(error._code), Message: \(error.errorDescription!)")
            }
        }
        
    }
}
