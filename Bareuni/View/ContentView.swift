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
    
    var cityDic: [String: [String]]
    
    
    
    init() {
        cityDic = [
            "서울": ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "중구", "종로구", "중랑구"],
            "경기": ["수원", "성남", "고양", "용인", "부천", "안산", "안양", "포천", "광명", "오산", "의정부", "시흥", "군포", "구리", "남양주", "광주", "하남", "김포", "의왕", "양주", "파주", "동두천", "연천", "가평", "여주", "이천", "안성", "평택", "화성", "용인"],
            "인천": ["중구", "동구", "남구", "연수구", "남동구", "부평구", "계양구", "서구", "강화군", "옹진군"],
            "부산": ["중구", "서구", "동구", "영도구", "부산진구", "동래구", "남구", "북구", "해운대구", "사하구", "금정구", "강서구", "연제구", "수영구", "사상구", "기장군"],
            "대구": ["중구", "동구", "서구", "남구", "북구", "수성구", "달서구", "달성군"],
            "대전": ["동구", "중구", "서구", "유성구", "대덕구"],
            "광주": ["동구", "서구", "남구", "북구", "광산구"],
            "울산": ["중구", "남구", "동구", "북구", "울주군"],
            "충남/세종": ["천안", "공주", "보령", "아산", "서산", "논산", "계룡", "당진", "금산", "부여", "서천", "청양", "홍성", "예산", "태안", "세종"],
            "충북": ["청주", "충주", "제천", "보은", "옥천", "영동", "진천", "괴산", "음성", "단양"],
            "전남": ["목포", "여수", "순천", "나주", "광양", "담양", "곡성", "구례", "고흥", "보성", "화순", "장흥", "강진", "해남", "영암", "무안", "함평", "영광", "장성", "완도", "진도", "신안"],
            "전북": ["전주", "익산", "군산", "정읍", "남원", "김제", "완주", "진안", "무주", "장수", "임실", "순창", "고창", "부안"],
            "경남": ["창원", "진주", "통영", "사천", "김해", "밀양", "거제", "양산", "의령", "함안", "창녕", "고성", "남해", "하동", "산청", "함양", "거창", "합천"],
            "경북": ["대구", "포항", "경주", "김천", "안동", "구미", "영주", "영천", "상주", "문경", "경산", "군위", "의성", "청송", "영양", "영덕", "청도", "고령", "성주", "칠곡", "예천", "봉화", "울진", "울릉"],
        ]
    }
    
    
    var cityList = ["서울", "경기", "인천", "부산", "대구", "대전", "광주", "울산", "충남/세종", "충북", "전남", "전북", "경남", "경북", ]
    
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
                
                
            }
        }
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
