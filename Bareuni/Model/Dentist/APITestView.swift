//
//  APITestView.swift
//  Bareuni
//
//  Created by 황인성 on 2023/08/28.
//

import SwiftUI

struct APITestView: View {
    
    @State var selectedCities: [String] = []  // Your selected cities here
    
    var body: some View {
        // Use a NavigationView or any other appropriate view structure
        NavigationView {
            VStack {
                // Your UI components here
                
                // Example of calling the ViewModel with selectedCities as path parameter
                Button("Fetch Dentists") {
                    let viewModel = RecommendDentistViewModel()
                    viewModel.fetchRecommendedDentists()
                }
            }
            .navigationBarTitle("Dentist Recommendations")
        }
    }
}

struct APITestView_Previews: PreviewProvider {
    static var previews: some View {
        APITestView()
    }
}
