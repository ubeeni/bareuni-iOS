//
//  APITestView.swift
//  Bareuni
//
//  Created by 황인성 on 2023/08/28.
//

import SwiftUI

struct APITestView: View {
    @StateObject var viewModel = SearchDentistViewModel()
    
    var body: some View {
        VStack {
            List{
                ForEach(viewModel.searchDentists, id: \.self){ dentist in
                    Text(dentist.hosName)
                }
            }
        }
    }
}

struct APITestView_Previews: PreviewProvider {
    static var previews: some View {
        APITestView()
    }
}
