//
//  PointView.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/12.
//

import SwiftUI

struct PointView: View {
    var body: some View {
        VStack{
            Divider()

        }.navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("포인트")
                        .font(.custom("Pretendard-Medium", size: 20))
                }
                
            }
    }
}

struct PointView_Previews: PreviewProvider {
    static var previews: some View {
        PointView()
    }
}
