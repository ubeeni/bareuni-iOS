//
//  PostDetailView.swift
//  Bareuni
//
//  Created by 김유빈 on 2023/09/04.
//

import SwiftUI

struct PostDetailView: View {
    @State private var isLiked: Bool = false
    @State private var likeCount: Int = 0
    @State private var commentText: String = ""

    var post: CommunityResult

    @Environment(\.presentationMode) var presentationMode
    @State private var showMoreOptions = false

    @State private var showCommentOptions = false
    @State private var selectedComment: Comment?

    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter
    }

    func isCommentOwner(comment: Comment) -> Bool {
        // 댓글 작성자인지 여부를 확인하는 로직
        return comment.authorName == "바른이" // 예시로 닉네임이 "바른이"인 경우만 본인 댓글로 처리
    }

    func deleteComment(comment: Comment) {
        // 댓글 삭제 로직 추가
        // 데이터 모델에서 댓글을 삭제하는 방법이 있다고 가정합니다.
        // postviewModel.posts[index].comments.removeAll { $0.id == comment.id }
    }

    var body: some View {
        ScrollView {
            VStack {
                HStack(spacing: 10) {
                    Image("Tooth")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())

                    VStack(alignment: .leading, spacing: 5) {
                        Text(post.user.nickName)
                            .font(.custom("Pretendard-Medium", size: 12))
                        Text(formatDate(post.createdAt))
                            .font(.custom("Pretendard-Regular", size: 12))
                            .foregroundColor(Color("9Egray"))
                    }
                    .padding(.leading, 10)

                    Spacer()
                }
                .padding(.horizontal, 10)
                .padding(.top, 10)

                Text(post.content)
                    .font(.custom("Pretendard-Regular", size: 14))
                    .foregroundColor(Color("212B36"))
                    .padding(.all, 8)
                    .padding(.horizontal, 10)
                    .multilineTextAlignment(.leading)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)

                HStack {
                    Button(action: {
                        // 좋아요 상태를 토글하고 좋아요 수를 업데이트
                        // 데이터 모델에 맞게 좋아요 상태와 수를 업데이트하는 로직 추가 필요
                    }) {
                        Image(systemName: isLiked ? "heart.fill" : "heart")
                            .foregroundColor(isLiked ? Color.red : Color("9Egray"))
                    }
                    Text("좋아요 \(likeCount)")
                        .font(.custom("Pretendard-Medium", size: 10))
                        .foregroundColor(Color("9Egray"))

                    Image("Comment")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .padding(.leading, 4)
                    /*
                    Text("댓글 \(post.comments.count)")
                        .font(.custom("Pretendard-Medium", size: 10))
                        .foregroundColor(Color("9Egray"))
                    */
                    Spacer()
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
                .padding(.leading, 10)
                
                Image("Bar")
                
                /*
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(postviewModel.posts[index].comments) { comment in
                        VStack {
                            HStack {
                                Image(comment.profileImageName)
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                
                                Text(comment.authorName)
                                    .font(.custom("Pretendard-Medium", size: 12))
                                    .foregroundColor(Color("212B36"))
                                
                                Spacer()
                                
                                Button(action: {
                                    selectedComment = comment
                                    showCommentOptions.toggle()
                                }) {
                                    Image(systemName: "ellipsis")
                                        .font(.caption)
                                        .foregroundColor(Color("9Egray"))
                                }
                            }
                        }
                        
                        Text(comment.text)
                            .font(.custom("Pretendard-Regular", size: 14))
                            .foregroundColor(Color.black)
                            .padding(.leading, 8)
                        
                        HStack {
                            Text(self.dateFormatter.string(from: comment.date))
                                .font(.custom("Pretendard-Regular", size: 10))
                                .foregroundColor(Color("9Egray"))
                                .padding(.top, 5)
                                .padding(.leading, 8)
                            
                            Button(action: {
                                // 답글 달기 버튼 동작 추가
                            }) {
                                Text("답글 달기")
                                    .font(.custom("Pretendard-Regular", size: 10))
                                    .foregroundColor(Color.gray)
                            }
                            .padding(.horizontal, 5)
                            .padding(.top, 5)
                        }
                        Divider()
                    } // foreach
                    .padding(.horizontal, 10)
                }//vstack
                 */
            }
            .padding(.top, 10)
        }
        .navigationBarItems(
            trailing: HStack {
                Button(action: {
                    showMoreOptions.toggle()
                }) {
                    Image(systemName: "ellipsis")
                        .font(.title2)
                }
                .actionSheet(isPresented: $showMoreOptions) {
                    ActionSheet(
                        title: Text("본인 글 선택"),
                        buttons: [
                            .default(Text("글 수정하기"), action: {
                                // 글 수정하기 버튼 눌렀을 때 동작 추가
                            }),
                            .destructive(Text("삭제하기"), action: {
                                // 글 삭제하기 버튼 눌렀을 때 동작 추가
                            }),
                            .cancel(Text("취소"))
                        ]
                    )
                }
                
                Spacer()
            }
        )
        
        .overlay(
            HStack {
                TextField("댓글을 입력하세요.", text: $commentText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 44)
                    .padding(.leading, 10)
                
                Button(action: {
                    if !commentText.isEmpty {
                        // 새 댓글을 추가하는 로직 추가
                        // 데이터 모델에 새 댓글을 추가하는 방법이 있다고 가정
                    }
                }) {
                    Image("Send")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.trailing, 10)
                }
                .disabled(commentText.isEmpty)
                .padding(.trailing, 10)
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            , alignment: .bottom
        )
        .actionSheet(isPresented: $showCommentOptions) {
            if let selectedComment = selectedComment {
                return ActionSheet(
                    title: Text(isCommentOwner(comment: selectedComment) ? "내 댓글 옵션" : "다른 사람의 댓글 옵션"),
                    buttons: isCommentOwner(comment: selectedComment)
                    ? [
                        .destructive(Text("삭제하기"), action: { deleteComment(comment: selectedComment) }),
                        .cancel(Text("취소"))
                    ]
                    : [
                        .destructive(Text("신고하기"), action: {
                            // 댓글 신고하기 동작 추가
                        }),
                        .cancel(Text("취소"))
                    ]
                )
            } else {
                return ActionSheet(title: Text("댓글 옵션"), buttons: [])
            }
        }
    }
}
