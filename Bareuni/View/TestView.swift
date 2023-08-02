//
//  TestView.swift
//  Bareuni
//
//  Created by 황인성 on 2023/07/11.
//

import SwiftUI

struct TestView: View {
    @State private var rating: Int = 0

    var body: some View {
        VStack {
            Text("Rate this app:")
                .font(.headline)
            
            HStack {
                ForEach(1...5, id: \.self) { index in
                    Image(systemName: index <= rating ? "star.fill" : "star")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(index <= rating ? .yellow : .gray)
                        .onTapGesture {
                            rating = index
                        }
                }
            }
            
            Text("You've rated \(rating) star\(rating == 1 ? "" : "s")")
        }
        .padding()
    }
}

struct IdentifiableImage: Identifiable {
    let id = UUID()
    let image: Image
}


struct PhotoAttachmentView: View {
    @State private var selectedImages: [IdentifiableImage] = []
    @State private var isImagePickerPresented = false
    
    var body: some View {
        VStack {
            if !selectedImages.isEmpty {
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(selectedImages, id: \.id) { identifiableImage in
                            identifiableImage.image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                        }
                    }
                }
            } else {
                Text("No Photos Selected")
            }
            
            Button("Select Photos") {
                isImagePickerPresented = true
            }
        }
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(selectedImages: $selectedImages)
        }
    }
}




struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImages: [IdentifiableImage]
    @Environment(\.presentationMode) private var presentationMode

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = ["public.image"]
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let pickedImage = info[.originalImage] as? UIImage {
                parent.selectedImages.append(IdentifiableImage(image: Image(uiImage: pickedImage)))
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}



struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
