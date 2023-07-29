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
    let likeCount: Int
    let comments: Int
}

struct CommunityMainView: View {
    @State private var selectedPost: Post?
    @State private var posts: [Post] = [
        Post(content: "저는 치아교정한지 2년 3개월 된 사람입니다. 다름이 아니라 현재 이런 고민이 있습니다..", modificationTime: "12시간 전 (수정됨)", likeCount: 10, comments: 21),
        Post(content: "교정을 마친 지 3년째인데 혹시 저랑 같은 문제가 생기신 분 계시나요?", modificationTime: "2일 전 (수정됨)", likeCount: 5, comments: 2),
        Post(content: "좋은 치과 선생님 좀 소개해 주세요! 저희 아이가 12살인데 지금 교정을 하는 것이 맞을까요?", modificationTime: "2시간 전", likeCount: 20, comments: 10),
        Post(content: "교정 유지 장치가 갑자기 떨어져 버렸어요. 이거 어떻게 하는 게 좋을까요?", modificationTime: "10분 전", likeCount: 15, comments: 7)
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    
                    NavigationLink(destination: TalkView(posts: $posts)) { // $ 표시로 Binding으로 전달
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
                    ForEach(posts.prefix(4).indices, id: \.self) { index in
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
        let post = posts[index]
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

struct PostCell: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 10) {
                Image("Tooth")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                Text("닉네임")
                    .font(.custom("Pretendard-SemiBold", size: 12))
            }
            
            Text(post.content) // 글 내용을 보여줄 부분 (3줄까지만 보이고 더보기 형식은 추가 구현 필요)
                .font(.custom("Pretendard-Medium", size: 12))
                .lineLimit(3)
                .padding(.top, 15)
                .padding(.bottom, 15)
            
            Divider()
            
            HStack(spacing: 0) {
                Image("Heart")
                Text("좋아요 \(post.likeCount)")
                    .font(.custom("Pretendard-Regular", size: 10))
                    .foregroundColor(Color("9Egray"))
                    .padding(.leading, 5)
                
                Image("Comment")
                    .padding(.leading, 15)
                Text("댓글 \(post.comments)")
                    .font(.custom("Pretendard-Regular", size: 10))
                    .foregroundColor(Color("9Egray"))
                    .padding(.leading, 5)
                
                Spacer()
                
                Text(post.modificationTime)
                    .font(.custom("Pretendard-Regular", size: 11))
                    .foregroundColor(Color("9Egray"))
            }
            .padding(.top, 15)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 16)
        .background(Color.white)
    }
}


struct CommunityMainView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityMainView()
    }
}
