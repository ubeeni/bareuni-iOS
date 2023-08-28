//
//  MyInfoView.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/09.
//

import SwiftUI

struct MyInfoView: View {
    @State var showingProfileImgSheet = false
    @State var showingSexSheet = false
    @State var showingOrthodonticSheet = false
    @State var showingSheet = false
    @State var isNameClicked = false
    @State var isAgeClicked = false
    @State var showNumberSheet = false
    @State var sex = "여성"
    @State var didOrthodontic = "교정 O"
    @State private var showingImagePicker = false
    @State var profileImage: Image = Image("Tooth")
    
    var body: some View {
        
        VStack {
            Divider()
            ZStack{
                profileImage
                    .resizable()
                    .aspectRatio(contentMode: .fill).frame(width: 74, height: 74).clipShape(Circle())
                    .overlay(Circle().stroke(Color(UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1).cgColor), lineWidth: 0.5))
                
                Button(action: {
                    self.showingProfileImgSheet = true
                })
                {
                    Image("profile")}
                .actionSheet(isPresented: $showingProfileImgSheet){
                    ActionSheet(title: Text("프로필 이미지 변경"), buttons: [.default(Text("프로필 이미지 변경")){
                        showingImagePicker.toggle()
                    }, .default(Text("프로필 이미지 삭제")){
                    profileImage = Image("Tooth")
                    }, .cancel(Text("취소"))])
                }
                .sheet(isPresented: $showingImagePicker) {
                    ProfileImagePicker(sourceType: .photoLibrary) { (image) in
                        
                        self.profileImage = Image(uiImage: image)
                        print(image)
                    }
                }
//                    ActionSheet(title: Text("프로필 이미지 변경"), buttons: [.default(Text("프로필 이미지 변경")){
//                        showingImagePicker.toggle()
//                    }, .default(Text("프로필 이미지 삭제")), .cancel(Text("취소"))])
                
                .frame(width: 26, height: 26).offset(x: 37, y: 34)
                
            }.padding(.top, 50)
            
            Text("바른이").font(.custom("Pretendard-SemiBold", size: 16)).padding(.top, 8)
            
            HStack{
                Text("내 정보").font(.custom("Pretendard-Medium", size: 14)).foregroundColor(Color(UIColor(red: 0.561, green: 0.561, blue: 0.561, alpha: 1))).padding(.leading, 24)
                
                Spacer()
            }.padding(.top, 34)
            
            VStack{
                Button(action: {self.isNameClicked.toggle()
                }, label: {
                    HStack{
                        Text("닉네임 / 이름").font(.custom("Pretendard-Regular", size: 16)).foregroundColor(.black)
                        Spacer()
                        Text("바른이").font(.custom("Pretendard-Regular", size: 16)).foregroundColor(Color(UIColor(red: 0.38, green: 0.38, blue: 0.38, alpha: 1)))
                    }.padding(.leading, 24).padding(.trailing, 24).frame(height: 46)}).fullScreenCover(isPresented: $isNameClicked) {
                        ChangingNicknameView()
                    }
                
                Rectangle().frame(height: 1).foregroundColor(Color(UIColor(red: 0.906, green: 0.933, blue: 0.941, alpha: 1)))
                
                Button(action: {
                    self.showingSexSheet = true
                }, label: {
                    HStack{
                        Text("성별").font(.custom("Pretendard-Regular", size: 16)).foregroundColor(.black)
                        Spacer()
                        Text(sex).font(.custom("Pretendard-Regular", size: 16)).foregroundColor(Color(UIColor(red: 0.38, green: 0.38, blue: 0.38, alpha: 1)))
                    }.padding(.leading, 24).padding(.trailing, 24).frame(height: 46)
                }).actionSheet(isPresented: $showingSexSheet){
                    ActionSheet(title: Text("성별 변경"), buttons: [.default(Text("남성"), action: {sex = "남성"}), .default(Text("여성"), action: {sex = "여성"}), .cancel(Text("취소"))])
                }
                
                Rectangle().frame(height: 1).foregroundColor(Color(UIColor(red: 0.906, green: 0.933, blue: 0.941, alpha: 1)))
                
                Button(action: {self.isAgeClicked.toggle()}, label: {
                    HStack{
                        Text("연령대").font(.custom("Pretendard-Regular", size: 16)).foregroundColor(.black)
                        Spacer()
                        Text("20대").font(.custom("Pretendard-Regular", size: 16)).foregroundColor(Color(UIColor(red: 0.38, green: 0.38, blue: 0.38, alpha: 1)))
                    }.padding(.leading, 24).padding(.trailing, 24).frame(height: 46)}).fullScreenCover(isPresented: $isAgeClicked) {
                        ChangingAgeView()
                    }
                
                Rectangle().frame(height: 1).foregroundColor(Color(UIColor(red: 0.906, green: 0.933, blue: 0.941, alpha: 1)))
                
                Button(action: {
                    showNumberSheet = true
                }, label: {
                    HStack{
                        Text("전화번호").font(.custom("Pretendard-Regular", size: 16)).foregroundColor(.black)
                        Spacer()
                        Text("-").font(.custom("Pretendard-Regular", size: 16)).foregroundColor(Color(UIColor(red: 0.38, green: 0.38, blue: 0.38, alpha: 1)))
                    }.padding(.leading, 24).padding(.trailing, 24).frame(height: 46)
                }).sheet(isPresented: $showNumberSheet){
                    NumberAuthHalfSheet( showSelfSheet: $showingSexSheet).presentationDetents([.height(544), .fraction(0.75)]).presentationDragIndicator(.hidden)
                }
                
                
                Rectangle().frame(height: 1).foregroundColor(Color(UIColor(red: 0.906, green: 0.933, blue: 0.941, alpha: 1)))
                
                Button(action: {
                    self.showingOrthodonticSheet = true
                }, label: {
                    HStack{
                        Text("교정 여부").font(.custom("Pretendard-Regular", size: 16)).foregroundColor(.black)
                        Spacer()
                        Text(didOrthodontic).font(.custom("Pretendard-Regular", size: 16)).foregroundColor(Color(UIColor(red: 0.38, green: 0.38, blue: 0.38, alpha: 1)))
                    }.padding(.leading, 24).padding(.trailing, 24).frame(height: 46)
                }).actionSheet(isPresented: $showingOrthodonticSheet){
                    ActionSheet(title: Text("교정 여부"), buttons: [.default(Text("교정 O"), action: {didOrthodontic = "교정 O"}), .default(Text("교정 X"), action: {didOrthodontic = "교정 X"}), .cancel(Text("취소"))])
                }
                
                Rectangle().frame(height: 1).foregroundColor(Color(UIColor(red: 0.906, green: 0.933, blue: 0.941, alpha: 1)))
            }.padding(.top, 32)
            
            Spacer()
            
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("내 정보")
                    .font(.custom("Pretendard-Medium", size: 20))
            }
        }
        
        Spacer()
    }
}

struct ProfileImagePicker: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIImagePickerController
    
    @Environment(\.presentationMode)
    private var presentationMode // 해당 뷰컨트롤러의 노출 여부
    let sourceType: UIImagePickerController.SourceType
    let imagePicked: (UIImage) -> () // 이미지가 선택됐을때 결과 호출
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let parent: ProfileImagePicker
        
        init(parent: ProfileImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let image = info[.originalImage] as? UIImage {
                parent.imagePicked(image)
                parent.presentationMode.wrappedValue.dismiss()
            }
            
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        
        let picker = UIImagePickerController()
        
        picker.delegate = context.coordinator
        
        return picker
        
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
}

//struct MyInfoView_Previews: PreviewProvider {
//    let show: Bool = false
//    static var previews: some View {
//        MyInfoView(showNumberSheet: show)
//    }
//}
