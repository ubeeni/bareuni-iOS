//
//  SwiftUIView.swift
//  Bareuni
//
//  Created by 황인성 on 2023/07/10.
//

import SwiftUI




struct ContentView: View {
    
    @State var tabIndex = "서울"
    @State var tabIndex2 = ""
    @State var isSelected = false
    @State var selectedCities: [String] = []
    
    let cityDic = CityDictionary().cityDic
    let cityList = CityDictionary().cityList
    
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    Button(action: {
                        selectedCities.removeAll()
                    }, label: {
                        HStack{
                            Image("reset")
                                .frame(width: 20, height: 20)
                                .rotationEffect(.degrees(-90))
                                .padding(.bottom, 10)
                                .padding(.leading)
                            
                            Text("초기화")
                                .font(
                                    Font.custom("Public Sans", size: 15)
                                        .weight(.medium)
                                )
                                .foregroundColor(Color(red: 0.76, green: 0.82, blue: 0.85))
                                .frame(width: 52, height: 28, alignment: .topLeading)
                        }
                    })
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 20) {
                            ForEach(selectedCities, id: \.self){ city in
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
                                            selectedCities.removeAll { $0 == city }
                                        }, label: {
                                            Image("Mask")
                                        })
                                    }
                                }
                            }
                        }

                    }
                    .frame(height: 30)
                    
                    Spacer()
                    
                }
                
                Spacer()
                
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
                

                Button(action: {
                    //아마 API연결
                }, label: {
                    NavigationLink(destination: InfoView(), label: {
                    ZStack {
                        
                        if selectedCities.count == 0 {
                            Rectangle().frame(width: 370, height: 57)
                                .cornerRadius(4)
                                .foregroundColor(Color(red: 0.85, green: 0.85, blue: 0.85))
                        }
                        else{
                            Rectangle().frame(width: 370, height: 57)
                                .cornerRadius(4)
                                .foregroundColor(Color(red: 0, green: 0.58, blue: 1))
                        }
//                        RoundedRectangle(4)
//                            .frame(width: 370, height: 57)
//                            .foregroundColor(selectedCities.count == 0 ?
//                                             Color("gray") : Color("blue"))
                        
                        Text("내 지역 선택 완료")
                            .font(
                                Font.custom("Public Sans", size: 24)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(.white)
                    }
                    })
                })
                .disabled(selectedCities.count == 0)
                
                
            }
        }//navigationview
    }
    private func onButtonTapped(index: String) {
        withAnimation { tabIndex = index }
    }
    
    private func onButtonTapped2(index: String) {
        if selectedCities.contains(index) {
            selectedCities.removeAll { $0 == index }
        } else {
            selectedCities.append(index)
        }
    }
    
    private func bindingForSelection(_ detailCity: String) -> Binding<Bool> {
        Binding<Bool>(
            get: {
                selectedCities.contains(detailCity)
            },
            set: { isSelected in
                if isSelected {
                    selectedCities.append(detailCity)
                } else {
                    selectedCities.removeAll { $0 == detailCity }
                }
            }
        )
    }
}

struct SelectedLocationButton: View {
    let text: String
    @Binding var isSelected: Bool
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
            
            HStack{
                Text("의정부/양주 ")
                    .font(
                        Font.custom("Public Sans", size: 15)
                            .weight(.medium)
                    )
                    .foregroundColor(Color(red: 0.13, green: 0.17, blue: 0.21))
                    .frame(width: 95, height: 28, alignment: .topLeading)
                
                Image("Mask")
            }
        }
        
        
        Text(text)
            .font(
                Font.custom("Public Sans", size: 18)
                    .weight(.bold)
            )
            .foregroundColor(isSelected ? Color(red: 0, green: 0.58, blue: 1) : Color(red: 0.76, green: 0.82, blue: 0.85))
            .padding(.bottom, 5)
            .padding(.leading, 5)
        
        Circle()
            .frame(width: 3, height: 3)
            .foregroundColor(isSelected ? Color(red: 0, green: 0.58, blue: 1) : .white)
            .padding(.bottom)
    }
}



struct LocationButton: View {
    let text: String
    @Binding var isSelected: Bool
    var body: some View {
        HStack {
            
            Rectangle()
                .foregroundColor(isSelected ? Color(red: 0, green: 0.58, blue: 1) : .white)
                .frame(width: 1, height: 20)
                .background(Color(red: 0, green: 0.58, blue: 1))
            
            
            Text(text)
                .font(
                    Font.custom("Public Sans", size: 18)
                        .weight(.bold)
                )
                .foregroundColor(isSelected ? Color(red: 0, green: 0.58, blue: 1) : Color(red: 0.76, green: 0.82, blue: 0.85))
                .padding(.bottom, 5)
                .padding(.leading, 5)
            
            Circle()
                .frame(width: 3, height: 3)
                .foregroundColor(isSelected ? Color(red: 0, green: 0.58, blue: 1) : .white)
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
                    .font(Font.custom("Public Sans", size: 18))
                    .foregroundColor(Color(red: 0.13, green: 0.17, blue: 0.21))
                    .padding(.bottom, 9)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //        LocationView()
        ContentView()
    }
}
