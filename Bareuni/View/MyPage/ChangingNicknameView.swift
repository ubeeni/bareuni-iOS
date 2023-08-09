//
//  ChangingNicknameView.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/09.
//

import SwiftUI

struct ChangingNicknameView: View {
    @State var nickname: String = "이아파"
    @State var name: String = "김민지"
    @State var selectedCities: Int = 0
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
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
            }
            
            VStack(alignment: .leading){
                Text("닉네임").font(.custom("Pretendard-Medium", size: 16)).padding(.leading, 8)
                
                TextField("이아파", text: $nickname)
                    .padding(16)
                    .foregroundColor(Color(UIColor(red: 0.38, green: 0.38, blue: 0.38, alpha: 1)))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1)), lineWidth: 0.5)
                    ).frame(height: 48).padding(.top, 8)
                
            }.padding(.trailing, 24).padding(.leading, 24).padding(.top, 35)
            
            VStack(alignment: .leading){
                Text("이름").font(.custom("Pretendard-Medium", size: 16)).padding(.leading, 8)
                
                TextField("김민지", text: $name)
                    .padding(16).foregroundColor(Color(UIColor(red: 0.38, green: 0.38, blue: 0.38, alpha: 1)))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1)), lineWidth: 0.5)
                    ).frame(height: 48).padding(.top, 8)
                
            }.padding(.trailing, 24).padding(.leading, 24).padding(.top, 27)
            
            
            Button(action: {
                //아마 API연결
            }, label: {
                NavigationLink(destination: InfoView(), label: {
                ZStack {
                    
                    if selectedCities == 0 {
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
                })
            }).padding(.top, 34).padding(.trailing, 24).padding(.leading, 24)
            
            Spacer()
        }
        
    }
}

struct ChangingNicknameView_Previews: PreviewProvider {
    static var previews: some View {
        ChangingNicknameView()
    }
}
