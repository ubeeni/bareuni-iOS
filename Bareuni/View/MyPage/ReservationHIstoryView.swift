//
//  ReservationHIstoryView.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/12.
//

import SwiftUI

struct ReservationHIstoryView: View {
    // 아래 부분 api 나오면 해당 예약 내역으로 수정 필요
    @State var dentistList: [DentistData] = []
    
    var body: some View {
        VStack{
            Divider()
            
            Spacer()
            if(dentistList.isEmpty){
                BlankView(text: "아직 예약 내역이 없어요.")
            }else{
                
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

struct ReservationHIstoryView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationHIstoryView()
    }
}
