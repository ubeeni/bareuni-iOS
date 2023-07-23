//
//  DentistModel.swift
//  Bareuni
//
//  Created by 황인성 on 2023/07/18.
//

import Foundation

struct Dentist: Identifiable, Hashable{
    
    var id = UUID()
    var name = ""
    var info = ""
    var star = 0
    var address = ""
    var reservation:Bool
}
