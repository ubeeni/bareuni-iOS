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
    @State var first: Bool = true
    
    @State private var top10: [inquiry] = [
        inquiry(title: "예약 정보 변경", question: "예약 정보를 삭제하고 싶습니다.", answer: "어쩌구 저쩌꾸 어쩌구 저쩌꾸 어쩌구 저쩌꾸 어쩌구 저쩌꾸 어쩌구 저쩌꾸 어쩌구 저쩌꾸 어쩌구 저쩌꾸 어쩌구 저쩌꾸 어쩌구 저쩌꾸 어쩌구 저쩌꾸 어쩌구 저쩌꾸 어쩌구 저쩌꾸 어쩌구 저쩌꾸 어쩌구 저쩌꾸"),
        inquiry(title: "병원 정보 수정", question: "병원 정보가 맞지 않는 것 같아서 수정하고 싶습니다.", answer: ""),
        inquiry(title: "예약 정보 변경", question: "예약 정보는 영구적으로 저장되는 건가요?", answer: "")
        ]
    @State var inquiries: [inquiry] = []
    @State private var reservation: [inquiry] = [
        inquiry(title: "예약 정보 삭제", question: "예약 정보를 삭제하고 싶습니다.", answer: "에약 정보를 변경하려면 마이페이지에 저장된 예약 정보 메뉴를 통해서 삭제할 수 있습니다."),
        inquiry(title: "예약 정보 수정", question: "예약 정보를 변경하고 싶습니다.", answer: "예약 정보 수정 방법은 다음과 같습니다. 환자 정보를 바꾸고 싶으면 예약 정보 메뉴에서 내용을 수정할 수 있으며 예약 시간은 삭제 후에 재예약을 진행해야 합니다."),
        
        ]
    @State private var hospital: [inquiry] = [
        inquiry(title: "병원 정보 수정", question: "병원 정보가 맞지 않는 것 같아서 수정하고 싶습니다.", answer: "병원 정보는 다음과 같이 수정이 가능합니다. 주소를 포함한 정보는 요청 문의 사항 메뉴를 통해 변경 신청이 가능합니다."),
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
                    first = false
                    slideBarLocation = 1
                    inquiries = top10
                }, label: {
                    VStack{
                        Text("TOP 10").font(.pretendard(.regular, size: 16)).foregroundColor(slideBarLocation == 1 ? .black: Color(UIColor(red: 0.67, green: 0.67, blue: 0.67, alpha: 1))
                        )
                        Rectangle().frame(width: 80, height: 4).foregroundColor(slideBarLocation == 1 ? Color("BackgroundBlue") : .white)
                    }
                })
                
                Spacer()
                Button(action: {
                    first = false
                    slideBarLocation = 2
                    inquiries = reservation
                }, label: {
                    VStack{
                        Text("예약 정보 변경").font(.pretendard(.regular, size: 16)).foregroundColor(slideBarLocation == 2 ? .black : Color(UIColor(red: 0.67, green: 0.67, blue: 0.67, alpha: 1)))
                        Rectangle().frame(width: 110, height: 4).foregroundColor(slideBarLocation == 2 ? Color("BackgroundBlue") : .white)
                    }
                })
                
                Spacer()
                
                Button(action: {
                    slideBarLocation = 3
                    inquiries = hospital
                }, label: {
                    VStack{
                        Text("병원 정보 수정").font(.pretendard(.regular, size: 16)).foregroundColor(slideBarLocation == 3 ? .black : Color(UIColor(red: 0.67, green: 0.67, blue: 0.67, alpha: 1)))
                        Rectangle().frame(width: 110, height: 4).foregroundColor(slideBarLocation == 3 ? Color("BackgroundBlue") : .white)
                    }
                })
                
                Spacer()
                
            }.padding(.top, 40).frame(height: 70)
            
            List(){
                


                ForEach(first ? top10 : inquiries, id: \.self.key) { inquiry in
                    disclouserView(inquiry: inquiry)
                        .listRowInsets(EdgeInsets(top: 0, // make the top 0 to remove the spacing
                                                              leading: 0,
                                                              bottom: 0,
                                                              trailing: 0))
                    
                }.listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            }.scrollContentBackground(.hidden).listStyle(.plain).listStyle(.grouped).listRowInsets(.init())
            
            

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
struct disclouserView: View {
    let inquiry: inquiry
    @State private var showDetails = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            DisclosureGroup(isExpanded: $showDetails, content: {
                
                VStack(alignment: .center){
                    Text(inquiry.answer).padding(.all, 30).font(.pretendard(.regular, size: 16)).frame(maxWidth: .infinity)
                }.frame(width: .infinity).background(Color(red: 0.95, green: 0.95, blue: 0.95))
            }
                            ,label: {
                VStack(alignment: .leading){
                    Text(inquiry.title).font(.pretendard(.medium, size: 16)).foregroundColor(Color("BackgroundBlue")).padding(.top, 36).padding(.leading, 33)
                    
                    Text(inquiry.question).font(.pretendard(.regular, size: 16)).padding(.top, 20).padding(.leading, 33).padding(.bottom, 33)
                }.padding(.trailing, 14)
                
            }).accentColor(Color(UIColor(red: 0.65, green: 0.65, blue: 0.65, alpha: 1)))
            
        }.alignmentGuide(.listRowSeparatorLeading) { viewDimensions in
            
            // 2
            return 0
        }
    }
    
}



struct CustomerServiceView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerServiceView()
    }
}
