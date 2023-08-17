//
//  AccountInfoView.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/17.
//

import SwiftUI

struct AccountInfoView: View {
    var body: some View {
        VStack(alignment: .leading){
            Divider()
            
            Text("이메일")
              .font(
                Font.custom("Pretendard", size: 16)
                  .weight(.medium)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black).padding(.leading, 32)
            
            HStack() {
                Text("barueni@naver.com")
                  .font(Font.custom("Pretendard", size: 16))
                  .kerning(0.2)
                  .tint(.black).frame(maxWidth: .infinity).padding(16).overlay(
                    RoundedRectangle(cornerRadius: 8)
                      .inset(by: 0.25)
                      .stroke(Color(red: 0.88, green: 0.88, blue: 0.88), lineWidth: 0.5)
                  )
            }.padding(.leading, 24).padding(.trailing, 24)
            
            
            Text("비밀번호")
              .font(
                Font.custom("Pretendard", size: 16)
                  .weight(.medium)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black).padding(.leading, 32)
            
            HStack(alignment: .center, spacing: 8) {
                Text("barueni@naver.com")
                  .font(Font.custom("Pretendard", size: 16))
                  .kerning(0.2)
                  .tint(.black)
            }
            .padding(16)
            .frame(height: 48, alignment: .leading)
            .background(.white)
            .cornerRadius(8)
            .overlay(
              RoundedRectangle(cornerRadius: 8)
                .inset(by: 0.25)
                .stroke(Color(red: 0.88, green: 0.88, blue: 0.88), lineWidth: 0.5)
            )

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
