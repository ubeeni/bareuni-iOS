//
//  AlarmSettingView.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/17.
//

import SwiftUI

struct AlarmSettingView: View {
    var body: some View {
        VStack(alignment: .leading){
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

struct AlarmSettingView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmSettingView()
    }
}
