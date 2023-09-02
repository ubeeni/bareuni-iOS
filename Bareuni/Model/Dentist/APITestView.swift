////
////  APITestView.swift
////  Bareuni
////
////  Created by 황인성 on 2023/08/28.
////
//
//import SwiftUI
//
//struct APITestView: View {
//    @ObservedObject var viewModel = NearDentistViewModel()
//
//    var body: some View {
//        VStack {
//            Text(viewModel.currentLocation)
//                .font(.title)
//
//            Button("Fetch Near Dentists") {
//                viewModel.fetchNearDentists()
//            }
//        }
//    }
//}
//
//struct APITestView_Previews: PreviewProvider {
//    static var previews: some View {
//        APITestView()
//    }
//}
