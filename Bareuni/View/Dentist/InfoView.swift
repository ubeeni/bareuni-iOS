//
//  InfoView.swift
//  Bareuni
//
//  Created by 황인성 on 2023/07/17.
//

import SwiftUI

struct InfoView: View {
    
    @State var tabIndex = 0
    @State var cities = LocationView().selectedCities
    @StateObject var dentistInfo = DentistViewModel()
    
    var body: some View {
        VStack{
            HStack{
                Text("치과 정보")
                    .font(
                        Font.custom("Pretendard", size: 24)
                            .weight(.medium)
                    )
                    .foregroundColor(.black)
                    .padding(.leading, 24)
                
                Spacer()
                
                NavigationLink(destination: SearchView(), label: {
                    Image("Search_light")
                        .frame(width: 32, height: 32)
                })
                
                NavigationLink(destination: EmptyView(), label: {
                    Image("Bell_light")
                        .frame(width: 32, height: 32)
                        .padding(.trailing, 24)
                })
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
                                        Font.custom("Pretendard", size: 15)
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
        }
        .navigationBarBackButtonHidden(true)
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
    }
    
    private func onButtonTapped(index: Int) {
        withAnimation { tabIndex = index }
    }
}

struct CustomTopTabBar2: View {
    @Binding var tabIndex: Int
    @Namespace var animation
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                
                TabBarButton2(text: "치과 소개", isSelected: .constant(tabIndex == 0))
                    .onTapGesture { onButtonTapped(index: 0) }
                
                
                
                TabBarButton2(text: "리뷰", isSelected: .constant(tabIndex == 1))
                    .onTapGesture { onButtonTapped(index: 1) }
                
                
            }
        }
    }
    
    private func onButtonTapped(index: Int) {
        withAnimation { tabIndex = index }
    }
}

struct CustomTopTabBar3: View {
    @Binding var tabIndex: Int
    @Namespace var animation
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                
                TabBarButton3(text: "치과 리뷰", isSelected: .constant(tabIndex == 0))
                    .onTapGesture { onButtonTapped(index: 0) }
                
                
                
                TabBarButton3(text: "치과명", isSelected: .constant(tabIndex == 1))
                    .onTapGesture { onButtonTapped(index: 1) }
                
                
            }
        }
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

struct TabBarButton2: View {
    let text: String
    @Binding var isSelected: Bool
    var body: some View {
        VStack {
            Text(text)
                .font(
                    Font.custom("Pretendard", size: 16)
                        .weight(.semibold)
                )
                .foregroundColor(isSelected ? .BackgroundBlue : .black)
            
            if isSelected == true {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: .infinity, height: 2)
                    .background(Color(red: 0, green: 0.58, blue: 1))
            }
            else {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: .infinity, height: 0.5)
                    .background(Color(red: 0.82, green: 0.82, blue: 0.82))
            }
            
        }
    }
}

struct TabBarButton3: View {
    let text: String
    @Binding var isSelected: Bool
    var body: some View {
        VStack {
            Text(text)
                .font(
                    Font.custom("Pretendard", size: 16)
                        .weight(.semibold)
                )
                .foregroundColor(isSelected ? .BackgroundBlue : .black)
            
            if isSelected == true {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: .infinity, height: 2)
                    .background(Color(red: 0, green: 0.58, blue: 1))
            }
            else {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: .infinity, height: 0.5)
                    .background(Color(red: 0.82, green: 0.82, blue: 0.82))
            }
            
        }
    }
}


struct recommendedDentistView:View {
    
    @State var dentist: Dentist
    
    var body: some View{
        NavigationLink(destination: {
            detailDentistView(dentist: $dentist)
        }, label: {
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 339, height: 203)
                    .background(.white)
                    .cornerRadius(14)
                    .shadow(color: .black.opacity(0.1), radius: 6, x: 2, y: 2)
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
                                Image("SampleImage" +  String(Int.random(in: 1...6)))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 108, height: 86)
                                    .clipped()
                            )
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 108, height: 86)
                            .background(
                                Image("SampleImage" +  String(Int.random(in: 1...6)))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 108, height: 86)
                                    .clipped()
                            )
                    }
                }
            }
            .frame(width: 339, height: 203)
        })
    }
}

struct nearDentistView:View {
    var body: some View{
        Text("내 주변 치과 화면")
    }
}

struct detailDentistView:View {
    
    @Binding var dentist: Dentist
    @State var tabIndex = 0
    @State var bookMark = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View{
        ScrollView {
            VStack{
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 41.6875, height: 17.25)
                        .background(dentist.reservation ? Color(red: 0.2, green: 0.47, blue: 1) : .red)
                        .cornerRadius(8)
                    
                    Text(dentist.reservation ? "예약가능" : "예약불가")
                        .font(
                            Font.custom("Biennale", size: 8)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 32, height: 12, alignment: .leading)
                }
                
                Text(dentist.name)
                    .font(
                        Font.custom("Pretendard", size: 24)
                            .weight(.semibold)
                    )
                    .foregroundColor(.black)
                    .frame(width: 350, height: 29, alignment: .leading)
                
                Text("오늘 휴진 (일요일 휴무)")
                    .font(
                        Font.custom("Pretendard", size: 16)
                            .weight(.medium)
                    )
                    .foregroundColor(.BackgroundBlue)
                    .frame(width: 350, height: 29, alignment: .leading)
                
                Text(dentist.address)
                    .font(
                        Font.custom("Pretendard", size: 14)
                            .weight(.medium)
                    )
                    .foregroundColor(Color(red: 0.56, green: 0.56, blue: 0.56))
                    .frame(width: 350, height: 18, alignment: .leading)
                
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 373, height: 265)
                    .background(
                        Image("Sample" + String(Int.random(in: 1...3)))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 373, height: 265)
                            .clipped()
                            .cornerRadius(20)
                    )
                //                Image("Sample" + String(Int.random(in: 1...3)))
                //                    .resizable()
                //                    .aspectRatio(contentMode: .fill)
                //                    .cornerRadius(20)
                //                    .frame(width: .infinity, height: 100)
                
                CustomTopTabBar2(tabIndex: $tabIndex)
                
                if tabIndex == 0 {
                    IntroduceView(dentist: $dentist)
                }
                else if tabIndex == 1 {
                    ReviewView()
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image("Expand_left")
            }), trailing: Button(action: {
                bookMark.toggle()
                //                dentist.Favorites.toggle()
            }, label: {
                Image(bookMark ? "Bookmark_duotone" : "Bookmark_light")
            }))
        }
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

struct IntroduceView: View {
    
    @Binding var dentist: Dentist
    
    var body: some View {
        //        ScrollView(showsIndicators: false){
        VStack{
            Text("진료시간")
                .font(
                    Font.custom("Pretendard", size: 20)
                        .weight(.semibold)
                )
                .foregroundColor(.black)
            
            ZStack {
                VStack {
                    Text("매일 09:00 - 20:00")
                        .font(
                            Font.custom("Pretendard", size: 14)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                    
                    Text("일요일 휴무")
                        .font(
                            Font.custom("Pretendard", size: 14)
                                .weight(.medium)
                        )
                        .foregroundColor(.BackgroundBlue)
                    
                    Text("점심시간 13:00 - 14:00")
                        .font(
                            Font.custom("Pretendard", size: 14)
                                .weight(.medium)
                        )
                        .foregroundColor(.black)
                }
            }
            .frame(width: 338, height: 112)
            .background(Color(red: 0.93, green: 0.97, blue: 1))
            .cornerRadius(10)
            
            Text("치과소개")
                .font(
                    Font.custom("Pretendard", size: 20)
                        .weight(.semibold)
                )
                .foregroundColor(.black)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("대한민국 1.7% 교정과 전문의")
                    .font(
                        Font.custom("Pretendard", size: 14)
                            .weight(.medium)
                    )
                    .foregroundColor(.black)
                
                Text("보건복지부 인증 치과교정과 전문 3인이 모든 진료 과정을 함께합니다.")
                    .font(
                        Font.custom("Pretendard", size: 14)
                            .weight(.medium)
                    )
                    .foregroundColor(.BackgroundBlue)
                    .frame(width: 298, alignment: .topLeading)
                
                Text("교정치료에 사용되는 브라켓, 와이어, 튜브, 밴드, 기구 등, 좋은 재료로 교정치료의 완성도를 높이겠습니다.")
                    .font(
                        Font.custom("Pretendard", size: 14)
                            .weight(.medium)
                    )
                    .foregroundColor(.black)
                    .frame(width: 298, alignment: .topLeading)
            }
            .padding(.leading, 22)
            .padding(.trailing, 18)
            .padding(.top, 18)
            .padding(.bottom, 15)
            .background(Color(red: 0.93, green: 0.97, blue: 1))
            .cornerRadius(10)
        }
        ZStack {
            Text("상담받기")
                .font(
                    Font.custom("Pretendard", size: 16)
                        .weight(.semibold)
                )
                .foregroundColor(.white)
        }
        .padding(16)
        .frame(width: 348, height: 51, alignment: .center)
        .background(Color(red: 0, green: 0.58, blue: 1))
        .cornerRadius(9)
        //        }
    }
}

class ModalState: ObservableObject {
    @Published var isPresentingModal = false
}

struct ReviewView: View {
    
    @State private var isPresentingModal = false
    @StateObject var reviewInfo = ReviewViewModel()
    //    @StateObject private var modalState = ModalState()
    @State private var showFullText = false
    
    @State var gender = "성별"
    @State var sort = "최신순"
    
    var body: some View{
        VStack{
            HStack{
                Image("star")
                Image("star")
                Image("star")
                Image("star")
                Image("star")
            }
            
            Text("4.9  |  리뷰 48개")
                .font(
                    Font.custom("Pretendard", size: 16)
                        .weight(.medium)
                )
                .foregroundColor(.black)
            
            HStack{
                Text("진료결과")
                    .font(
                        Font.custom("Pretendard", size: 12)
                            .weight(.medium)
                    )
                    .foregroundColor(Color(red: 0.59, green: 0.59, blue: 0.59))
                
                Text("만족해요")
                    .font(
                        Font.custom("Pretendard", size: 12)
                            .weight(.medium)
                    )
                    .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.09))
                
                Text("-----------------------")
                    .font(
                        Font.custom("Pretendard", size: 12)
                            .weight(.light)
                    )
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(Color(red: 0.85, green: 0.85, blue: 0.85))
                
                Text("99%")
                    .font(
                        Font.custom("Pretendard", size: 12)
                            .weight(.medium)
                    )
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.09))
            }
            HStack{
                Text("진료결과")
                    .font(
                        Font.custom("Pretendard", size: 12)
                            .weight(.medium)
                    )
                    .foregroundColor(Color(red: 0.59, green: 0.59, blue: 0.59))
                
                Text("만족해요")
                    .font(
                        Font.custom("Pretendard", size: 12)
                            .weight(.medium)
                    )
                    .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.09))
                
                Text("-----------------------")
                    .font(
                        Font.custom("Pretendard", size: 12)
                            .weight(.light)
                    )
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(Color(red: 0.85, green: 0.85, blue: 0.85))
                
                Text("99%")
                    .font(
                        Font.custom("Pretendard", size: 12)
                            .weight(.medium)
                    )
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.09))
            }
            HStack{
                Text("진료결과")
                    .font(
                        Font.custom("Pretendard", size: 12)
                            .weight(.medium)
                    )
                    .foregroundColor(Color(red: 0.59, green: 0.59, blue: 0.59))
                
                Text("만족해요")
                    .font(
                        Font.custom("Pretendard", size: 12)
                            .weight(.medium)
                    )
                    .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.09))
                
                Text("-----------------------")
                    .font(
                        Font.custom("Pretendard", size: 12)
                            .weight(.light)
                    )
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(Color(red: 0.85, green: 0.85, blue: 0.85))
                
                Text("99%")
                    .font(
                        Font.custom("Pretendard", size: 12)
                            .weight(.medium)
                    )
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.09))
            }
            //            NavigationLink(destination: WriteView(), label: {
            //                ZStack {
            //                    Text("리뷰쓰기")
            //                      .font(
            //                        Font.custom("Pretendard", size: 14)
            //                          .weight(.semibold)
            //                      )
            //                      .multilineTextAlignment(.center)
            //                      .foregroundColor(Color(red: 0, green: 0.58, blue: 1))
            //                }
            //                .padding(.horizontal, 149)
            //                .padding(.vertical, 13)
            //                .background(.white)
            //                .cornerRadius(8)
            //                .overlay(
            //                  RoundedRectangle(cornerRadius: 8)
            //                    .inset(by: 0.25)
            //                    .stroke(Color(red: 0, green: 0.58, blue: 1), lineWidth: 0.5)
            //                )
            //            })
            
            Button(action: {
                //                isPresentingModal = true
                isPresentingModal = true
            }, label: {
                ZStack {
                    Text("리뷰쓰기")
                        .font(
                            Font.custom("Pretendard", size: 14)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.BackgroundBlue)
                }
                .padding(.horizontal, 149)
                .padding(.vertical, 13)
                .background(.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .inset(by: 0.25)
                        .stroke(Color(red: 0, green: 0.58, blue: 1), lineWidth: 0.5)
                )
            })
            .fullScreenCover(isPresented: $isPresentingModal) {
                WriteView(isPresentingModal: $isPresentingModal)
            }
            //            .sheet(isPresented: $isPresentingModal) {
            //                WriteView()
            //            }
            
            
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 411, height: 3)
                .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                .blur(radius: 0.5)
            
            HStack {
                ZStack {
                    Text("영수증 인증")
                        .font(Font.custom("Pretendard", size: 12))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                        .frame(width: 61, alignment: .top)
                }
                .padding(.horizontal, 2)
                .padding(.vertical, 0)
                .frame(width: 69, height: 24, alignment: .center)
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .inset(by: 0.25)
                        .stroke(Color(red: 0.76, green: 0.76, blue: 0.76), lineWidth: 0.5)
                )
                ZStack {
                    Menu(gender) {
                        Button("남자") {
                            gender = "남자"
                        }
                        Button("여자") {
                            gender = "여자"
                        }
                    }
                }
                .padding(.horizontal, 2)
                .padding(.vertical, 0)
                .frame(width: 69, alignment: .center)
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .inset(by: 0.25)
                        .stroke(Color(red: 0.76, green: 0.76, blue: 0.76), lineWidth: 0.5)
                )
                ZStack {
                    Menu(sort) {
                        Button("최신순") {
                            sort = "최신순"
                        }
                        Button("평점순") {
                            sort = "평점순"
                        }
                    }
                }
                .padding(.horizontal, 2)
                .padding(.vertical, 0)
                .frame(width: 69, alignment: .center)
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .inset(by: 0.25)
                        .stroke(Color(red: 0.76, green: 0.76, blue: 0.76), lineWidth: 0.5)
                )
            }
            //            ScrollView{
            ForEach(reviewInfo.reviews){ review in
                VStack{
                    HStack{
                        ZStack{
                            Circle()
                                .stroke().frame(width: 40, height: 40)
                                .foregroundColor(.gray)
                            Image("Tooth")
                        }
                        .padding(.leading, 20)
                        VStack{
                            Text(review.nickName)
                            if review.certification == true {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20).stroke(Color.BackgroundBlue).frame(width: 50, height: 17)
                                    Text("영수증 인증")
                                        .font(Font.custom("Pretendard", size: 8))
                                        .foregroundColor(.BackgroundBlue)
                                }
                            }
                        }
                        Spacer()
                        Image("star")
                        Text(String(review.star))
                            .padding(.trailing, 30)
                    }
                    VStack {
                        ExpandableTextView(review.detail, lineLimit: 3)
                            .padding(.horizontal, 20)
                    }
                    Image("Bar")
                }
            } //foreach
            //            }
        }//vstack
    }
}

struct SearchView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    
    let items = [
        "교정", "Item 2", "Item 3", "Item 4",
        "Item 5", "Item 6", "Item 7", "Item 8"
    ]
    
    @State private var searchText = ""
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 0, alignment: nil),
        GridItem(.flexible(), spacing: 0, alignment: nil),
        GridItem(.flexible(), spacing: 0, alignment: nil),
        GridItem(.flexible(), spacing: 0, alignment: nil)
    ]
    
    @State var tabIndex = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack(spacing: 7) {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image("Expand_left")
                                .frame(width: 31, height: 31)
                                .padding(.leading, -15)
                        })
                        
                        EmailSearchBar(text: $searchText)
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                    }
                    
                    
                    if !searchText.isEmpty {
                        CustomTopTabBar3(tabIndex: $tabIndex)
                        
                        if tabIndex == 0 {
                            Text("치과 리뷰")
                        }
                        else if tabIndex == 1 {
                            Text("치과명")
                        }
                        //                        List {
                        //                            ForEach(array.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self) {searchText in
                        //
                        //                                ZStack(alignment: .leading) {
                        //                                    Rectangle().foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96)).cornerRadius(8).frame(height: 55)
                        //
                        //                                    HStack {
                        //                                        Image(systemName: "person.circle.fill").resizable().frame(width: 37, height: 37)
                        //                                        Text(searchText)
                        //                                    }.listRowSeparator(.hidden)
                        //                                }.listRowSeparator(.hidden)
                        //                            }.listRowInsets(EdgeInsets(top: 0, leading: 12, bottom: 12, trailing: 12))
                        //                        } //리스트의 스타일 수정
                        //                        .listStyle(PlainListStyle())
                        //                        //화면 터치시 키보드 숨김
                        //                        .onTapGesture {
                        //                            hideKeyboard()
                        //                        }
                    }
                    else {
                        VStack(alignment: .leading) {
                            Rectangle().frame(height: 0)
                            Text("추천 키워드")
                                .font(
                                    Font.custom("Pretendard", size: 20)
                                        .weight(.medium)
                                )
                                .kerning(0.2)
                                .foregroundColor(.black)
                            
                            //                            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 4), spacing: 8) {
                            //                                ForEach(items, id: \.self) { item in
                            //                                    Button(action: {
                            //                                        searchText = item
                            //                                    }, label: {
                            //                                        Text(item)
                            //                                            .font(Font.custom("Pretendard", size: 16))
                            //                                            .kerning(0.2)
                            //                                            .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                            //                                            .padding(8) // Apply padding around each item
                            //                                            .overlay(
                            //                                                RoundedRectangle(cornerRadius: 24)
                            //                                                    .stroke(Color(red: 0.62, green: 0.62, blue: 0.62), lineWidth: 0.5)
                            //                                            )
                            //                                    })
                            //                                }
                            //                            }
                            LazyVGrid(columns: columns,
                                      alignment: .leading,
                                      spacing: 8,
                                      pinnedViews: []) {
                                ForEach(items, id: \.self) { item in
                                    Button(action: {
                                        searchText = item
                                    }, label: {
                                        Text(item)
                                            .font(Font.custom("Pretendard", size: 16))
                                            .kerning(0.2)
                                            .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                                            .padding(8) // Apply padding around each item
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 24)
                                                    .stroke(Color(red: 0.62, green: 0.62, blue: 0.62), lineWidth: 0.5)
                                            )
                                    })
                                }
                            }
                            
                        }
                        .padding(.leading, 24)
                    }
                    Spacer()
                    
                }
            }
            
        }.navigationBarBackButtonHidden(true)
    }
}

struct EmailSearchBar: View {
    
    @Binding var text: String
    
    var body: some View {
        HStack {
            VStack{
                HStack {
                    TextField("치과명 또는 키워드를 검색하세요.", text: $text)
                    //                        .underlineTextField()
                        .frame(width: 276, height: 46)
                        .background(RoundedRectangle(cornerRadius: 12)
                            .inset(by: 0.5)
                            .stroke(Color(red: 0.88, green: 0.88, blue: 0.88), lineWidth: 1)
                            .frame(width: 306, height: 46))
                }
            }
        }
        .padding(.horizontal)
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        InfoView()
        ReviewView()
        SearchView()
    }
}
