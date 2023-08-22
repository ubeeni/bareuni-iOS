//
//  WriteView.swift
//  Bareuni
//
//  Created by 황인성 on 2023/07/21.
//

import SwiftUI
import PhotosUI

struct WriteView: View {
    
    @State private var reviewText = ""
    @State var selectedSatisfaction1 = ""
    @State var selectedSatisfaction2 = ""
    @State var selectedSatisfaction3 = ""
    @Binding var isPresentingModal: Bool
    let placeholder = "Placeholder"
    
    @Environment(\.presentationMode) var
    presentationMode

    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    HStack{
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image("Mask")
                        })
                        
                        Spacer()
                        NavigationLink(destination: WriteView2(isPresentingModal: $isPresentingModal), label: {
                            HStack(alignment: .top, spacing: 8) {
                                Text("다음")
                                    .font(
                                        Font.custom("Pretendard", size: 16)
                                            .weight(.medium)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.BackgroundBlue)
                                    .frame(maxWidth: .infinity, alignment: .top)
                            }
                            .padding(8)
                            .frame(width: 69, alignment: .topLeading)
                            .background(.white)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .inset(by: 0.25)
                                    .stroke(Color(red: 0, green: 0.58, blue: 1), lineWidth: 0.5)
                            )
                        })
                        
                        
                    }
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                    
                    VStack(alignment: .leading){
                        Rectangle().frame(height:0)
                        Text("리뷰 작성")
                            .font(
                                Font.custom("Pretendard", size: 20)
                                    .weight(.medium)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .padding(.bottom, 1)
                        
                        Text("평균적인 별점을 매겨주세요")
                            .font(
                                Font.custom("Pretendard", size: 12)
                                    .weight(.medium)
                            )
                            .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                        
                        HStack(alignment: .center) {
                            Spacer()
                            StarView()
                            Spacer()
                        }
                        
                        Text("진료 결과")
                            .font(
                                Font.custom("Pretendard", size: 16)
                                    .weight(.medium)
                            )
                            .foregroundColor(.black)
                        
                        HStack {
                            Spacer()
                            EvaluationButton(text: "진료결과", selectedSatisfaction: $selectedSatisfaction1)
                            //                        .padding(.leading, -30)
                            Spacer()
                        }.padding(.bottom, 15)
                        
                        Text("서비스")
                            .font(
                                Font.custom("Pretendard", size: 16)
                                    .weight(.medium)
                            )
                            .foregroundColor(.black)
                        
                        HStack {
                            Spacer()
                            EvaluationButton(text: "서비스", selectedSatisfaction: $selectedSatisfaction2)
                            //                        .padding(.leading, -30)
                            Spacer()
                        }.padding(.bottom, 15)
                        
                        Text("시설 및 장비")
                            .font(
                                Font.custom("Pretendard", size: 16)
                                    .weight(.medium)
                            )
                            .foregroundColor(.black)
                        
                        HStack {
                            Spacer()
                            EvaluationButton(text: "시설 및 장비", selectedSatisfaction: $selectedSatisfaction3)
                            //                        .padding(.leading, -30)
                            Spacer()
                        }
                        .padding(.bottom, 30)
                    }
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                    VStack(alignment: .leading){
                        HStack{
                            Spacer()
                            Text("\(reviewText.count)자 / 최소 20자")
                                .font(Font.custom("Pretendard", size: 12))
                                .multilineTextAlignment(.center)
                                .foregroundColor(reviewText.count >= 20 || reviewText.count == 0 ? Color(red: 0.62, green: 0.62, blue: 0.62) : .red)
                        }
                        
                        HStack {
                            Spacer()
                            TextEditor(text: $reviewText)
                                .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                                .frame(width: 342, height: 107)
                                .background(Color.white)
                                .cornerRadius(12)
                                .background {
                                    TextEditor(text: .constant(reviewText.isEmpty ? placeholder : ""))
                                        .foregroundColor(.gray)
                                }
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .inset(by: 0.5)
                                        .stroke(reviewText.count >= 20 || reviewText.count == 0 ? Color(red: 0.88, green: 0.88, blue: 0.88) : Color.red, lineWidth: 1)
                                )
                            Spacer()
                        }
                        Spacer().frame(height: 40)
                        
                        Text("관련 사진을 첨부해주세요. (선택)")
                            .font(
                                Font.custom("Pretendard", size: 16)
                                    .weight(.medium)
                            )
                            .foregroundColor(.black)
                            .padding(.bottom, 1)
                        
                        Text("치과 내부 사진이나 치아교정 전후 사진 등을 추가해주세요. ")
                            .font(Font.custom("Pretendard", size: 12))
                            .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                        
                        MultipleImagePicker()
                    }
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                }
            }
        }
    }
}





struct EvaluationButton: View {
    let text: String
    @Binding var selectedSatisfaction: String
    
    var body: some View {
        HStack{
            Button(action: {
                selectedSatisfaction = "Dissatisfied"
            }, label: {
                VStack{
                    Text("😓")
                        .font(
                            Font.custom("Pretendard", size: 44)
                                .weight(.medium)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 44, height: 44, alignment: .center)
                    
                    Text("불만족해요")
                        .font(
                            Font.custom("Pretendard", size: 14)
                                .weight(.medium)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(selectedSatisfaction == "Dissatisfied" ? .BackgroundBlue : Color(red: 0.88, green: 0.88, blue: 0.88))
                }
            })
            
            Spacer().frame(width: 55)
            
            Button(action: {
                selectedSatisfaction = "Average"
            }, label: {
                VStack{
                    Text("🙂")
                        .font(
                            Font.custom("Pretendard", size: 44)
                                .weight(.medium)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 44, height: 44, alignment: .center)
                    
                    Text("그럭저럭")
                        .font(
                            Font.custom("Pretendard", size: 14)
                                .weight(.medium)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(selectedSatisfaction == "Average" ? .BackgroundBlue : Color(red: 0.88, green: 0.88, blue: 0.88))
                }
            })
            
            Spacer().frame(width: 55)
            
            Button(action: {
                selectedSatisfaction = "Satisfied"
            }, label: {
                VStack{
                    Text("🥰")
                        .font(
                            Font.custom("Pretendard", size: 44)
                                .weight(.medium)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 44, height: 44, alignment: .center)
                    
                    Text("만족해요")
                        .font(
                            Font.custom("Pretendard", size: 14)
                                .weight(.medium)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(selectedSatisfaction == "Satisfied" ? .BackgroundBlue : Color(red: 0.88, green: 0.88, blue: 0.88))
                }
            })
        }
    }
}

struct StarView: View {
    @State var rating: Int = 0
    
    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { index in
                Image(index <= rating ? "star" : "emptyStar")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(index <= rating ? .yellow : .gray)
                    .onTapGesture {
                        rating = index
                    }.padding(.trailing, -5)
            }
        }
    }
}

struct WriteView2: View {
    
    @State private var text: String = ""
    @State var isSelected1 = false
    @State var isSelected2 = false
    @Binding var isPresentingModal: Bool
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("리뷰 작성")
                    .font(
                        Font.custom("Pretendard", size: 20)
                            .weight(.medium)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                
                
                Spacer().frame(width: 18)
                
                Text("인증 시 5,000P 지급")
                    .font(Font.custom("Pretendard", size: 13))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 4)
                    .background(.white)
                    .cornerRadius(100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 100)
                            .inset(by: 0.5)
                            .stroke(Color(red: 0, green: 0.58, blue: 1), lineWidth: 1)
                    )
                Spacer()
            }
            .padding(.top, 23)
            
            Spacer().frame(height: 48)
            
            Text("총 비용을 알려주세요. (선택)")
                .font(
                    Font.custom("Pretendard", size: 16)
                        .weight(.medium)
                )
                .foregroundColor(.black)
            //
            HStack {
                TextField("", text: $text)
                    .keyboardType(.decimalPad)
                    .frame(width: 290, height: 44)
                    .background(RoundedRectangle(cornerRadius: 12)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0.88, green: 0.88, blue: 0.88), lineWidth: 1)
                        .frame(width: 307, height: 44))
                
                Spacer().frame(width: 18)
                
                Text("원")
                    .font(
                        Font.custom("Pretendard", size: 15)
                            .weight(.medium)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38))
            }
            
            Spacer().frame(height: 32)
            Text("비용 인증을 위한 영수증을 첨부해주세요. (선택)")
                .font(
                    Font.custom("Pretendard", size: 16)
                        .weight(.medium)
                )
                .foregroundColor(.black)
                .padding(.bottom, 0.5)
            Text("안심하세요. 올려주신 정보를 바른이 검수팀만 확인합니다.")
                .font(Font.custom("Pretendard", size: 12))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
            //
            MultipleImagePicker()
            //
            Text("i. 총 비용과 사진 내 비용이 일치되어야 인증됩니다.\ni. 병원명 / 비용 / 결제일이 확인되어야 합니다.")
                .font(Font.custom("Pretendard", size: 9))
                .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                .padding(.bottom, 41)
            
            VStack(alignment: .leading){
                //                Image("Line").frame(width: .infinity)
                Divider().frame(width: .infinity)
                Spacer().frame(height: 50)
                
                //
                //            Rectangle()
                //                .foregroundColor(.clear)
                //                .frame(width: 411, height: 3)
                //                .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                //                .blur(radius: 0.5)
                //
                Button(action: {
                    isSelected1.toggle()
                }) {
                    HStack {
                        Image(isSelected1 ? "Selected" : "Default")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text("개인정보 수집이용 동의 (필수)")
                            .font(Font.custom("Pretendard", size: 15))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                    }
                }
                Button(action: {
                    isSelected2.toggle()
                }) {
                    HStack {
                        Image(isSelected2 ? "Selected" : "Default")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text("민감정보 수집 이용 동의 (필수)")
                            .font(Font.custom("Pretendard", size: 15))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                    }
                }
                Spacer()
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .padding(.leading, 30)
        .padding(.trailing, 30)
        .navigationBarItems(leading: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image("Expand_right")
        }), trailing: Button(action: {

        }, label: {
            NavigationLink(destination: FinishView(isPresentingModal: $isPresentingModal), label: {
                HStack(alignment: .top, spacing: 8) {
                    Text("완료")
                        .font(
                            Font.custom("Pretendard", size: 16)
                                .weight(.medium)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.BackgroundBlue)
                        .frame(maxWidth: .infinity, alignment: .top)
                }
                .padding(8)
                .frame(width: 69, alignment: .topLeading)
                .background(.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .inset(by: 0.25)
                        .stroke(Color(red: 0, green: 0.58, blue: 1), lineWidth: 0.5)
                )
            })
        })
                            
        )
    }
}


struct FinishView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var isPresentingModal: Bool
    
    var body: some View {
        VStack {
            Image("brightness-alt-high").padding(.leading,15)
            
            Text("리뷰 업로드 완료!")
                .font(Font.custom("Pretendard", size: 20))
                .multilineTextAlignment(.center)
                .foregroundColor(.BackgroundBlue)
            
            Spacer().frame(height: 100)
        }.navigationBarBackButtonHidden(true)
            .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            isPresentingModal = false // Dismiss the ModalView after 2 seconds
                        }
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

//struct WriteView_Previews: PreviewProvider {
//    static var previews: some View {
//        WriteView()
//        WriteView2()
//        FinishView()
//    }
//}
