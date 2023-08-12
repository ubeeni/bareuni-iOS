//
//  HalfSheet.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/09.
//

import SwiftUI

struct NumberAuthHalfSheet: View {
    @State var showSheet = false
    @State private var name = ""
    @State var isConfirmed = false
    @State var btnsSelected = Array(repeating: false, count: 7)
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .top){
                Image("question").frame(width: 69, height: 61).padding(.leading, 27).padding(.top, 28)
                
                Spacer()
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(Color("TextBlack"))
                }.frame(width: 24, height: 24).padding(.trailing, 18).padding(.top, 14)
                
            }
            
            Text("개인정보 활용 동의").font(.custom("Pretendard-Medium", size: 15)).padding(.leading, 20).padding(.top, 8)
            
            Text("번호 인증을 위해서 개인정보 수집 및 이용(필수) 동의가 필요합니다. ").font(.custom("Pretendard-Medium", size: 15)).foregroundColor(Color(UIColor(red: 0.757, green: 0.757, blue: 0.757, alpha: 1))).padding(.leading, 20).padding(.top, 15)
            
            Rectangle().frame(height: 1).foregroundColor(Color(UIColor(red: 0.906, green: 0.933, blue: 0.941, alpha: 1)))
            
            VStack(alignment: .leading){
                checkToggleButton(text: "전체 동의", whichBtn: 0,  btnsSelected: $btnsSelected)
                
                HStack{
                    checkToggleButton(text: "개인정보 수집이용 동의(필수)", whichBtn: 1,  btnsSelected: $btnsSelected)
                    Spacer()
                    moreDetailedBtn()
                   
                }
                
                HStack{
                    checkToggleButton(text: "마케팅 개인정보 수집이용 동의(선택)", whichBtn: 2,  btnsSelected: $btnsSelected)
                    Spacer()
                    moreDetailedBtn()
                   
                }
                
                checkToggleButton(text: "마케팅 정보 수신 (선택)", whichBtn: 3, btnsSelected: $btnsSelected)
                
                HStack{
                    Spacer()
                    
                    checkToggleButton(text: "앱", whichBtn: 4,  btnsSelected: $btnsSelected).padding(.trailing, 23)
                    
                    checkToggleButton(text: "이메일", whichBtn: 5,  btnsSelected: $btnsSelected).padding(.trailing, 20)
                    
                    checkToggleButton(text: "SMS", whichBtn: 6,  btnsSelected: $btnsSelected)
                    
                    Spacer()
                }
                
                Button(action: {
                    self.isConfirmed.toggle()
                }, label: {
                        ZStack {
                                Rectangle().frame( height: 51)
                                    .cornerRadius(4)
                                    .foregroundColor(btnsSelected[1] ? Color("BackgroundBlue") : Color("disabledBtnColor"))
                            
                            Text("동의하고 인증하기")
                                .font(
                                    Font.custom("Pretendard-SemiBold", size: 16)
                                        .weight(.bold)
                                )
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(.white)
                        }
                }).padding(.top, 39).disabled(!btnsSelected[1])
                    .fullScreenCover(isPresented: $isConfirmed) {
                        ChangingNumberAuthView()}
                
            }.padding(.leading, 26).padding(.trailing, 20).padding(.top, 36)
        }
            
        
    }
}

struct checkToggleButton: View {
    let text: String
    var whichBtn: Int
    @Binding var btnsSelected: [Bool]
    var body: some View {
        Button(action: {
            btnsSelected[whichBtn].toggle()
            
            switch whichBtn
            {
            case 0:
                if(btnsSelected[0] == true){
                    for i in 0...btnsSelected.count - 1 {
                        btnsSelected[i] = true
                    }
                }else{
                    checkAllBtn()
                    
                }
                break
            case 1:
                if(btnsSelected[1] == false){
                    if(btnsSelected[0] == true){
                        btnsSelected[0] = false
                    }
                }
                checkAllBtn()
                break
            case 2:
                if(btnsSelected[2] == false){
                    if(btnsSelected[0] == true){
                        btnsSelected[0] = false

                    }
                }
                checkAllBtn()
                break
            case 3:
                if(btnsSelected[3] == true){
                    for i in 3...btnsSelected.count - 1 {
                        btnsSelected[i] = true
                    }
                }else{
                    for i in 4...btnsSelected.count - 1 {
                        if(btnsSelected[i] == false){
                            btnsSelected[0] = false
                            break
                        }else{
                            btnsSelected[3] = true
                        }
                    }
                    
                }
                checkAllBtn()
                break
            case 4, 5, 6:
                if(btnsSelected[whichBtn] == false){
                    if(btnsSelected[3] == true){
                        btnsSelected[3] = false
                    }
                }
                checkAllBtn()
                break
            default:
                break
            }
        }) {
            HStack {
                Image(btnsSelected[whichBtn] ? "Selected" : "Default")
                    .resizable()
                    .frame(width: 24, height: 24)
                
                Text(text)
                    .font(Font.custom("Pretendard-Regular", size: 15))
                    .padding(.leading, 9).foregroundColor(.black)
            }
        }
    }
    
    func checkAllBtn(){
        var isAllBtnChecked: Bool = true
        for i in 1...btnsSelected.count - 1{
            if(btnsSelected[i] == false){
                isAllBtnChecked = false
            }
        }
        
        if(isAllBtnChecked == true){
            btnsSelected[0] = true
        }else{
            btnsSelected[0] = false
        }
    }
}

struct moreDetailedBtn: View{
    var body: some View {
        Button(action: {
            
        }, label: {
            Text("상세보기").font(.custom("Pretendard-Regular", size: 15)).foregroundColor(Color(UIColor(red: 0.74, green: 0.74, blue: 0.74, alpha: 1)))
            
        })
    }
}

struct NumberAuthHalfSheet_Previews: PreviewProvider {
    static var previews: some View {
        NumberAuthHalfSheet()
    }
}
