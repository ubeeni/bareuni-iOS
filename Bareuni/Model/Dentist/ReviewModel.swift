//
//  ReviewModel.swift
//  Bareuni
//
//  Created by 황인성 on 2023/08/22.
//

import Foundation


struct Review: Identifiable, Hashable{
    
    var id = UUID()
    var detail = ""
    var nickName = ""
    var gender = ""
    var star = 0
    var certification: Bool
    var price = 0
    
}
