//
//  AlarmSettingView.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/17.
//

import SwiftUI

struct AlarmSettingView: View {
    @State var recommendAlarm: Bool = true
    @State var generalAlarm: Bool = true
    @State var sendSMS: Bool = true
    @State var sendEmail: Bool = true

    
    var body: some View {
        VStack(alignment: .leading){
            Divider()
            
            Text("알림 설정")
              .font(
                Font.custom("Pretendard", size: 16)
                  .weight(.medium)
              )
              .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62)).padding(.leading, 24).padding(.top, 46)
            
            HStack(alignment: .center){
                Text("추천 치과 알림")
                  .font(Font.custom("Pretendard", size: 16))
                  .foregroundColor(.black)
                
                Spacer()
                
                Toggle(isOn: $recommendAlarm, label: { })
                    .padding()
                    .toggleStyle(SwitchToggleStyle(tint: Color("BackgroundBlue")))
                
            }.padding(.leading, 25).padding(.trailing, 24).frame(height: 55).padding(.top, 25)
            Divider()
            
            HStack(alignment: .center){
                Text("일반 알림")
                  .font(Font.custom("Pretendard", size: 16))
                  .foregroundColor(.black)
                
                Spacer()
                
                Toggle(isOn: $generalAlarm, label: { })
                    .padding()
                    .toggleStyle(SwitchToggleStyle(tint: Color("BackgroundBlue")))
                
            }.padding(.leading, 25).padding(.trailing, 24).frame(height: 55)
            Divider()
            
            Text("마케팅 정보 수신")
              .font(
                Font.custom("Pretendard", size: 16)
                  .weight(.medium)
              )
              .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62)).padding(.leading, 24).padding(.top, 46).padding(.top, 30)
            
            Group{
                HStack(alignment: .center){
                    Text("SMS")
                      .font(Font.custom("Pretendard", size: 16))
                      .foregroundColor(.black)
                    
                    Spacer()
                    
                    Toggle(isOn: $recommendAlarm, label: { })
                        .padding()
                        .toggleStyle(SwitchToggleStyle(tint: Color("BackgroundBlue")))
                    
                }.padding(.leading, 25).padding(.trailing, 24).frame(height: 55).padding(.top, 20)
                Divider()
                
                HStack(alignment: .center){
                    Text("이메일")
                      .font(Font.custom("Pretendard", size: 16))
                      .foregroundColor(.black)
                    
                    Spacer()
                    
                    Toggle(isOn: $generalAlarm, label: { })
                        .padding()
                        .toggleStyle(SwitchToggleStyle(tint: Color("BackgroundBlue")))
                    
                }.padding(.leading, 25).padding(.trailing, 24).frame(height: 55)
                Divider()
                
                Spacer()
            }
            

        }.navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("알림 설정")
                        .font(.custom("Pretendard-Medium", size: 20))
                }
                
            }
    }
}

struct AlarmSettingView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmSettingView()
    }
}
