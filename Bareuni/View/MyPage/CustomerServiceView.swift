//
//  CustomerServiceView.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/12.
//

import SwiftUI

struct CustomerServiceView: View {
    @State var searchContent: String = ""
    @State var slideBarLocation: Int = 1
    @State private var inquiries: [inquiry] = [
        inquiry(title: "예약 정보 변경", question: "예약 정보를 삭제하고 싶습니다.", answer: ""),
        inquiry(title: "병원 정보 수정", question: "병원 정보가 맞지 않는 것 같아서 수정하고 싶습니다.", answer: ""),
        inquiry(title: "예약 정보 변경", question: "예약 정보는 영구적으로 저장되는 건가요?", answer: "")
        ]
    var body: some View {
        VStack(alignment: .leading){
            Divider()
            Text("무엇을 도와드릴까요?").font(.pretendard(.medium, size: 20)).padding(.leading, 33).padding(.top, 39)
            
            HStack{
                TextField("문의하고 싶은 내용을 검색하세요.", text: $searchContent).padding(16)
                    .background(Color(UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)))
                                .cornerRadius(12)
                    .frame(height: 46).padding(.leading, 23).padding(.trailing, 13)
                
                Button(action: {}, label: {
                    Image("Search").frame(width: 32, height: 32).padding(.trailing, 16)
                })
            }.padding(.top, 17)
            
            HStack(alignment: .center){
                Spacer()
                Button(action: {
                    slideBarLocation = 1
                }, label: {
                    VStack{
                        Text("TOP 10").font(.pretendard(.regular, size: 16)).foregroundColor(slideBarLocation == 1 ? .black: Color(UIColor(red: 0.67, green: 0.67, blue: 0.67, alpha: 1))
                        )
                        Rectangle().frame(width: 80, height: 4).foregroundColor(slideBarLocation == 1 ? Color("BackgroundBlue") : .white)
                    }
                })
                
                Spacer()
                Button(action: {slideBarLocation = 2}, label: {
                    VStack{
                        Text("예약 정보 변경").font(.pretendard(.regular, size: 16)).foregroundColor(slideBarLocation == 2 ? .black : Color(UIColor(red: 0.67, green: 0.67, blue: 0.67, alpha: 1)))
                        Rectangle().frame(width: 110, height: 4).foregroundColor(slideBarLocation == 2 ? Color("BackgroundBlue") : .white)
                    }
                })
                
                Spacer()
                
                Button(action: {
                    slideBarLocation = 3
                }, label: {
                    VStack{
                        Text("병원 정보 수정").font(.pretendard(.regular, size: 16)).foregroundColor(slideBarLocation == 3 ? .black : Color(UIColor(red: 0.67, green: 0.67, blue: 0.67, alpha: 1)))
                        Rectangle().frame(width: 110, height: 4).foregroundColor(slideBarLocation == 3 ? Color("BackgroundBlue") : .white)
                    }
                })
                
                Spacer()
                
            }.padding(.top, 40).frame(height: 70)
            
            List(){
                ForEach(inquiries, id: \.self.key) { inquiry in
                    InquiryView(inquiry: inquiry)
                        .listRowInsets(EdgeInsets())
                    
                }
            }.scrollContentBackground(.hidden).listStyle(.plain).listStyle(.insetGrouped)
            
            

        }.navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("이용 문의")
                        .font(.custom("Pretendard-Medium", size: 20))
                }
                
            }
    }
}

struct inquiry {
    var key = UUID()
    let title: String
    let question: String
    let answer: String
}
struct InquiryView: View{
    let inquiry: inquiry
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
                Text(inquiry.title).font(.pretendard(.medium, size: 16)).foregroundColor(Color("BackgroundBlue")).padding(.top, 36)//.padding(.leading, 33)
                
                Text(inquiry.question).font(.pretendard(.regular, size: 16)).padding(.top, 20)//.padding(.leading, 33)
           
            
            HStack{
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "chevron.down").frame(width: 24, height: 24).foregroundColor(Color(UIColor(red: 0.65, green: 0.65, blue: 0.65, alpha: 1))).padding(.trailing, 14).padding(.bottom, 19)
                })
            }
        }
        
    }

}

struct CustomerServiceView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerServiceView()
    }
}
