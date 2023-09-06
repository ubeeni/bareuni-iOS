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
    @State var age = 0
    @State var nickname = ""
    @State var didOrthodontic = false
    @State private var showingImagePicker = false
    @State var basicImage: Image = Image("Tooth")
    @State var imageURL = ""
    
    @EnvironmentObject var userInfo: MyPageUserViewModel // 사용자 정보를 저장하는 속성

    
    var body: some View {
        
        VStack {
            Divider()
            ZStack{
              basicImage
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
                    basicImage = Image("Tooth")
                    }, .cancel(Text("취소"))])
                }
                .sheet(isPresented: $showingImagePicker) {
                    ProfileImagePicker(sourceType: .photoLibrary) { (image) in
                        
                        self.basicImage = Image(uiImage: image)
                        print(image)
                    }
                }
//                    ActionSheet(title: Text("프로필 이미지 변경"), buttons: [.default(Text("프로필 이미지 변경")){
//                        showingImagePicker.toggle()
//                    }, .default(Text("프로필 이미지 삭제")), .cancel(Text("취소"))])
                
                .frame(width: 26, height: 26).offset(x: 37, y: 34)
                
            }.padding(.top, 50)
            
            Text(userInfo.user?.nickname ?? "").font(.custom("Pretendard-SemiBold", size: 16)).padding(.top, 8)
            
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
                        Text(userInfo.user?.nickname ?? "").font(.custom("Pretendard-Regular", size: 16)).foregroundColor(Color(UIColor(red: 0.38, green: 0.38, blue: 0.38, alpha: 1)))
                    }.padding(.leading, 24).padding(.trailing, 24).frame(height: 46)}).fullScreenCover(isPresented: $isNameClicked) {
                        ChangingNicknameView().environmentObject(userInfo)
                    }
                
                Rectangle().frame(height: 1).foregroundColor(Color(UIColor(red: 0.906, green: 0.933, blue: 0.941, alpha: 1)))
                
                Button(action: {
                    self.showingSexSheet = true
                }, label: {
                    HStack{
                        Text("성별").font(.custom("Pretendard-Regular", size: 16)).foregroundColor(.black)
                        Spacer()
                        Text((userInfo.user?.gender ?? "MALE") == "MALE" ? "남성" : "여성").font(.custom("Pretendard-Regular", size: 16)).foregroundColor(Color(UIColor(red: 0.38, green: 0.38, blue: 0.38, alpha: 1)))
                    }.padding(.leading, 24).padding(.trailing, 24).frame(height: 46)
                }).actionSheet(isPresented: $showingSexSheet){
                    ActionSheet(title: Text("성별 변경"), buttons: [.default(Text("남성"), action: {sex = "남성"
                        userInfo.user!.gender = "MALE"
                        MypageAPI.shared.changeGender(gender: "MALE", completion: {
                            result in
                            switch result{
                            case .success(let response):
                                print(response.message)
                                print(userInfo.user?.gender ?? "안됨")
                            case .failure(let error):
                                print("성별 변경: \(error)")
                            }
                        })
                    }), .default(Text("여성"), action: {sex = "여성"
                        userInfo.user!.gender = "FEMALE"

                        MypageAPI.shared.changeGender(gender: "FEMALE", completion: {
                            result in
                            switch result{
                            case .success(let response):
                                print(response.message)
                            case .failure(let error):
                                print("성별 변경: \(error)")
                            }
                        })
                        
                    }), .cancel(Text("취소"))])
                }
                
                Rectangle().frame(height: 1).foregroundColor(Color(UIColor(red: 0.906, green: 0.933, blue: 0.941, alpha: 1)))
                
                Button(action: {self.isAgeClicked.toggle()}, label: {
                    HStack{
                        Text("연령대").font(.custom("Pretendard-Regular", size: 16)).foregroundColor(.black)
                        Spacer()
                        Text(String(userInfo.user?.age ?? 0) + "대").font(.custom("Pretendard-Regular", size: 16)).foregroundColor(Color(UIColor(red: 0.38, green: 0.38, blue: 0.38, alpha: 1)))
                    }.padding(.leading, 24).padding(.trailing, 24).frame(height: 46)}).fullScreenCover(isPresented: $isAgeClicked) {
                        ChangingAgeView().environmentObject(userInfo)
                    }
                
                Rectangle().frame(height: 1).foregroundColor(Color(UIColor(red: 0.906, green: 0.933, blue: 0.941, alpha: 1)))
                
//                Button(action: {
//                    showNumberSheet = true
//                }, label: {
//                    HStack{
//                        Text("전화번호").font(.custom("Pretendard-Regular", size: 16)).foregroundColor(.black)
//                        Spacer()
//                        Text("-").font(.custom("Pretendard-Regular", size: 16)).foregroundColor(Color(UIColor(red: 0.38, green: 0.38, blue: 0.38, alpha: 1)))
//                    }.padding(.leading, 24).padding(.trailing, 24).frame(height: 46)
//                }).sheet(isPresented: $showNumberSheet){
//                    NumberAuthHalfSheet( showSelfSheet: $showingSexSheet).presentationDetents([.height(544), .fraction(0.75)]).presentationDragIndicator(.hidden)
//                }
                
                
//                Rectangle().frame(height: 1).foregroundColor(Color(UIColor(red: 0.906, green: 0.933, blue: 0.941, alpha: 1)))
//
                Button(action: {
                    self.showingOrthodonticSheet = true
                }, label: {
                    HStack{
                        Text("교정 여부").font(.custom("Pretendard-Regular", size: 16)).foregroundColor(.black)
                        Spacer()
                        Text(userInfo.user?.ortho ?? false ? "교정 O" : "교정 X").font(.custom("Pretendard-Regular", size: 16)).foregroundColor(Color(UIColor(red: 0.38, green: 0.38, blue: 0.38, alpha: 1)))
                    }.padding(.leading, 24).padding(.trailing, 24).frame(height: 46)
                }).actionSheet(isPresented: $showingOrthodonticSheet){
                    ActionSheet(title: Text("교정 여부"), buttons: [.default(Text("교정 O"), action: {didOrthodontic = true
                        userInfo.user!.ortho = true

                        MypageAPI.shared.changeOrtho(ortho: didOrthodontic, completion: {
                            result in
                            switch result{
                            case .success(let response):
                                print(response.message)
                            case .failure(let error):
                                print(error)
                            }
                        })
                    }), .default(Text("교정 X"), action: {
                        didOrthodontic = false
                        userInfo.user!.ortho = false
                        
                        MypageAPI.shared.changeOrtho(ortho: didOrthodontic, completion: {
                            result in
                            switch result{
                            case .success(let response):
                                print(response.message)
                            case .failure(let error):
                                print(error)
                            }
                        })
                    }), .cancel(Text("취소"))])
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
        .onAppear{
            userInfo.fetchData()
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
