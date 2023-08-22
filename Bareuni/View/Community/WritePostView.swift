//
//  WritePostView.swift
//  Bareuni
//
//  Created by 김유빈 on 2023/08/10.
//

import SwiftUI

struct WritePostView: View {
    @State private var postContent = ""
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var postviewModel: PostViewModel
    
    
    var body: some View {
        VStack() {
            HStack{
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(Color("TextBlack"))
                }.padding(.leading, 24)
                Spacer()
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
                }.padding(.trailing, 24)
            }.frame(height: 30)
            
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
//        .toolbar {
//            ToolbarItem(placement: .navigationBarLeading) {
//                Button(action: {
//                    presentationMode.wrappedValue.dismiss()
//                }) {
//                    Image(systemName: "xmark")
//                        .foregroundColor(Color("TextBlack"))
//                }
//            }
//            ToolbarItem(placement: .navigationBarTrailing) {
//                Button(action: {
//                    savePost()
//                }) {
//                    Text("게시")
//                        .font(.custom("Pretendard-Medium", size: 16))
//                        .padding(.horizontal, 20)
//                        .padding(.vertical, 8)
//                        .background(Color.white)
//                        .foregroundColor(postContent.isEmpty ? Color("61gray") : Color("BackgroundBlue"))
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 8)
//                                .stroke(postContent.isEmpty ? Color("61gray") : Color("BackgroundBlue"), lineWidth: 1)
//                                .opacity(0.6)
//                        )
//                        .disabled(postContent.isEmpty)
//                }
//            }
//        }
    }
    
    func savePost() {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd HH:mm"
        let currentTimeString = formatter.string(from: currentDate)
        let newPost = Post(content: postContent, modificationTime: currentTimeString, likeCount: 0, comments: 0, isLiked: false)
        postviewModel.posts.append(newPost)
        
        presentationMode.wrappedValue.dismiss()
    }
}
