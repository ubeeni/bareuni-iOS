//
//  CommunityMainView.swift
//  Bareuni
//
//  Created by 김유빈 on 2023/07/24.
//

import SwiftUI

struct CommunityMainView: View {
    @StateObject private var bestcommunityViewModel = BestCommunityViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Spacer()
                        
                        NavigationLink(destination: TalkView()) {
                            VStack {
                                Image("Talk")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                Text("자유수다")
                                    .foregroundColor(.black)
                                    .font(.custom("Pretendard-Medium", size: 14))
                            }
                        }
                        .frame(width: 111, height: 96)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("disabledBtnColor"), lineWidth: 2))
                        
                        Spacer()
                        
                        NavigationLink(destination: FAQView()) {
                            VStack {
                                Image("FAQ")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                Text("FAQ")
                                    .foregroundColor(.black)
                                    .font(.custom("Pretendard-Medium", size: 14))
                            }
                        }
                        .frame(width: 111, height: 96)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("disabledBtnColor"), lineWidth: 2))
                        
                        Spacer()
                    }
                    .padding(.top, 30)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Text("커뮤니티")
                                .font(.custom("Pretendard-Medium", size: 24))
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Image("icon_search")
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Image("icon_bell")
                        }
                    }
                    
                    Image("ad").padding(.top, 15)
                    
                    Image("Bar").padding(.top, 30)
                    
                    HStack {
                        Image("Popular")
                        VStack(alignment: .leading, spacing: 1) {
                            Text("실시간 인기글")
                                .font(.custom("Pretendard-Medium", size: 14))
                            Image("best")
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top, 15)
                    .padding(.bottom, 10)
                    
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
            .navigationBarTitle("", displayMode: .inline)
        }
        .accentColor(.gray)
        
    }
}

struct CommunityMainView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityMainView()
    }
}
