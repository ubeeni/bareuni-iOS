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
    @State var isNameClicked = false
    @State var isAgeClicked = false
    @State var sex = "여성"
    
    var body: some View {
        VStack {
            ZStack{
                Image("Tooth")
                    .resizable()
                    .aspectRatio(contentMode: .fill).frame(width: 74, height: 74).clipShape(Circle())
                    .overlay(Circle().stroke(Color(UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1).cgColor), lineWidth: 0.5))
                
                Button(action: {
                    self.showingProfileImgSheet = true
                })
                {
                    Image("profile")}
                .actionSheet(isPresented: $showingProfileImgSheet) {
                    ActionSheet(title: Text("프로필 이미지 변경"), buttons: [.default(Text("프로필 이미지 변경")), .default(Text("프로필 이미지 삭제")), .cancel(Text("취소"))])
                }
                .frame(width: 26, height: 26).offset(x: 37, y: 34)
                
            }.padding(.top, 50)
            
            Text("이아파").font(.custom("Pretendard-SemiBold", size: 16)).padding(.top, 8)
            
            HStack{
                Text("내 정보").font(.custom("Pretendard-Medium", size: 14)).foregroundColor(Color(UIColor(red: 0.561, green: 0.561, blue: 0.561, alpha: 1))).padding(.leading, 24)
                
                Spacer()
            }.padding(.top, 34)
            
            VStack{
                Button(action: {self.isNameClicked.toggle()}, label: {
                    HStack{
                        Text("닉네임 / 이름").font(.custom("Pretendard-Regular", size: 16)).foregroundColor(.black)
                        Spacer()
                        Text("이아파").font(.custom("Pretendard-Regular", size: 16)).foregroundColor(Color(UIColor(red: 0.38, green: 0.38, blue: 0.38, alpha: 1)))
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
                
                HStack{
                    Text("전화번호").font(.custom("Pretendard-Regular", size: 16))
                    Spacer()
                    Text("-").font(.custom("Pretendard-Regular", size: 16)).foregroundColor(Color(UIColor(red: 0.38, green: 0.38, blue: 0.38, alpha: 1)))
                }.padding(.leading, 24).padding(.trailing, 24).frame(height: 46)
                
                Rectangle().frame(height: 1).foregroundColor(Color(UIColor(red: 0.906, green: 0.933, blue: 0.941, alpha: 1)))
                
                HStack{
                    Text("교정 여부").font(.custom("Pretendard-Regular", size: 16))
                    Spacer()
                    Text("교정 O").font(.custom("Pretendard-Regular", size: 16)).foregroundColor(Color(UIColor(red: 0.38, green: 0.38, blue: 0.38, alpha: 1)))
                }.padding(.leading, 24).padding(.trailing, 24).frame(height: 46)
                
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
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Image("icon_search")
            }
        }
        .padding(.top, 28)
        Spacer()
    }
}

struct MyInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MyInfoView()
    }
}
