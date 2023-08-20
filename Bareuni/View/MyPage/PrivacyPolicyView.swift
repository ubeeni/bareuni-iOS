//
//  PrivacyPolicyView.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/17.
//

import SwiftUI

struct PrivacyPolicyView: View {
    var body: some View {
        ScrollView{
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
                    Group{
                        Text("1. 개인정보의 수집목적")
                          .font(
                            Font.custom("Pretendard", size: 16)
                              .weight(.medium)
                          )
                          .foregroundColor(.black).padding(.top, 40)
                        
                        detailedPrivacyView(title: "i. 회원 관리", content: "회원제 서비스 제공, 개인식별, 회사 이용약관 위반, 회원에 대한 이용제한 조치, 서비스의 원활한 운영에 지장을 미치는 행위 및 서비스 부정이용 행위 제재, 가입의사 확인, 기업 및 가입횟수 제한, 만 14세 미만 아동 여부 확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달, 회원탈퇴 의사의 확인")
                        
                        detailedPrivacyView(title: "ii. 서비스 제공 및 기능 개선", content: "컨텐츠 제공, 결제, 물품, 또는 경품 배송, 본인인증 및 연령확인, 자료분석, 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산, 어플리케이션 기능 개선, 서비스 기술 개발 및 신규 서비스 출시, 플랫폼 내 개인화 서비스 제공, 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 광고 서비스 제공, 위치 정보에 기반한 검색결과 제공 및 맞춤형 광고 제공")
                        
                        detailedPrivacyView(title: "iii. 마케팅", content: "푸시, SMS,이메일 광고 전송, 이벤트 정보 및 참여 기회 제공")
                    }
                    
                    
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

}

struct detailedPrivacyView:  View {
    let title: String
    let content: String
    
    var body: some View {
        Text(title)
          .font(Font.custom("Pretendard", size: 12))
          .foregroundColor(.black)
          .padding(.top, 10)
        
        Text(content)
          .font(Font.custom("Pretendard", size: 12))
          .foregroundColor(.black)
          .lineSpacing(3)
    }
}
struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView()
    }
}
