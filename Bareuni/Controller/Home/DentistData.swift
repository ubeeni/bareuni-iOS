//
//  DentistData.swift
//  Bareuni
//
//  Created by 김유빈 on 2023/07/19.
//

import Foundation

class DentistData {
    var name: String
    var address: String
    var photo: String
    var number: Int
    var rating: Float
    
    init(name: String, address: String, photo: String, number: Int, rating: Float) {
        self.name = name
        self.address = address
        self.photo = photo
        self.number = number
        self.rating = rating
    }
    
    static var dummyDentistList = [DentistData(name: "옐로우 교정전문치과", address: "서울시 서초구 서초대로00길", photo: "Sample1", number: 1, rating: 5.0), DentistData(name: "그랑치과교정의원", address: "서울시 강남구 도산대로", photo: "Sample2", number: 2, rating: 4.9), DentistData(name: "화이트드림교정치과", address: "서울시 서초구 서초대로00길", photo: "Sample3", number: 3, rating: 4.9)]
}
