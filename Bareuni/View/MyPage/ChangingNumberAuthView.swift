//
//  ChangingNumberAuthView.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/09.
//

import SwiftUI

struct ChangingNumberAuthView: View {
    @Environment(\.dismiss) var dismiss
    @State var phoneNumber: String = ""
    @State var authNumber = ""
    @State var timeRemaining = 180
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Spacer()
                Text("전화번호 인증").font(.custom("Pretendard-Medium", size: 20)).padding(.leading, 24)
                Spacer()
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(Color("TextBlack"))
                }.frame(width: 24, height: 24).padding(.trailing, 24)
            }.frame(height: 40)
            
            VStack(alignment: .leading){
                Text("전화번호").font(.custom("Pretendard-Medium", size: 16)).padding(.leading, 8)
                
                HStack{
                    TextField("010-0000-0000", text: $phoneNumber)
                        .padding(16)
                        .foregroundColor(Color(UIColor(red: 0.38, green: 0.38, blue: 0.38, alpha: 1)))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1)), lineWidth: 0.5)
                        ).frame(height: 48).padding(.top, 8)
                    Button(action: {
                        
                    }) {
                        Text("인증")
                            .font(.custom("Pretendard-Medium", size: 14))
                            .frame(width: 56, height: 49)
                            .background(Color.white).foregroundColor(Color("BackgroundBlue"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke( Color("BackgroundBlue"), lineWidth: 0.5)
                                    .opacity(0.6)
                            )
                    }.disabled(!validatePhoneNumber(phoneNumber))
                }
                Text("인증번호").font(.custom("Pretendard-Medium", size: 16)).padding(.leading, 8).padding(.top, 35)
                
                HStack{
                    TextField("", text: $authNumber)
                        .padding(16)
                        .keyboardType(.decimalPad)
                        .foregroundColor(Color(UIColor(red: 0.38, green: 0.38, blue: 0.38, alpha: 1)))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1)), lineWidth: 0.5)
                        ).frame(height: 48).padding(.top, 8)
                    Text("\(timeRemaining / 60) :" + String(format: "%02d", timeRemaining % 60)).foregroundColor(Color("BackgroundBlue")).font(.custom("Pretendard-Regular", size: 16)).padding(.leading, 23).onReceive(timer) { _ in
                        if self.timeRemaining > 0 {
                            self.timeRemaining -= 1
                        }
                    }
                }
                
            }.padding(.top, 43)
            
            Button(action: {
                dismiss()
            }, label: {
                    ZStack {
                            Rectangle().frame( height: 51)
                                .cornerRadius(4)
                                .foregroundColor(Color("BackgroundBlue"))
                        
                        Text("완료")
                            .font(
                                Font.custom("Pretendard-SemiBold", size: 16)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(.white)
                    }
            }).padding(.top, 49).disabled(!validateAuthNum(authNumber))
            
            Spacer()
            
        }.padding(.trailing, 24).padding(.leading, 24).padding(.top, 35)
    }
    // 핸드폰 번호 정규성 체크
    func validatePhoneNumber(_ input: String) -> Bool {
        
        let regex = "^01[0-1, 7][0-9]{7,8}$"
        
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: input)
    }
    func validateAuthNum(_ input: String) -> Bool {
        let regex = "^[0-9]{4}$"
        
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: input)
    }
   
    
}

struct ChangingNumberAuthView_Previews: PreviewProvider {
    static var previews: some View {
        ChangingNumberAuthView()
    }
}
