//
//  InfoView.swift
//  Bareuni
//
//  Created by 황인성 on 2023/07/17.
//

import SwiftUI

struct InfoView: View {
    
    @State var tabIndex = 0
    @State var cities = ContentView().selectedCities
    @State var dentistInfo = DentistViewModel()
    
    var body: some View {
        VStack{
            HStack{
                Text("치과 정보")
                  .font(
                    Font.custom("Pretendard", size: 24)
                      .weight(.medium)
                  )
                  .foregroundColor(.black)
                  .frame(width: 131, height: 29, alignment: .topLeading)
                  .padding(.leading, 24)
                
                Spacer()
                
                Image("Search_light")
                  .frame(width: 32, height: 32)
                Image("Bell_light")
                  .frame(width: 32, height: 32)
                  .padding(.trailing, 24)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    ForEach(cities, id: \.self){ city in
                        ZStack {
                            Rectangle()
                                .foregroundColor(Color(red: 0.85, green: 0.85, blue: 0.85))
                                .frame(width: 113, height: 24)
                                .cornerRadius(13)
                            
                            HStack {
                                Text(city)
                                    .font(
                                        Font.custom("Public Sans", size: 15)
                                            .weight(.medium)
                                    )
                                
                                Button(action: {
                                    cities.removeAll { $0 == city }
                                }, label: {
                                    Image("Mask")
                                })
                            }
                        }
                    }
                }

            }
            .frame(height: 30)
            
            
            CustomTopTabBar(tabIndex: $tabIndex).padding(.bottom, -5)
            
            if tabIndex == 0 {
                Spacer().frame(height: 0)
                ScrollView(showsIndicators: false) {
                    VStack {
                        ForEach(dentistInfo.Dentists){ dentist in
                            recommendedDentistView(dentist: dentist)
                            Spacer().frame(height: 23)
                        }
                    }
                }
            }
            else if tabIndex == 1 {
                nearDentistView()
            }
        }
    }
}

struct CustomTopTabBar: View {
    @Binding var tabIndex: Int
    @Namespace var animation
    var body: some View {
        HStack {
            Spacer().frame(width: 32)
            TabBarButton(text: "추천 치과", isSelected: .constant(tabIndex == 0))
                .onTapGesture { onButtonTapped(index: 0) }
            
            Spacer().frame(width: 13)
            
            TabBarButton(text: "내 주변 치과", isSelected: .constant(tabIndex == 1))
                .onTapGesture { onButtonTapped(index: 1) }
            
            Spacer()
        }
//        .padding(.bottom, -50)
    }
    
    private func onButtonTapped(index: Int) {
        withAnimation { tabIndex = index }
    }
}

struct TabBarButton: View {
    let text: String
    @Binding var isSelected: Bool
    var body: some View {
        VStack {
            Text(text)
                .font(
                Font.custom("Pretendard", size: 18)
                .weight(.semibold)
                )
                .thickUnderline(color: isSelected ? .blue : .white, thickness: 4, radius: 10)
                            .baselineOffset(30)
        }
    }
}


struct recommendedDentistView:View {
    
    let dentist: Dentist
    
    var body: some View{
        ZStack {
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 339, height: 203)
              .background(.white)
              .cornerRadius(14)
              .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 2)
              .overlay(
                RoundedRectangle(cornerRadius: 14)
                  .inset(by: 0.25)
                  .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 0.5)
          )
            
            VStack(alignment: .leading) {
                HStack {
                    Spacer().frame(width: 23)
                    Text(dentist.name)
                        .font(
                          Font.custom("Pretendard", size: 20)
                            .weight(.semibold)
                        )
                    .foregroundColor(.black)
                    
                    Spacer().frame(width: 8)
                    
                    Image("star")
                    
                    Text(String(dentist.star))
                      .font(
                        Font.custom("Pretendard", size: 12)
                          .weight(.medium)
                      )
                      .multilineTextAlignment(.center)
                      .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43))
                    
                    Spacer()
                    
                    Image("Mask2")
                    .frame(width: 27, height: 27)
                    .padding(.trailing, 12)
                }
                
                Text(dentist.info)
                  .font(
                    Font.custom("Pretendard", size: 12)
                      .weight(.medium)
                  )
                  .multilineTextAlignment(.center)
                  .foregroundColor(Color(red: 0.63, green: 0.63, blue: 0.63))
                  .padding(.leading, 23)
                
                HStack {
                    Spacer().frame(width: 23)
                    Image("Pin_alt_light")
                        .frame(width: 19, height: 19)
                    
                    Text(dentist.address)
                      .font(
                        Font.custom("Pretendard", size: 12)
                          .weight(.medium)
                      )
                      .multilineTextAlignment(.center)
                      .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43))
                }
                
                HStack {
                    Spacer().frame(width: 23)
                    
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 108, height: 86)
                      .padding(.trailing, 12)
                      .background(
                        Image("스크린샷 2023-06-10 오전 8.45 1")
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                          .frame(width: 108, height: 86)
                          .clipped()
                      )
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 108, height: 86)
                      .background(
                        Image("스크린샷 2023-06-10 오전 8.45 1")
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                          .frame(width: 108, height: 86)
                          .clipped()
                  )
                }
            }
        }
        .frame(width: 339, height: 203)
    }
}

struct nearDentistView:View {
    var body: some View{
        Text("내 주변 치과 화면")
    }
}

extension View {
    func thickUnderline(color: Color, thickness: CGFloat, radius: CGFloat) -> some View {
        self.overlay(
            Rectangle()
                .foregroundColor(color)
                .frame(height: thickness)
                .cornerRadius(radius)
                .padding(.bottom, -thickness)
        )
    }
}



struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
