//
//  PointView.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/12.
//

import SwiftUI

struct PointView: View {
    @State var pointAmount: Int = 6000
    @State var pointList: [pointModel] = [pointModel(date: "05.13", title: "신규 가입 포인트", expiredDate: "2023.08.11", amount: 5000), pointModel(date: "05.13", title: "첫 후기 작성 포인트", expiredDate: "2023.08.11", amount: 1000)]
    var body: some View {
        VStack(alignment: .leading){
            Divider()
            HStack{
                Text("내 포인트").font(.pretendard(.medium, size: 20))
                
                Spacer()
                
                Text(pointString + pString).font(.pretendard(.regular, size: 24))
               
            }.padding(.leading, 33).padding(.trailing, 28).padding(.top, 60)
            
            Image("Bar").padding(.top, 53)
            
            Text("포인트 내역").font(.pretendard(.medium, size: 16)).padding(.leading, 33).padding(.top, 40).padding(.bottom, 40)
            
            if(pointList.count == 0){
                BlankView(text: "아직 받은 포인트가 없어요.").frame(maxWidth: .infinity)
            }else{
                VStack {
                    ForEach(self.pointList, id: \.id) { point in
                        PointHistoryCell(point: point)
                    }
                    Spacer()
                }
            }
            Spacer()
            

        }.navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("포인트")
                        .font(.custom("Pretendard-Medium", size: 20))
                }
                
            }
    }
}
struct pointModel{
    var id = UUID()
    let date: String
    let title: String
    let expiredDate: String
    let amount: Int
}
struct PointHistoryCell: View {
    let point: pointModel
    var body: some View {
        HStack(alignment: .center){
            Text(point.date)
              .font(
                Font.custom("Pretendard", size: 10)
                  .weight(.medium)
              )
              .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62)).padding(.trailing, 20)
            
            VStack{
                Text(point.title)
                  .font(
                    Font.custom("Pretendard", size: 16)
                      .weight(.medium)
                  )
                  .foregroundColor(.black).padding(.bottom, 4)
                
                Text("\(point.expiredDate)까지 사용 가능")
                  .font(
                    Font.custom("Pretendard", size: 10)
                      .weight(.medium)
                  )
                  .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
            }
            Spacer()
            
            Text("+ \(numberCommaFormatter(number: point.amount))p")
              .font(
                Font.custom("Pretendard", size: 16)
                  .weight(.medium)
              )
              .foregroundColor(Color("BackgroundBlue"))
        }.padding(.leading, 30).padding(.trailing, 30).padding(.bottom, 25)
    }
    func numberCommaFormatter(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(from: NSNumber(value: number))!
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

