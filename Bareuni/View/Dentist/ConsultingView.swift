//
//  ConsultingView.swift
//  Bareuni
//
//  Created by 황인성 on 2023/07/27.
//

import SwiftUI

struct ConsultingView: View {
    
    @State var name: String = ""
    @State var phoneNumber: String = ""
    @State var isSelected1 = false
    @State var isSelected2 = false
    
    var body: some View {
        VStack{
            Divider().padding(.bottom, 41)
            
            Button(action: {
                isSelected1.toggle()
            }, label: {
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 290, height: 100)
                        .background(.white)
                        .cornerRadius(9)
                        .overlay(
                            RoundedRectangle(cornerRadius: 9)
                                .inset(by: 0.25)
                                .stroke(isSelected1 ? Color(red: 0, green: 0.58, blue: 1) : Color(red: 0.88, green: 0.88, blue: 0.88), lineWidth: 0.5)
                        )
                    HStack {
                        Image(isSelected1 ? "Ellipse 168" : "Ellipse 166")
                            .frame(width: 16, height: 16)
                            .background(.white)
                            .overlay(
                                Circle()
                                    .stroke(isSelected1 ? Color(red: 0, green: 0.58, blue: 1) : Color(red: 0.88, green: 0.88, blue: 0.88), lineWidth: 0.5)
                            )
                        VStack {
                            Text("병원에서 전화오면 예약할게요")
                                .font(
                                    Font.custom("Pretendard", size: 14)
                                        .weight(.medium)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                            Text("병원이 직접 전화드려요.\n처음 보는 번호로 연락이 올 수 있어요.")
                                .font(Font.custom("Pretendard", size: 12))
                                .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38))
                        }
                    }
                }
            }).padding(.bottom, 20)
            
            Button(action: {
                isSelected2.toggle()
            }, label: {
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 290, height: 100)
                        .background(.white)
                        .cornerRadius(9)
                        .overlay(
                            RoundedRectangle(cornerRadius: 9)
                                .inset(by: 0.25)
                                .stroke(isSelected2 ? Color(red: 0, green: 0.58, blue: 1) : Color(red: 0.88, green: 0.88, blue: 0.88), lineWidth: 0.5)
                        )
                    HStack {
                        Image(isSelected2 ? "Ellipse 168" : "Ellipse 166")
                            .frame(width: 16, height: 16)
                            .background(.white)
                            .overlay(
                                Circle()
                                    .stroke(isSelected2 ? Color(red: 0, green: 0.58, blue: 1) : Color(red: 0.88, green: 0.88, blue: 0.88), lineWidth: 0.5)
                            )
                        VStack {
                            Text("앱에서 바로 예약할게요")
                                .font(
                                    Font.custom("Pretendard", size: 14)
                                        .weight(.medium)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                            Text("원하는 날짜와 시간을 선택해요.\n앱에서 예약변경 및 취소가 가능해요.")
                                .font(Font.custom("Pretendard", size: 12))
                                .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38))
                        }
                    }
                }
            }).padding(.bottom, 62)
            
            HStack{
                Text("상담받는 분 ")
                  .font(
                    Font.custom("Pretendard", size: 18)
                      .weight(.semibold)
                  )
                  .foregroundColor(.black)
                  .padding(.leading, 32)
                
                Spacer()
                
                Text("개인정보 인증이 필요해요")
                  .font(
                    Font.custom("Pretendard", size: 12)
                      .weight(.medium)
                  )
                  .foregroundColor(Color(red: 0, green: 0.58, blue: 1))
                  .padding(.trailing, 32)
            }
            .padding(.bottom, 13)
            
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 390, height: 1)
              .background(Color(red: 0.91, green: 0.93, blue: 0.94))
              .padding(.bottom, 27)
            
            HStack {
                Text("이름")
                  .font(
                    Font.custom("Pretendard", size: 16)
                      .weight(.medium)
                  )
              .foregroundColor(.black)
              .padding(.leading, 32)
                Spacer()
            }
            
            TextField("", text: $name)
                .frame(width: 290, height: 51)
                .background(RoundedRectangle(cornerRadius: 12)
                    .inset(by: 0.5)
                    .stroke(Color(red: 0.88, green: 0.88, blue: 0.88), lineWidth: 1)
                .frame(width: 342, height: 51))
            
            HStack {
                Text("연락처")
                  .font(
                    Font.custom("Pretendard", size: 16)
                      .weight(.medium)
                  )
              .foregroundColor(.black)
              .padding(.leading, 32)
                
                Spacer()
            }
            
            HStack {
                TextField("", text: $phoneNumber)
                    .frame(width: 220, height: 51)
                    .overlay(RoundedRectangle(cornerRadius: 12)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0.88, green: 0.88, blue: 0.88), lineWidth: 1)
                    .frame(width: 256, height: 51))
                    .padding(.trailing, 30)
                    .padding(.leading, 43)
                
                
                
                Text("인증")
                  .foregroundColor(Color(red: 0, green: 0.58, blue: 1))
                  .frame(width: 72, height: 51)
                  .background(.white)
                  .cornerRadius(8)
                  .overlay(
                    RoundedRectangle(cornerRadius: 8)
                      .inset(by: 0.5)
                      .stroke(Color(red: 0, green: 0.58, blue: 1), lineWidth: 1)
                  )
                  .padding(.trailing, 25)
            }.frame(width: 342, height: 51)
        Spacer()
            
        }
    }
}

struct ConsultingView2: View {
    
    var body: some View{
        Text("asd")
    }
}

struct ConsultingView_Previews: PreviewProvider {
    static var previews: some View {
        ConsultingView()
        ConsultingView2()
    }
}
