//
//  PrivacyPolicyView.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/17.
//

import SwiftUI

struct PrivacyPolicyView: View {
    var body: some View {
        VStack(alignment: .center){
            Divider()
                Image("BlueLogo").resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 87, height: 47)
                    .clipped().padding(.top, 38)
            
            Text("바른이 개인정보 처리방침 (230519~)")
              .font(
                Font.custom("Pretendard", size: 20)
                  .weight(.medium)
              )
              .foregroundColor(.black).padding(.top, 38)
            
            Text("바른이 회사는 바른이 어플리게이션 서비스 (이하 ’서비스’)를 운영함에 있어 서비스 이용자의 개인정보를 보호하고 이와 관련된 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 바른이 개인정보처리방침을 수립, 공개합니다. 본 개인정보처리방침은 아래와 같은 내용을 담고 있습니다. ")
                .font(Font.custom("Pretendard", size: 12)).lineSpacing(3)
              .foregroundColor(.black).padding(.top, 26).padding(.leading, 36).padding(.trailing, 36)
            
            VStack(alignment: .leading, spacing: 20){
                Text("[목차]")
                  .font(Font.custom("Pretendard", size: 12))
                  .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                  .frame(width: 39, alignment: .topLeading)
                
                HStack{
                    Text("1.")
                      .font(Font.custom("Pretendard", size: 12))
                      .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                    
                    Button(action: {
                        
                    }, label: {
                        Text("개인정보의 수집목적")
                          .font(Font.custom("Pretendard", size: 12))
                          .underline()
                          .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                    })
                    
                    Spacer()
                }
                
                HStack{
                    Text("2.")
                      .font(Font.custom("Pretendard", size: 12))
                      .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                    
                    Button(action: {
                        
                    }, label: {
                        Text("개인정보의 처리 및 보유기간")
                          .font(Font.custom("Pretendard", size: 12))
                          .underline()
                          .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                    })
                    
                    Spacer()
                }
                
                HStack{
                    Text("3.")
                      .font(Font.custom("Pretendard", size: 12))
                      .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                    
                    Button(action: {
                        
                    }, label: {
                        Text("개인정보의 제 3자 제공")
                          .font(Font.custom("Pretendard", size: 12))
                          .underline()
                          .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                    })
                    
                    Spacer()
                }
                
                HStack{
                    Text("4.")
                      .font(Font.custom("Pretendard", size: 12))
                      .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                    
                    Button(action: {
                        
                    }, label: {
                        Text("개인정보 처리 위탁")
                          .font(Font.custom("Pretendard", size: 12))
                          .underline()
                          .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                    })
                    
                    Spacer()
                }
                
                HStack{
                    Text("5.")
                      .font(Font.custom("Pretendard", size: 12))
                      .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                    
                    Button(action: {
                        
                    }, label: {
                        Text("이용자 및 법정대리인의 권리와 그 행사방법")
                          .font(Font.custom("Pretendard", size: 12))
                          .underline()
                          .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                    })
                    
                    Spacer()
                }
                
                HStack{
                    Text("6.")
                      .font(Font.custom("Pretendard", size: 12))
                      .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                    
                    Button(action: {
                        
                    }, label: {
                        Text("처리하는 개인정보 항목")
                          .font(Font.custom("Pretendard", size: 12))
                          .underline()
                          .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                    })
                    
                    Spacer()
                }
                
                HStack{
                    Text("7.")
                      .font(Font.custom("Pretendard", size: 12))
                      .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                    
                    Button(action: {
                        
                    }, label: {
                        Text("개인정보의 파기")
                          .font(Font.custom("Pretendard", size: 12))
                          .underline()
                          .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                    })
                    
                    Spacer()
                }
                Spacer()
                
            }.padding(.leading, 35).padding(.trailing, 35).padding(.top, 30)
                

        }.navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("개인정보 처리방침")
                        .font(.custom("Pretendard-Medium", size: 20))
                }
                
            }
    }

}


struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView()
    }
}
