//
//  WriteView.swift
//  Bareuni
//
//  Created by 황인성 on 2023/07/21.
//

import SwiftUI

struct WriteView: View {
    
    @State private var reviewText = ""
    @State var selectedSatisfaction1 = ""
    @State var selectedSatisfaction2 = ""
    @State var selectedSatisfaction3 = ""
    let placeholder = "Placeholder"
    
    var body: some View {
        NavigationView {
            VStack{
                //                NavigationLink(destination: EmptyView(), label: {
                //                    Text("asd")
                //                })
                Text("리뷰 작성")
                    .font(
                        Font.custom("Pretendard", size: 20)
                            .weight(.medium)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                
                Text("평균적인 별점을 매겨주세요")
                    .font(
                        Font.custom("Pretendard", size: 12)
                            .weight(.medium)
                    )
                    .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                
                Text("진료 결과")
                    .font(
                        Font.custom("Pretendard", size: 16)
                            .weight(.medium)
                    )
                    .foregroundColor(.black)
                
                EvaluationButton(text: "진료결과", selectedSatisfaction: $selectedSatisfaction1)
                
                Text("서비스")
                    .font(
                        Font.custom("Pretendard", size: 16)
                            .weight(.medium)
                    )
                    .foregroundColor(.black)
                
                EvaluationButton(text: "서비스", selectedSatisfaction: $selectedSatisfaction2)
                
                Text("시설 및 장비")
                    .font(
                        Font.custom("Pretendard", size: 16)
                            .weight(.medium)
                    )
                    .foregroundColor(.black)
                
                EvaluationButton(text: "시설 및 장비", selectedSatisfaction: $selectedSatisfaction3)
                
                VStack {
                    Text("\(reviewText.count) characters / at least 20 characters")
                        .font(Font.custom("Pretendard", size: 12))
                        .multilineTextAlignment(.center)
                        .foregroundColor(reviewText.count >= 20 || reviewText.count == 0 ? Color(red: 0.62, green: 0.62, blue: 0.62) : .red)
                    
                    TextEditor(text: $reviewText)
                        .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                        .frame(width: 342, height: 107)
                        .background(Color.white)
                        .cornerRadius(12)
                        .background(alignment: .topLeading) {
                            TextEditor(text: .constant(reviewText.isEmpty ? placeholder : ""))
                                .foregroundColor(.gray)
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .inset(by: 0.5)
                                .stroke(reviewText.count >= 20 || reviewText.count == 0 ? Color(red: 0.88, green: 0.88, blue: 0.88) : Color.red, lineWidth: 1)
                        )
                }
                VStack {
                    Text("관련 사진을 첨부해주세요. (선택)")
                        .font(
                            Font.custom("Pretendard", size: 16)
                                .weight(.medium)
                        )
                        .foregroundColor(.black)
                    
                    Text("치과 내부 사진이나 치아교정 전후 사진 등을 추가해주세요. ")
                        .font(Font.custom("Pretendard", size: 12))
                        .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                    
                    MultipleImagePicker()
                    
                    NavigationLink(destination: EmptyView(), label: {
                        Text("asd")
                    })
                }
            }
        }
    }
}



struct EvaluationButton: View {
    let text: String
    @Binding var selectedSatisfaction: String
    
    var body: some View {
        HStack{
            Button(action: {
                selectedSatisfaction = "Dissatisfied"
            }, label: {
                VStack{
                    Text("😓")
                        .font(
                            Font.custom("Pretendard", size: 44)
                                .weight(.medium)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 44, height: 44, alignment: .center)
                    
                    Text("불만족해요")
                        .font(
                            Font.custom("Pretendard", size: 14)
                                .weight(.medium)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(selectedSatisfaction == "Dissatisfied" ? Color(red: 0, green: 0.58, blue: 1) : Color(red: 0.88, green: 0.88, blue: 0.88))
                }
            })
            
            Button(action: {
                selectedSatisfaction = "Average"
            }, label: {
                VStack{
                    Text("🙂")
                        .font(
                            Font.custom("Pretendard", size: 44)
                                .weight(.medium)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 44, height: 44, alignment: .center)
                    
                    Text("그럭저럭")
                        .font(
                            Font.custom("Pretendard", size: 14)
                                .weight(.medium)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(selectedSatisfaction == "Average" ? Color(red: 0, green: 0.58, blue: 1) : Color(red: 0.88, green: 0.88, blue: 0.88))
                }
            })
            
            Button(action: {
                selectedSatisfaction = "Satisfied"
            }, label: {
                VStack{
                    Text("🥰")
                        .font(
                            Font.custom("Pretendard", size: 44)
                                .weight(.medium)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 44, height: 44, alignment: .center)
                    
                    Text("만족해요")
                        .font(
                            Font.custom("Pretendard", size: 14)
                                .weight(.medium)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(selectedSatisfaction == "Satisfied" ? Color(red: 0, green: 0.58, blue: 1) : Color(red: 0.88, green: 0.88, blue: 0.88))
                }
            })
        }
    }
}

struct WriteView2: View {
    
    @State private var text: String = ""
    @State var isSelected1 = false
    @State var isSelected2 = false
    
    var body: some View {
        VStack{
            HStack{
                Text("리뷰 작성")
                    .font(
                        Font.custom("Pretendard", size: 20)
                            .weight(.medium)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                
//                HStack(alignment: .top, spacing: 8) {
                    Text("인증 시 5,000P 지급")
                        .font(Font.custom("Pretendard", size: 13))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
//                }
                .padding(.horizontal, 12)
                .padding(.vertical, 4)
                .background(.white)
                .cornerRadius(100)
                .overlay(
                    RoundedRectangle(cornerRadius: 100)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0, green: 0.58, blue: 1), lineWidth: 1)
                )
            }
            
            Text("총 비용을 알려주세요. (선택)")
              .font(
                Font.custom("Pretendard", size: 16)
                  .weight(.medium)
              )
              .foregroundColor(.black)
            
            HStack {
                TextField("", text: $text)
                    .keyboardType(.decimalPad)
                    .frame(width: 290, height: 44)
                    .background(RoundedRectangle(cornerRadius: 12)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0.88, green: 0.88, blue: 0.88), lineWidth: 1)
                    .frame(width: 307, height: 44))
                
                Text("원")
                  .font(
                    Font.custom("Pretendard", size: 15)
                      .weight(.medium)
                  )
                  .multilineTextAlignment(.center)
                  .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38))
            }
            Text("비용 인증을 위한 영수증을 첨부해주세요. (선택)")
              .font(
                Font.custom("Pretendard", size: 16)
                  .weight(.medium)
              )
              .foregroundColor(.black)
            Text("안심하세요. 올려주신 정보를 바른이 검수팀만 확인합니다.")
              .font(Font.custom("Pretendard", size: 12))
              .multilineTextAlignment(.center)
              .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
            
            MultipleImagePicker()
            
            Text("i. 총 비용과 사진 내 비용이 일치되어야 인증됩니다.\ni. 병원명 / 비용 / 결제일이 확인되어야 합니다.")
              .font(Font.custom("Pretendard", size: 9))
              .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
            
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 411, height: 3)
              .background(Color(red: 0.85, green: 0.85, blue: 0.85))
              .blur(radius: 0.5)
            
            Button(action: {
                isSelected1.toggle()
            }) {
                HStack {
                    Image(isSelected1 ? "Selected" : "Default")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("개인정보 수집이용 동의 (필수)")
                      .font(Font.custom("Public Sans", size: 15))
                      .multilineTextAlignment(.center)
                      .foregroundColor(.black)
                }
            }
            Button(action: {
                isSelected2.toggle()
            }) {
                HStack {
                    Image(isSelected2 ? "Selected" : "Default")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("민감정보 수집 이용 동의 (필수)")
                      .font(Font.custom("Public Sans", size: 15))
                      .multilineTextAlignment(.center)
                      .foregroundColor(.black)
                }
            }
        }
    }
}


struct WriteView_Previews: PreviewProvider {
    static var previews: some View {
        WriteView()
        WriteView2()
    }
}
