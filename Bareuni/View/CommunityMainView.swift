//
//  CommunityMainView.swift
//  Bareuni
//
//  Created by 김유빈 on 2023/07/24.
//

import SwiftUI

struct Post: Identifiable {
    let id = UUID()
    let content: String
    let modificationTime: String
}

struct CommunityMainView: View {
    
    let dummyPosts: [Post] = [
        Post(content: "저는 치아교정한지 2년 3개월 된 사람입니다. 다름이 아니라 현재 이런 고민이 있는데요.", modificationTime: "12시간 전 (수정됨)"),
        Post(content: "교정을 마친 지 3년째인데 혹시 저랑 같은 문제가 생기신 분 계시나요?", modificationTime: "2일 전 (수정됨)"),
        Post(content: "좋은 치과 선생님 좀 소개해 주세요! 저희 아이가 12살인데 지금 교정을 하는 것이 맞을까요?", modificationTime: "2시간 전"),
        Post(content: "교정 유지 장치가 갑자기 떨어져 버렸어요. 이거 어떻게 하는 게 좋을까요?", modificationTime: "10분 전")
    ]
    
    @State private var selectedPost: Post?
    
    var body: some View {
        NavigationView {
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
                .padding(.top, 20)
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
                
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(dummyPosts.prefix(4).indices, id: \.self) { index in
                        postView(index: index)
                            .padding(.top, 15)
                            .padding(.bottom, 15)
                    }
                }
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(6)
                .padding(.horizontal)
                .shadow(color: Color.gray.opacity(0.5), radius: 3, x: 0, y: 1)
                .padding(.top, 15)
                Spacer()
            }
            .navigationBarTitle("", displayMode: .inline)
        }
        .accentColor(.gray)
        
    }
    
    func postView(index: Int) -> some View {
        let post = dummyPosts[index]
        return VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text("\(index + 1). ")
                    .font(.custom("Pretendard-Medium", size: 13))
                    .foregroundColor(Color("BackgroundBlue"))
                
                Text("\(post.content)")
                    .font(.custom("Pretendard-Medium", size: 13))
                    .foregroundColor(Color("TextBlack"))
                    .lineLimit(1)
            }
            
            Text("\(post.modificationTime)")
                .font(.custom("Pretendard-Regular", size: 10))
                .foregroundColor(.gray)
                .padding(.leading, 21)
        }
    }
}

struct CommunityMainView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityMainView()
    }
}
