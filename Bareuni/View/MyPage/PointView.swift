//
//  PointView.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/12.
//

import SwiftUI

struct PointView: View {
    @State var pointAmount: Int = 5000
    var body: some View {
        VStack(alignment: .leading){
            Divider()
            HStack{
                Text("내 포인트").font(.pretendard(.medium, size: 20))
                
                Spacer()
                
                Text(pointString + pString).font(.pretendard(.regular, size: 24))
               
            }.padding(.leading, 33).padding(.trailing, 28)
            
            Image("Bar").padding(.top, 53)
            
            Text("포인트 내역").font(.pretendard(.medium, size: 16)).padding(.leading, 33)
            
            HStack{
              
            }

        }.navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("포인트")
                        .font(.custom("Pretendard-Medium", size: 20))
                }
                
            }
    }
}
extension PointView {
    @available(iOS 15, *)
    var pointString: AttributedString {
            var result = AttributedString(numberCommaFormatter(number: pointAmount))
            result.foregroundColor = Color("BackgroundBlue")
            return result
        }

        var pString: AttributedString {
            var result = AttributedString("p")
            result.foregroundColor = .black
            return result
        }
    func numberCommaFormatter(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(from: NSNumber(value: number))!
    }
}

struct PointView_Previews: PreviewProvider {
    static var previews: some View {
        PointView()
    }
}

