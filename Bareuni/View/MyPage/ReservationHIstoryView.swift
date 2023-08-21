//
//  ReservationHIstoryView.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/12.
//

import SwiftUI

struct ReservationHIstoryView: View {
    // 아래 부분 api 나오면 해당 예약 내역으로 수정 필요
    @State var reservationList: [reservation] = [ reservation(id: "1", title: "그랑치과교정의원", rate: "4.9", address: "서울시 관악구 청룡동 000-0", date: "8월 28일"), reservation(id: "1", title: "그랑치과교정의원", rate: "4.9", address: "서울시 관악구 청룡동 000-0", date: "8월 28일")]
    
    var body: some View {
        VStack{
            Divider()
            
            Spacer()
            if(reservationList.isEmpty){
               BlankView(text: "아직 예약 내역이 없어요.")

            }else{
                VStack {
                    ForEach(self.reservationList, id: \.id) { reserv in
                        EachReservationView(reservation:  reserv).padding(.bottom, 13)
                    }
                    Spacer()
                }.padding(.top, 30)
                

            }
            Spacer()


        }.navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("예약 내역")
                        .font(.custom("Pretendard-Medium", size: 20))
                }
                
            }
    }
}
struct reservation {
    let id: String
    let title: String
    let rate: String
    let address: String
    let date: String
}

struct EachReservationView: View {
    let reservation: reservation

    var body: some View {
        VStack(alignment: .leading){
            HStack(){
                Text(reservation.title)
                    .font(
                        Font.custom("Pretendard", size: 20)
                            .weight(.semibold)
                    )
                    .foregroundColor(.black)
                Image("star").resizable()
                    .frame(width: 16, height: 16)
                Text(reservation.rate)
                    .font(
                        Font.custom("Pretendard", size: 12)
                            .weight(.medium)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43))
                Spacer()
            }.padding(.leading, 23)
            
            HStack(){
                
                Image("Info").resizable()
                    .frame(width: 19, height: 19)
                Text(reservation.address)
                  .font(
                    Font.custom("Pretendard", size: 12)
                      .weight(.medium)
                  )
                  .multilineTextAlignment(.center)
                  .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43))
                Spacer()
            }.padding(.leading, 23)
            
            HStack(){
                Text(reservation.date)
                  .font(
                    Font.custom("Pretendard", size: 12)
                      .weight(.medium)
                  )
                  .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43))
                Text("상담 신청 완료")
                  .font(
                    Font.custom("Pretendard", size: 12)
                      .weight(.medium)
                  )
                  .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43))
                Spacer()
            }.padding(.leading, 23)
            
            
        }.foregroundColor(.clear)
            .frame(width: 335, height: 142)
            .background(.white)
            .cornerRadius(14)
            .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 2)
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .inset(by: 0.25)
                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 0.5)
            )
        
    }
}

struct ReservationHIstoryView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationHIstoryView()
    }
}
