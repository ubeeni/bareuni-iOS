//
//  ChangingNicknameView.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/09.
//

import SwiftUI

struct ChangingNicknameView: View {
    @EnvironmentObject var userInfo: MyPageUserViewModel // 사용자 정보를 저장하는 속성
    @State private var isNickNameExisted = false
    @State var newNickname = ""
    @State var isEditing = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Spacer()
                Text("닉네임 / 이름 변경").font(.custom("Pretendard-Medium", size: 20)).padding(.leading, 24)
                Spacer()
                Button(action: {
                   dismiss()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(Color("TextBlack"))
                }.frame(width: 24, height: 24).padding(.trailing, 24)
            }.frame(height: 40)
            
            VStack(alignment: .leading){
                Text("닉네임").font(.custom("Pretendard-Medium", size: 16)).padding(.leading, 8)
                
                
                TextField(userInfo.user!.nickname, text: $newNickname, onEditingChanged: { editing in
                    self.isEditing = editing // 사용자의 편집 상태를 감지하여 isEditing을 업데이트
                })
                    .padding(16)
                    .foregroundColor(Color(UIColor(red: 0.38, green: 0.38, blue: 0.38, alpha: 1)))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1)), lineWidth: 0.5)
                    ).frame(height: 48).padding(.top, 8)
                
            }.padding(.trailing, 24).padding(.leading, 24).padding(.top, 35)
            
            
            Text("중복된 닉네임 입니다. ").font(.custom("Pretendard-Regular", size: 12)).padding(.leading, 8).foregroundColor(Color(UIColor(red: 1, green: 0.314, blue: 0.314, alpha: 1))).frame(height: 30).padding(.leading, 35).opacity(isNickNameExisted ? 1 : 0)
            
            
            
            Button(action: {
                MypageAPI.shared.changeNickname(nickname: newNickname, completion: {
                    result in
                    switch result{
                    case .success(let response):

                        userInfo.user!.nickname = newNickname
                        dismiss()
                    case .failure(let error):
                        print("닉네임 변경: \(error)")
                    }
                })
                
            }, label: {
                    ZStack {
                        if isEditing == false {
                            Rectangle().frame( height: 51)
                                .cornerRadius(4)
                                .foregroundColor(Color("disabledBtnColor"))
                        }
                        else{
                            Rectangle().frame( height: 51)
                                .cornerRadius(4)
                                .foregroundColor(Color("BackgroundBlue"))
                        }
                        
                        Text("설정 완료")
                            .font(
                                Font.custom("Pretendard-SemiBold", size: 16)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(.white)
                    }
            }).padding(.top, 34).padding(.trailing, 24).padding(.leading, 24)
            
            Spacer()
        }
        
    }
}


