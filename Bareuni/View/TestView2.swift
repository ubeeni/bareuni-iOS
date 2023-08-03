//
//  TestView2.swift
//  Bareuni
//
//  Created by 황인성 on 2023/07/26.
//

import SwiftUI
import PhotosUI

struct TestView2: View {
    @State private var isShowingSecondScreen = false

    var body: some View {
        NavigationView {
            VStack {
                Text("First Screen")
                    .padding()

                Button("Show Second Screen") {
                    isShowingSecondScreen = true

                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isShowingSecondScreen = false
                    }
                }
            }
            .navigationTitle("First Screen")
            .zIndex(0) // Ensure the first screen is at the bottom of the stack
            .overlay(
                Group {
                    if isShowingSecondScreen {
                        Color.black.opacity(0.4)
                            .edgesIgnoringSafeArea(.all)
                            .zIndex(1) // Ensure the second screen is on top of the first screen
                            .onTapGesture {
                                isShowingSecondScreen = false
                            }
                            .transition(.opacity)
                            .animation(.easeInOut)
                    }
                }
            )
        }
    }
}

struct MultipleImagePicker: View {
    @State private var selectedImages: [UIImage] = []
    @State private var isImagePickerPresented = false
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(selectedImages, id: \.self) { image in
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 93)
                        .cornerRadius(10)
                }
                Button(action: {
                    isImagePickerPresented.toggle()
                }, label: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 120, height: 93)
                            .background(.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .inset(by: 0.25)
                                    .stroke(Color(red: 0.62, green: 0.62, blue: 0.62), lineWidth: 0.5)
                            )
                        
                        Circle()
                            .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                            .frame(width: 40, height: 40)
                        
                        Image("icon")
                            .frame(width: 18, height: 15)
                    }
                    .frame(width: 120, height: 93)
                }).sheet(isPresented: $isImagePickerPresented) {
                    ImagePickerView(selectedImages: $selectedImages)
                }
                
            }
        }
    }
}

// Wrapper for PHPicker
struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var selectedImages: [UIImage]
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 0 // Set to 0 for multiple selections
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: PHPickerViewControllerDelegate {
        private let parent: ImagePickerView
        
        init(_ parent: ImagePickerView) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            parent.selectedImages.removeAll()
            
            for result in results {
                if result.itemProvider.canLoadObject(ofClass: UIImage.self) {
                    result.itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                        if let error = error {
                            print("Error loading image: \(error.localizedDescription)")
                        } else if let image = image as? UIImage {
                            DispatchQueue.main.async {
                                self.parent.selectedImages.append(image)
                            }
                        }
                    }
                }
            }
            picker.dismiss(animated: true)
        }
    }
}


struct TestView2_Previews: PreviewProvider {
    static var previews: some View {
        TestView2()
    }
}

