//
//  AccountInfoView.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/17.
//

import SwiftUI

struct AccountInfoView: View {
    @State var id: String = "barueni@naver.com"
    @State var password: String = "•••••••••"
    @State var pwChanging: Bool = false
    var body: some View {
        VStack(alignment: .leading){
            Divider()
            
            Text("이메일")
              .font(
                Font.custom("Pretendard", size: 16)
                  .weight(.medium)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black).padding(.leading, 32).padding(.top, 27)
            
            ZStack(alignment: .leading) {
                Text(id)
                  .font(Font.custom("Pretendard", size: 16))
                  .kerning(0.2)
                  .tint(.black).padding(16)
                RoundedRectangle(cornerRadius: 8)
                  .inset(by: 0.25)
                  .stroke(Color(red: 0.88, green: 0.88, blue: 0.88), lineWidth: 0.5)
                
            }.padding(.leading, 24).padding(.trailing, 24).frame(height: 48)
            
            
            Text("비밀번호")
              .font(
                Font.custom("Pretendard", size: 16)
                  .weight(.medium)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black).padding(.leading, 32).padding(.top, 27)
            
            ZStack(alignment: .leading) {
                Text(password)
                  .font(Font.custom("Pretendard", size: 16))
                  .kerning(0.2)
                  .tint(.black).padding(16)
                RoundedRectangle(cornerRadius: 8)
                  .inset(by: 0.25)
                  .stroke(Color(red: 0.88, green: 0.88, blue: 0.88), lineWidth: 0.5)
                
            }.padding(.leading, 24).padding(.trailing, 24).frame(height: 48)
            HStack() {
                Spacer()
               Button(action: {
                   pwChanging.toggle()
               }, label: {
                   Text("비밀번호 변경")
                     .font(Font.custom("Pretendard", size: 12))
                     .multilineTextAlignment(.trailing)
                     .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
               }).fullScreenCover(isPresented: $pwChanging) {
                   ChangingPasswordView()
               }
                
            }.padding(.leading, 24).padding(.trailing, 30).padding(.top, 9)
            Spacer()

        }.navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("계정 정보")
                        .font(.custom("Pretendard-Medium", size: 20))
                }
                
            }
    }
}

struct AccountInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AccountInfoView()
    }
}
