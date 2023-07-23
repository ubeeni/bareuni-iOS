//
//  DentistViewModel.swift
//  Bareuni
//
//  Created by 황인성 on 2023/07/18.
//

import Foundation

class DentistViewModel: ObservableObject{
    @Published var Dentists = [Dentist]()
    
    init(){
        Dentists.append(Dentist(name: "이름1", info: "정보1", star: 1, address: "주소1", reservation: true))
        Dentists.append(Dentist(name: "이름2", info: "정보2", star: 2, address: "주소2", reservation: false))
        Dentists.append(Dentist(name: "이름3", info: "정보3", star: 3, address: "주소3", reservation: true))
        Dentists.append(Dentist(name: "이름4", info: "정보4", star: 4, address: "주소4", reservation: true))
        Dentists.append(Dentist(name: "이름5", info: "정보5", star: 5, address: "주소5", reservation: true))
        Dentists.append(Dentist(name: "이름6", info: "정보6", star: 6, address: "주소6", reservation: true))
        Dentists.append(Dentist(name: "이름7", info: "정보7", star: 7, address: "주소7", reservation: true))
        Dentists.append(Dentist(name: "이름8", info: "정보8", star: 8, address: "주소8", reservation: true))
        Dentists.append(Dentist(name: "이름9", info: "정보9", star: 9, address: "주소9", reservation: true))
        Dentists.append(Dentist(name: "이름10", info: "정보10", star: 10, address: "주소10", reservation: true))
    }
}
