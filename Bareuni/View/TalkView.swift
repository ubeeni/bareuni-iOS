//
//  TalkView.swift
//  Bareuni
//
//  Created by 김유빈 on 2023/07/26.
//

import SwiftUI

struct TalkView: View {
    @State private var showSortingOptions = false
    @State private var selectedOption = "최신순" // 기본값
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var posts: [Post]
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button(action: {
                    withAnimation {
                        showSortingOptions.toggle()
                    }
                }) {
                    HStack {
                        Text(selectedOption)
                            .font(.custom("Pretendard-Regular", size: 14))
                            .foregroundColor(Color("61gray"))
                        
                        Image(systemName: showSortingOptions ? "chevron.up" : "chevron.down")
                            .foregroundColor(.black)
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 8)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.gray, lineWidth: 1)
                            .opacity(0.6)
                    )
                }
                
                Spacer()
            }
            .padding(.leading, 250)
            .padding(.trailing, 0)
            
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                ScrollView {
                    LazyVStack {
                        ForEach(posts, id: \.id) { post in
                            NavigationLink(destination: PostDetailView(post: post)) {
                                VStack {
                                    PostCell(post: post)
                                    Image("Line")
                                }
                            }
                        }
                    }
                }
                
                if showSortingOptions {
                    VStack(spacing: 0) {
                        sortingOptionButton(label: "최신순")
                            .padding(.bottom, 2)
                        Divider()
                        sortingOptionButton(label: "인기순")
                            .padding(.top, 2)
                    }
                    .frame(width: 186, height: 88)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.gray.opacity(0.5), radius: 2, x: 0, y: 1)
                    .padding(.top, 10)
                    .padding(.horizontal, 10)
                }
                
                VStack {
                    Spacer()
                    NavigationLink(destination: WritePostView(posts: $posts)) {
                        Image("WriteBtn")
                            .padding(.horizontal, 20)
                            .padding(.bottom, 10)
                    }
                }
            }
            .navigationBarTitle("자유수다", displayMode: .inline)
        }
    }
    
    func sortingOptionButton(label: String) -> some View {
        Button(action: {
            selectedOption = label // 버튼을 눌렀을 때 선택된 옵션으로 업데이트
            withAnimation {
                showSortingOptions.toggle()
            }
        }) {
            Text(label)
                .font(.custom("Pretendard-Regular", size: 16))
                .padding(.horizontal, 10)
                .padding(.vertical, 9)
                .foregroundColor(Color("TextBlack"))
                .background(Color.white)
        }
    }
}

struct WritePostView: View {
    @State private var postContent = ""
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var posts: [Post]
    
    var body: some View {
        VStack() {
            Text("글 작성")
                .font(.custom("Pretendard-Medium", size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.top, 20)
            
            ZStack(alignment: .topLeading) {
                TextEditor(text: $postContent)
                    .padding(.horizontal, 10)
                    .cornerRadius(16)
                
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color("TextEditor"), lineWidth: 1)
                    .padding(0.6)
            }
            .padding(.horizontal, 20)
            .padding(.top, 15)
            .padding(.bottom, 200)
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(Color("TextBlack"))
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    savePost()
                }) {
                    Text("게시")
                        .font(.custom("Pretendard-Medium", size: 16))
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(Color.white)
                        .foregroundColor(postContent.isEmpty ? Color("61gray") : Color("BackgroundBlue"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(postContent.isEmpty ? Color("61gray") : Color("BackgroundBlue"), lineWidth: 1)
                                .opacity(0.6)
                        )
                        .disabled(postContent.isEmpty)
                }
            }
        }
    }
    
    func savePost() {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd HH:mm"
        let currentTimeString = formatter.string(from: currentDate)
        let newPost = Post(content: postContent, modificationTime: currentTimeString, likeCount: 0, comments: 0, isLiked: false)
        posts.append(newPost)
        
        presentationMode.wrappedValue.dismiss()
    }
}
