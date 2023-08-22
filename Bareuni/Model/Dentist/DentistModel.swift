//
//  DentistModel.swift
//  Bareuni
//
//  Created by 황인성 on 2023/07/18.
//

import Foundation

struct Dentist: Identifiable, Hashable{
    
    var id = UUID()
//    var area = 0
    var name = ""
    var info = ""
    var star : Float
    var address = ""
    var title = [String]()
//    var phoneNumber = ""
//    var description = ""
    var reservation: Bool
    var Favorites: Bool
//    var reviews = [Review]()
    
    
    //    let specialties: [String]
    //    let openingHours: String
    //    let websiteURL: URL?
}
