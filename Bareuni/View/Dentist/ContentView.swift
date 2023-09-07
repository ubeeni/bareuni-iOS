//
//  SwiftUIView.swift
//  Bareuni
//
//  Created by 황인성 on 2023/07/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View{
        LocationView()
    }
}


struct LocationView: View {
    
    @State var tabIndex = "서울"
    @State var tabIndex2 = ""
    @State var isSelected = false
    @StateObject var recommendDentistViewModel = RecommendDentistViewModel()
    
    let cityDic = CityDictionary().cityDic
    let cityList = CityDictionary().cityList
    
    var body: some View {
        NavigationView {
            VStack{
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 0) {
                            ForEach(recommendDentistViewModel.selectedCities, id: \.self){ city in
                                HStack {
                                    Text(city)
                                        .font(Font.custom("Pretendard", size: 16))
                                        .kerning(0.2)
                                        .foregroundColor(.BackgroundBlue)
                                    
                                    Button(action: {
                                        recommendDentistViewModel.selectedCities.removeAll { $0 == city }
                                    }, label: {
                                        Image("Cancel")
                                    })
                                }
                                .padding(.leading, 16)
                                .padding(.vertical, 4)
                                .padding(.trailing, 8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 24)
                                        .stroke(Color.BackgroundBlue, lineWidth: 0.5)
                                )
                            }
                            .padding(.leading, 20)
                            .padding(.trailing, -10)
                        }
                    }
                    .frame(height: 30)
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: .infinity, height: 1)
                    .background(Color(red: 0.91, green: 0.93, blue: 0.94))
                
                Spacer(minLength: 0)
                
                HStack{
                    VStack{
                        List(cityList, id: \.self){ city in
                            LocationButton(text: city, isSelected: .constant(tabIndex == city))
                                .onTapGesture { onButtonTapped(index: city) }
                                .listRowSeparator(.hidden)
                                .listRowInsets(EdgeInsets())
                        }
                        .listStyle(.plain)
                        .frame(width: 95)
                    }
                    
                    Spacer().frame(width: 0)
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 1, height: .infinity)
                        .background(Color(red: 0.91, green: 0.93, blue: 0.94))
                    
                    VStack {
                        List(cityDic[tabIndex] ?? [], id: \.self) { detailCity in
                            DetailLocationButton(text: detailCity, detailText: tabIndex + "-" + detailCity, isSelected: bindingForSelection(tabIndex + "-" + detailCity))
                                .onTapGesture {
                                    onButtonTapped2(index: tabIndex + "-" + detailCity)
                                }
                                .listRowSeparator(.hidden)
                        }
                        .listStyle(.plain)
                    }
                }
                
                NavigationLink(destination: InfoView(recommendDentistViewModel: recommendDentistViewModel), label: {
                        ZStack {
                            Rectangle().frame(width: 345, height: 57)
                                .cornerRadius(8)
                                .foregroundColor(recommendDentistViewModel.selectedCities.count == 0 ? Color(red: 0.88, green: 0.88, blue: 0.88) : .BackgroundBlue)
                            
                            Text("내 지역 선택 완료")
                                .font(
                                    Font.custom("Pretendard", size: 16)
                                        .weight(.semibold)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, 10)
                }).disabled(recommendDentistViewModel.selectedCities.count == 0)
                    .simultaneousGesture(TapGesture().onEnded{//나중에 없앨 코드
                        print(recommendDentistViewModel.selectedCities)
                        recommendDentistViewModel.fetchRecommendedDentists()
//                        recommendDentistViewModel.isSuccess = true
//                        recommendDentistViewModel.fetchNearDentists()
                        })
            }
        }//navigationview
    }
    
    private func onButtonTapped(index: String) {
        withAnimation { tabIndex = index }
    }
    
    private func onButtonTapped2(index: String) {
        if recommendDentistViewModel.selectedCities.contains(index) {
            recommendDentistViewModel.selectedCities.removeAll { $0 == index }
        } else {
            recommendDentistViewModel.selectedCities.append(index)
        }
    }
    
    private func bindingForSelection(_ detailCity: String) -> Binding<Bool> {
        Binding<Bool>(
            get: {
                recommendDentistViewModel.selectedCities.contains(detailCity)
            },
            set: { isSelected in
                if isSelected {
                    recommendDentistViewModel.selectedCities.append(detailCity)
                } else {
                    recommendDentistViewModel.selectedCities.removeAll { $0 == detailCity }
                }
            }
        )
    }
}


struct LocationButton: View {
    
    let text: String
    @Binding var isSelected: Bool
    
    var body: some View {
        HStack {
            Rectangle()
                .foregroundColor(isSelected ? .BackgroundBlue : .white)
                .frame(width: 2, height: 25)
                .background(Color.BackgroundBlue)
            
            
            Text(text)
                .font(
                    Font.custom("Pretendard", size: 18)
                        .weight(.bold)
                )
                .foregroundColor(isSelected ? .BackgroundBlue : Color(red: 0.76, green: 0.82, blue: 0.85))
                .padding([.bottom, .leading], 5)
            
            Circle()
                .frame(width: 3, height: 3)
                .foregroundColor(isSelected ? .BackgroundBlue : .white)
                .padding(.bottom)
        }
    }
}


struct DetailLocationButton: View {
    
    let text: String
    let detailText: String
    @Binding var isSelected: Bool
    
    var body: some View {
        Button(action: {
            isSelected.toggle()
        }) {
            HStack {
                Image(isSelected ? "Selected" : "Default")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text(text)
                    .font(Font.custom("Pretendard", size: 18))
                    .foregroundColor(Color(red: 0.13, green: 0.17, blue: 0.21))
            }
        }
    }
}


extension Color {
    static let BackgroundBlue = Color ("BackgroundBlue")
    static let BackgroundWhite = Color ("BackgroundWhite")
    static let BAgray = Color ("BAgray")
    static let disabledBtnColor = Color("disabledBtnColor")
    static let F4gray = Color ("F4gray")
    static let SubBlue = Color ("SubBlue")
    static let TextBlack = Color ("TextBlack")
    static let TextEditor = Color ("TextEditor")
    static let coolGrey = Color("coolGrey")
    //    static let mainYellow = Color ("6Fgray")
    //    static let Grey = Color ("9Egray")
    //    static let darkGrey = Color ("61gray")
    //    static let coolGrey = Color("75gray")
    //    static let mainYellow = Color ("212B36")
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
        ContentView()
    }
}
