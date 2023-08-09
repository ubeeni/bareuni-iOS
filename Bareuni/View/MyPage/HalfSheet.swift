//
//  HalfSheet.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/09.
//

import SwiftUI

struct HalfSheet: View {
    @State var showSheet = false
    @State private var name = ""
    @State private var isSelected = Array(repeating: false, count: 7)
    var body: some View {
//        Button("bottom sheet") {
//            showSheet = true
//        }
//        .sheet(isPresented: $showSheet){
//            VStack{
//                Image("question")
//
//                HStack{
//
//                }
//            }.presentationDetents([.height(544), .medium, .large]).presentationDragIndicator(.hidden)
//        }
//        .font(.title).bold()
        VStack(alignment: .leading){
            HStack(alignment: .top){
                Image("question").frame(width: 69, height: 61).padding(.leading, 27).padding(.top, 28)
                
                Spacer()
                Button(action: {
                    // dismiss()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(Color("TextBlack"))
                }.frame(width: 24, height: 24).padding(.trailing, 18).padding(.top, 14)
                
            }
            
            Text("개인정보 활용 동의").font(.custom("Pretendard-Medium", size: 15)).padding(.leading, 20).padding(.top, 8)
            
            Text("번호 인증을 위해서 개인정보 수집 및 이용(필수) 동의가 필요합니다. ").font(.custom("Pretendard-Medium", size: 15)).foregroundColor(Color(UIColor(red: 0.757, green: 0.757, blue: 0.757, alpha: 1))).padding(.leading, 20).padding(.top, 15)
            
            Rectangle().frame(height: 1).foregroundColor(Color(UIColor(red: 0.906, green: 0.933, blue: 0.941, alpha: 1)))
            
            VStack(alignment: .leading){
                checkToggleButton(text: "전체 동의", isSelected: $isSelected[0])
                
                HStack{
                    checkToggleButton(text: "개인정보 수집이용 동의(필수)", isSelected: $isSelected[1])
                    Spacer()
                    moreDetailedBtn()
                   
                }
                
            }.padding(.leading, 26).padding(.top, 36)
        }
            
        
    }
}

struct checkToggleButton: View {
    let text: String
    @Binding var isSelected: Bool
    var body: some View {
        Button(action: {
            isSelected.toggle()
        }) {
            HStack {
                Image(isSelected ? "Selected" : "Default")
                    .resizable()
                    .frame(width: 24, height: 24)
                
                Text(text)
                    .font(Font.custom("Pretendard-Regular", size: 15))
                    .padding(.leading, 9).foregroundColor(.black)
            }
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

struct HalfSheet_Previews: PreviewProvider {
    static var previews: some View {
        HalfSheet()
    }
}
