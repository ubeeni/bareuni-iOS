//
//  TestView4.swift
//  Bareuni
//
//  Created by 황인성 on 2023/08/17.
//

import SwiftUI

struct FirstView: View {
    @State private var isModalPresented = false
    
    var body: some View {
        VStack {
            Button("Open Modal") {
                isModalPresented = true
            }
        }
        .fullScreenCover(isPresented: $isModalPresented, content: {
            ModalView(isModalPresented: $isModalPresented)
        })
    }
}

struct ModalView: View {
    @Binding var isModalPresented: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Modal View")
                NavigationLink(destination: FinalView(isModalPresented: $isModalPresented)) {
                    Text("Go to Final")
                }
            }
        }
    }
}

struct FinalView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var isModalPresented: Bool
    
    var body: some View {
        VStack {
            Text("Final View")
            Button("Go Back to First View") {
                isModalPresented = false // Dismiss the ModalView
            }
        }
    }
}


struct TestView4_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
