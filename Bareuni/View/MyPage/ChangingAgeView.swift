//
//  ChangingAgeView.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/09.
//

import SwiftUI

struct ChangingAgeView: View {
    @State var isSelected: [Bool] = Array(repeating: false, count: 6)
    @State var selectedAge: Int = 10
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Spacer()
                Text("연령대 변경").font(.custom("Pretendard-Medium", size: 20)).padding(.leading, 24)
                Spacer()
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(Color("TextBlack"))
                }.frame(width: 24, height: 24).padding(.trailing, 24)
            }.frame(height: 40)
            
            VStack(alignment: .leading){
                Text("연령대").font(.custom("Pretendard-Medium", size: 16)).padding(.leading, 8)
                
                HStack{
                    Button(action: {
                        selectAgeBtn(1)
                    }) {
                        Text("10대")
                            .font(.custom("Pretendard-Medium", size: 16))
                            .frame(width: 119, height: 55)
                            .background(Color.white).foregroundColor(isSelected[0] ? Color("BackgroundBlue") : Color("BAgray"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(isSelected[0] ? Color("BackgroundBlue") : Color("BAgray"), lineWidth: 1)
                                    .opacity(0.6)
                            )
                    }.padding(.trailing, 14)
                    
                    Button(action: {
                        selectAgeBtn(2)
                    }) {
                        Text("20대")
                            .font(.custom("Pretendard-Medium", size: 16))
                            .frame(width: 119, height: 55)
                            .background(Color.white).foregroundColor(isSelected[1] ? Color("BackgroundBlue") : Color("BAgray"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(isSelected[1] ? Color("BackgroundBlue") : Color("BAgray"), lineWidth: 1)
                                    .opacity(0.6)
                            )
                    }
                    
                }.padding(.top, 14)
                
                HStack{
                    Button(action: {
                        selectAgeBtn(3)
                    }) {
                        Text("30대")
                            .font(.custom("Pretendard-Medium", size: 16))
                            .frame(width: 119, height: 55)
                            .background(Color.white).foregroundColor(isSelected[2] ? Color("BackgroundBlue") : Color("BAgray"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(isSelected[2] ? Color("BackgroundBlue") : Color("BAgray"), lineWidth: 1)
                                    .opacity(0.6)
                            )
                    }.padding(.trailing, 14)
                    
                    Button(action: {
                        selectAgeBtn(4)
                    }) {
                        Text("40대")
                            .font(.custom("Pretendard-Medium", size: 16))
                            .frame(width: 119, height: 55)
                            .background(Color.white).foregroundColor(isSelected[3] ? Color("BackgroundBlue") : Color("BAgray"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(isSelected[3] ? Color("BackgroundBlue") : Color("BAgray"), lineWidth: 1)
                                    .opacity(0.6)
                            )
                    }
                    
                }.padding(.top, 14)
                
                HStack{
                    Button(action: {
                        selectAgeBtn(5)
                    }) {
                        Text("50대")
                            .font(.custom("Pretendard-Medium", size: 16))
                            .frame(width: 119, height: 55)
                            .background(Color.white).foregroundColor(isSelected[4] ? Color("BackgroundBlue") : Color("BAgray"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(isSelected[4] ? Color("BackgroundBlue") : Color("BAgray"), lineWidth: 1)
                                    .opacity(0.6)
                            )
                    }.padding(.trailing, 14)
                    
                    Button(action: {
                        selectAgeBtn(6)
                    }) {
                        Text("60대")
                            .font(.custom("Pretendard-Medium", size: 16))
                            .frame(width: 119, height: 55)
                            .background(Color.white).foregroundColor(isSelected[5] ? Color("BackgroundBlue") : Color("BAgray"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(isSelected[5] ? Color("BackgroundBlue") : Color("BAgray"), lineWidth: 1)
                                    .opacity(0.6)
                            )
                    }
                    
                }.padding(.top, 14)
                
                Button(action: {
                    dismiss()
                }, label: {
                        ZStack {
                                Rectangle().frame( height: 51)
                                    .cornerRadius(4)
                                    .foregroundColor(Color("BackgroundBlue"))
                            
                            Text("설정 완료")
                                .font(
                                    Font.custom("Pretendard-SemiBold", size: 16)
                                        .weight(.bold)
                                )
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(.white)
                        }
                }).padding(.top, 34)
                
                Spacer()
            }.padding(.leading, 24).padding(.trailing, 24).padding(.top, 43)
            
        }
    }
    func selectAgeBtn(_ age: Int) {
        for i in 0...isSelected.count - 1 {
            if(i == age - 1){
                isSelected[i] = true
            }else{
                isSelected[i]  = false
            }
        }
    }
}


struct ChangingAgeView_Previews: PreviewProvider {
    static var previews: some View {
        ChangingAgeView()
    }
}
