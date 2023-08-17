//
//  HomeView.swift
//  Bareuni
//
//  Created by 김유빈 on 2023/08/17.
//

import SwiftUI

struct Dentists: Identifiable {
    var id = UUID()
    var name: String
    var address: String
    var photo: String
    var number: Int
    var rating: Double
}

struct BestCommunity: Identifiable {
    var id = UUID()
    var rating: String
    var contents: String
    var time: String
}

struct HomeView: View {
    var dentistList: [Dentists] = [
        Dentists(name: "옐로우 교정전문치과", address: "서울시 서초구 서초대로00길", photo: "Sample1", number: 1, rating: 5.0),
        Dentists(name: "그랑치과교정의원", address: "서울시 강남구 도산대로", photo: "Sample2", number: 2, rating: 4.9),
        Dentists(name: "화이트드림교정치과", address: "서울시 서초구 서초대로00길", photo: "Sample3", number: 3, rating: 4.9)
    ]
    
    var communityList: [BestCommunity] = [
        BestCommunity(rating: "1.", contents: "저는 치아교정한지 2년 3개월 된 사람입니다. 다름이 아니라 요즘 고민이 있는데요..", time: "12시간 전 (수정됨)"),
        BestCommunity(rating: "2.", contents: "교정을 마친 지 3년째인데 혹시 저랑 같은 문제가 생기신 분 계시나요?", time: "2일 전 (수정됨)"),
        BestCommunity(rating: "3.", contents: "좋은 치과 선생님 좀 소개해 주세요! 저희 아이가 12살인데 지금 교정을 하는 것이 맞을까요?", time: "2시간 전"),
        BestCommunity(rating: "4.", contents: "교정 유지 장치가 갑자기 떨어져 버렸어요.. 이거 어떻게 하는 게 좋을까요?", time: "10분 전")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 20) {
                            ForEach(1...3, id: \.self) { index in
                                Image("AD\(index)")
                                    .resizable()
                                    .scaledToFit() // 이미지 비율 유지하며 화면에 맞춤
                                    .frame(width: UIScreen.main.bounds.width - 40, height: 135)
                                    .cornerRadius(10)
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.vertical, 20)
                    
                    NavigationLink(destination: InfoView()) {
                        HStack {
                            Text("가장 후기가 좋은 교정치과")
                                .font(.custom("Pretendard-SemiBold", size: 18))
                                .foregroundColor(.black)
                                .padding(.leading, 20)
                            
                            Image("Expand_right")
                                .frame(width: 22, height: 22)
                            
                            Spacer()
                        }
                    }
                    .padding(.top, 20)
                    
                    VStack {
                        ForEach(dentistList) { dentist in
                            DentistCell(dentist: dentist)
                        }
                    }
                    .padding(.top, 10)
                    
                    Image("Bar")
                        .padding(.top, 20)
                    
                    NavigationLink(destination: CommunityMainView()) {
                        HStack {
                            Text("커뮤니티 실시간 인기글")
                                .font(.custom("Pretendard-SemiBold", size: 18))
                                .foregroundColor(.black)
                                .padding(.leading, 20)
                            
                            Image("Fire")
                                .frame(width: 27, height: 27)
                            Image("Expand_right")
                                .frame(width: 22, height: 22)
                            
                            Spacer()
                        }
                    }
                    .padding(.top, 10)
                    
                    ZStack {
                        Rectangle()
                          .foregroundColor(.clear)
                          .frame(width: 355, height: 216)
                          .background(.white)
                          .cornerRadius(6)
                          .shadow(color: .black.opacity(0.1), radius: 9, x: 0, y: 4)
                        
                        VStack {
                            ForEach(communityList) { community in
                                CommunityCell(community: community)
                            }
                        }
                        .padding(.bottom, 8)
                    }
            
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("홈")
                        .font(.custom("Pretendard-Medium", size: 24))
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image("icon_bell")
                }
            }
        }
    }
}


struct DentistCell: View {
    let dentist: Dentists
    
    var body: some View {
        VStack {
            HStack {
                ZStack(alignment: .topLeading) {
                    Image(dentist.photo)
                        .resizable()
                        .frame(width: 87, height: 86)
                        .cornerRadius(10)
                    Image("gray")
                    Text("\(dentist.number)")
                        .font(.custom("Pretendard-Bold", size: 12))
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                }
                .padding(.leading, 20)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(dentist.name)
                        .font(.custom("Pretendard-SemiBold", size: 18))
                        .foregroundColor(.black)
                        .padding(.bottom, 5)
                    
                    HStack {
                        Image("Star")
                            .frame(width: 20, height: 20)
                        Text(String(format: "%.1f", dentist.rating))
                            .font(.custom("Pretendard-SemiBold", size: 12))
                            .foregroundColor(Color("6Fgray"))
                    }
                    .padding(.bottom, 10)
                    
                    Text(dentist.address)
                        .font(.custom("Pretendard-Medium", size: 12))
                        .foregroundColor(Color("6Fgray"))
                    
                }
                .padding(.leading, 10)
                Spacer()
            }
            
        }
    }
}

struct CommunityCell: View {
    let community: BestCommunity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(community.rating)
                    .font(.custom("Pretendard-Medium", size: 13))
                    .foregroundColor(Color("BackgroundBlue"))
                Text(community.contents).lineLimit(1)
                    .font(.custom("Pretendard-Medium", size: 13))
                    .foregroundColor(Color("212B36"))
                    .frame(width: 310)
            }
            
            Text(community.time)
                .font(.custom("Pretendard-Medium", size: 10))
                .foregroundColor(Color("212B36").opacity(0.7))
                .padding(.leading, 25)
                .padding(.top, 5)
        }
        .padding(.top, 10)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
