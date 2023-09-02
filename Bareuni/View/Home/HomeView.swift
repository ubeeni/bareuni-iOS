//
//  HomeView.swift
//  Bareuni
//
//  Created by 김유빈 on 2023/08/17.
//

import SwiftUI
import Alamofire

struct HomeView: View {
    
    //@StateObject var dentistInfo = DentistViewModel()
    @StateObject private var bestdentistViewModel = BestDentistViewModel()
    @StateObject private var bestcommunityViewModel = BestCommunityViewModel()
    
    @State var showCommunityMainView: Bool = false
    @State var showDentistMainView: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    TabView {
                        ForEach(1...3, id: \.self) { index in
                            Image("AD\(index)")
                                .resizable()
                        }
                    }
                    .cornerRadius(10)
                    .frame(width: 342, height: 131)
                    .tabViewStyle(.page)
                    .padding(.vertical, 20)
                    
                    
                    Button(action: {
                        showDentistMainView.toggle()
                    }, label: {
                        HStack {
                            Text("가장 후기가 좋은 교정치과")
                                .font(.custom("Pretendard-SemiBold", size: 18))
                                .foregroundColor(.black)
                                .padding(.leading, 20)
                            
                            Image("Expand_right")
                                .frame(width: 22, height: 22)
                            
                            Spacer()
                        }
                    })
                    /*
                     }).fullScreenCover(isPresented: $showDentistMainView) {
                     ScrollView(showsIndicators: false) {
                     VStack {
                     ForEach(dentistInfo){ dentist in
                     recommendedDentistView(dentist: dentist)
                     Spacer().frame(height: 23)
                     }
                     }
                     }
                     .gesture(DragGesture(minimumDistance: 50, coordinateSpace: .local)
                     .onEnded { value in
                     if value.translation.height > 0 {
                     withAnimation {
                     showCommunityMainView.toggle()
                     }
                     }
                     }
                     )
                     }
                     */
                    
                    VStack {
                        ForEach(bestdentistViewModel.bestDentists.indices, id: \.self) { index in
                            DentistCell(dentist: bestdentistViewModel.bestDentists[index], rank: index + 1)
                        }
                    }
                    .padding(.top, 10)
                    
                    Image("Bar")
                        .padding(.top, 20)
                    
                    Button(action: {
                        showCommunityMainView.toggle()
                    }, label: {
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
                        .padding(.top, 10)
                    })
                    /*
                     }).fullScreenCover(isPresented: $showCommunityMainView) {
                     CommunityMainView()
                     .gesture(DragGesture(minimumDistance: 50, coordinateSpace: .local)
                     .onEnded { value in
                     if value.translation.height > 0 {
                     withAnimation {
                     showCommunityMainView.toggle()
                     }
                     }
                     }
                     )
                     }
                     .padding(.top, 10)
                     */
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 355, height: 216)
                            .background(.white)
                            .cornerRadius(6)
                            .shadow(color: .black.opacity(0.1), radius: 9, x: 0, y: 4)
                        
                        VStack {
                            ForEach(bestcommunityViewModel.bestCommunity.indices, id: \.self) { index in
                                CommunityCell(community: bestcommunityViewModel.bestCommunity[index], rank: index + 1)
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
    let dentist: BestDentistResult
    let rank: Int
    
    var body: some View {
        VStack {
            HStack {
                ZStack(alignment: .topLeading) {
                    Image(dentist.image)
                        .resizable()
                        .frame(width: 87, height: 86)
                        .cornerRadius(10)
                    Image("gray")
                    
                    Text("\(rank)")
                        .font(.custom("Pretendard-Bold", size: 12))
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                }
                .padding(.leading, 20)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(dentist.hosName)
                        .font(.custom("Pretendard-SemiBold", size: 18))
                        .foregroundColor(.black)
                        .padding(.bottom, 5)
                    
                    HStack {
                        Image("Star")
                            .frame(width: 20, height: 20)
                        Text(String(format: "%.1f", dentist.score))
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
    let community: BestCommunityResult
    let rank: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text("\(rank).")
                    .font(.custom("Pretendard-Medium", size: 13))
                    .foregroundColor(Color("BackgroundBlue"))
                Text(community.content).lineLimit(1)
                    .font(.custom("Pretendard-Medium", size: 13))
                    .foregroundColor(Color("212B36"))
                    .frame(width: 310, alignment: .leading)
            }
            
            Text(relativeTime(from: community.createdAt))
                .font(.custom("Pretendard-Medium", size: 10))
                .foregroundColor(Color("212B36").opacity(0.7))
                .padding(.leading, 17)
                .padding(.top, 5)
        }
        .padding(.top, 10)
    }
}

func relativeTime(from dateString: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    
    if let date = dateFormatter.date(from: dateString) {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date, to: Date())
        
        if let year = components.year, year > 0 {
            return "\(year)년 전"
        } else if let month = components.month, month > 0 {
            return "\(month)개월 전"
        } else if let day = components.day, day > 6 {
            // 일주일 이상이면 주를 기준으로 표시
            let weeks = day / 7
            return "\(weeks)주 전"
        } else if let day = components.day, day > 0 {
            return "\(day)일 전"
        } else if let hour = components.hour, hour > 0 {
            return "\(hour)시간 전"
        } else if let minute = components.minute, minute > 0 {
            return "\(minute)분 전"
        } else {
            return "방금 전"
        }
    }
    return ""
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
