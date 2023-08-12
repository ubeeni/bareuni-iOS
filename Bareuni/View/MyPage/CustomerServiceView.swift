//
//  CustomerServiceView.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/12.
//

import SwiftUI

struct CustomerServiceView: View {
    var body: some View {
        VStack{
            Divider()

        }.navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("이용 문의")
                        .font(.custom("Pretendard-Medium", size: 20))
                }
                
            }
    }
}

struct CustomerServiceView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerServiceView()
    }
}
