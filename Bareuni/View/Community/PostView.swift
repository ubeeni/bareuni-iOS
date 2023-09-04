//
//  PostView.swift
//  Bareuni
//
//  Created by 김유빈 on 2023/07/30.
//

import SwiftUI

struct PostCell: View {
    var post: CommunityResult

    var body: some View {
        NavigationLink(destination: PostDetailView(post: post)) {
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 10) {
                    Image("Tooth")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text(post.user.nickName)
                        .font(.custom("Pretendard-SemiBold", size: 12))
                        .foregroundColor(Color("212B36"))
                }
                
                Text(post.content.replacingOccurrences(of: "\n\n", with: " "))
                    .font(.custom("Pretendard-Medium", size: 12))
                    .foregroundColor(Color("TextBlack"))
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .padding(.top, 15)
                    .padding(.bottom, 15)
                
                Divider()
                
                HStack(spacing: 0) {
                    Image("Heart")
                    Text("좋아요 \(post.like)")
                        .font(.custom("Pretendard-Regular", size: 10))
                        .foregroundColor(Color("9Egray"))
                        .padding(.leading, 5)
                    
                    Image("Comment")
                        .padding(.leading, 15)
                    
                    Text("댓글")
                        .font(.custom("Pretendard-Regular", size: 10))
                        .foregroundColor(Color("9Egray"))
                        .padding(.leading, 5)
                    /*
                     Text("댓글 \(post.comments.count)")
                     .font(.custom("Pretendard-Regular", size: 10))
                     .foregroundColor(Color("9Egray"))
                     .padding(.leading, 5)
                     */
                    Spacer()
                    
                    Text(formatDate(post.createdAt))
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
}

func formatDate(_ dateString: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    
    if let date = dateFormatter.date(from: dateString) {
        dateFormatter.dateFormat = "yyyy.MM.dd"
        return dateFormatter.string(from: date)
    } else {
        return "Invalid Date"
    }
}
