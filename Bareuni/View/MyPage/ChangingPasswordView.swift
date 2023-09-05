//
//  ChangingPasswordView.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/20.
//

import SwiftUI

struct ChangingPasswordView: View {
    @Environment(\.dismiss) var dismiss
    @State var phoneNumber: String = ""
    @State var authNumber = ""
    @State var timeRemaining = 180
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var currentPW: String = ""
    @State var newPW: String = ""
    @State var newPWForCheck: String = ""

    @State var isCurrentPWHidden: Bool = true
    @State var isNewPWHidden: Bool = true
    @State var isCheckPWHidden: Bool = true

    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Spacer()
                Text("비밀번호 변경").font(.custom("Pretendard-Medium", size: 20)).padding(.leading, 24)
                Spacer()
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(Color("TextBlack"))
                }.frame(width: 24, height: 24).padding(.trailing, 24)
            }.frame(height: 40)
            
            VStack(alignment: .leading){
                Text("현재 비밀번호* ")
                  .font(
                    Font.custom("Pretendard", size: 14)
                      .weight(.medium)
                  )
                  .multilineTextAlignment(.center)
                  .foregroundColor(Color(red: 0.28, green: 0.28, blue: 0.28))
                
                ZStack(alignment: .trailing){
                    if isCurrentPWHidden {
                        SecureField("", text: $currentPW).textFieldStyle(BottomBorderTextfieldStyle())
                    }
                    else{
                        TextField("", text: $currentPW).textFieldStyle(BottomBorderTextfieldStyle())
                    }
                    
                    Button(action: {
                        isCurrentPWHidden.toggle()
                    }, label: {
                        Image(isCurrentPWHidden ? "hide" : "unhide").frame(width:25, height: 25)
                    }).padding(.bottom, 12)
                }.padding(.top, 15).padding(.leading, 5)
                
                Text("새 비밀번호* ")
                  .font(
                    Font.custom("Pretendard", size: 14)
                      .weight(.medium)
                  )
                  .multilineTextAlignment(.center)
                  .foregroundColor(Color(red: 0.28, green: 0.28, blue: 0.28)).padding(.top, 20)
                
                ZStack(alignment: .trailing){
                    if isNewPWHidden {
                        SecureField("", text: $newPW).textFieldStyle(BottomBorderTextfieldStyle())
                    }
                    else{
                        TextField("", text: $newPW).textFieldStyle(BottomBorderTextfieldStyle())
                    }
                    
                    Button(action: {
                        isNewPWHidden.toggle()
                    }, label: {
                        Image(isNewPWHidden ? "hide" : "unhide").frame(width:25, height: 25)
                    }).padding(.bottom, 12)
                }.padding(.top, 15).padding(.leading, 5)
                
                Text("i.영문, 숫자, 특수문자를 모두 포함하여 8~20자로 입력해주세요.")
                  .font(Font.custom("Pretendard", size: 12))
                  .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62)).lineLimit(2).padding(.leading, 5)
                
                Text("새 비밀번호 확인* ")
                  .font(
                    Font.custom("Pretendard", size: 14)
                      .weight(.medium)
                  )
                  .multilineTextAlignment(.center)
                  .foregroundColor(Color(red: 0.28, green: 0.28, blue: 0.28)).padding(.top, 20)
                
                
                ZStack(alignment: .trailing){
                    if isCheckPWHidden {
                        SecureField("", text: $newPWForCheck).textFieldStyle(BottomBorderTextfieldStyle())
                    }
                    else{
                        TextField("", text: $newPWForCheck).textFieldStyle(BottomBorderTextfieldStyle())
                    }
                    
                    Button(action: {
                        isCheckPWHidden.toggle()
                    }, label: {
                        Image(isCheckPWHidden ? "hide" : "unhide").frame(width:25, height: 25)
                    }).padding(.bottom, 12)
                }.padding(.top, 15).padding(.leading, 5)
                
                
            }.padding(.top, 50)
            
            Button(action: {
                MypageAPI.shared.changePassword(currentPW: currentPW, newPW: newPW, completion: {
                    result in
                    switch result{
                    case .success(let result):
                        print("결과:: \(result.message)")
                        dismiss()

                    case .failure(let error):
                        print("에러: \(error)")
                    }
                })
            }, label: {
                    ZStack {
                            Rectangle().frame( height: 51)
                                .cornerRadius(4)
                                .foregroundColor(newPW.validatePassword() && newPW.isNewPWConfirmed(newPWForCheck) && !currentPW.isEmpty ? Color("BackgroundBlue") : Color("disabledBtnColor"))
                        
                        Text("설정 완료")
                            .font(
                                Font.custom("Pretendard-SemiBold", size: 16)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(.white)
                    }
            }).padding(.top, 34).disabled(!(newPW.validatePassword() && newPW.isNewPWConfirmed(newPWForCheck) && !currentPW.isEmpty))
            
            Spacer()
            
        }.padding(.trailing, 24).padding(.leading, 26).padding(.top, 10)
    }
    func hidePassword(_ count: Int) -> String{
        String(repeating: "•", count: count)
    }
   
}
extension String {
    // 핸드폰 번호 정규성 체크
    func isNewPWConfirmed(_ pwForCheck: String) -> Bool {
        
        if(self == pwForCheck){
            return true
        }else{
            return false
        }
    }
    func validatePassword() -> Bool {
        let regex = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,50}"
        
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
}


struct BottomBorderTextfieldStyle: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        
        ZStack(alignment: .bottom) {
            Rectangle()
              .foregroundColor(.clear)
              .frame( height: 1)
              .background(Color(red: 0.55, green: 0.55, blue: 0.55))
            
            // 텍스트필드
            configuration
                .font(
                  Font.custom("Pretendard", size: 15)
                    .weight(.medium)
                )
                .padding(.trailing, 30).padding(.leading, 10).padding(.bottom, 5)
        }
    }
}

struct ChangingPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangingPasswordView()
    }
}
