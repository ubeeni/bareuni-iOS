//
//  TestView.swift
//  Bareuni
//
//  Created by 황인성 on 2023/07/11.
//

import SwiftUI

struct TestView: View {
    @State private var text: String = "Sample Text"
        
        var body: some View {
            GeometryReader { geometry in
                VStack {
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(width: geometry.size.width, height: 50)
                    
                    Text(text)
                        .font(.title)
                    
                    Spacer()
                    
                    Button(action: {
                        // Update the text
                        text = "Updated Text"
                    }) {
                        Text("Change Text")
                    }
                }
            }
        }
}


struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: { configuration.isOn.toggle() }) {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .resizable()
                    .frame(width: 20, height: 20)
                configuration.label
            }
        }
        .foregroundColor(.primary)
    }
}



struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
