//
//  TestView.swift
//  Bareuni
//
//  Created by 황인성 on 2023/07/11.
//

import SwiftUI

struct TestView: View {
    @State private var isPresentingModal = false
    @State var stack = NavigationPath()

    var body: some View {
        NavigationStack(path: $stack) {
            VStack {
                Button("Show Modal") {
                    isPresentingModal = true
                }
            }
            .sheet(isPresented: $isPresentingModal) {
                ModalView()
        }
        }
    }
}

struct ModalView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                Text("Modal View")
                    .font(.title)

                NavigationLink("Go to First Screen", destination: FirstScreen())
                    .padding()

                NavigationLink("Go to Second Screen", destination: SecondScreen())
                    .padding()

                Button("Close Modal") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationBarTitle("Modal View")
        }
    }
}

struct FirstScreen: View {
    var body: some View {
        VStack {
            Text("First Screen")
                .navigationBarTitle("First Screen")

            NavigationLink("Go to Second Screen", destination: SecondScreen())
                .padding()
        }
    }
}

struct SecondScreen: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Second Screen")
                .navigationBarTitle("Second Screen")

            Button("Go to TestView") {
                presentationMode.wrappedValue.dismiss()
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
            
        }
    }
}



struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
