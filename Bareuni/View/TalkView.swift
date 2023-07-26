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
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button(action: {
                    withAnimation {
                        showSortingOptions.toggle() // 정렬 옵션 보이기/숨기기 토글
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
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                            .opacity(0.6)
                    )
                }
                
                Spacer()
            }
            .padding(.leading, 250)
            .padding(.trailing, 0)
            
            if showSortingOptions {
                VStack {
                    sortingOptionButton(label: "최신순")
                    Divider() // 구분선
                    sortingOptionButton(label: "인기순")
                }
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.gray.opacity(0.5), radius: 2, x: 0, y: 1)
                .padding(.top, 10)
                .padding(.leading, 170)
                .padding(.horizontal, 10)
            }
            Spacer()
            NavigationLink(destination: WritePostView()) {
                Spacer()
                Image("WriteBtn") // WriteBtn 이미지를 가진 버튼
                    .padding(.horizontal, 30)
            }
            .navigationBarTitle("자유수다", displayMode: .inline)
        }
        .padding(.top, 10)
        Spacer()
    }
    
    func sortingOptionButton(label: String) -> some View {
        Button(action: {
            selectedOption = label // 버튼을 눌렀을 때 선택된 옵션으로 업데이트
            withAnimation {
                showSortingOptions.toggle() // 옵션 숨기기
            }
            // 선택된 정렬 옵션에 따른 정렬 로직 추가
        }) {
            Text(label)
                .font(.custom("Pretendard-Regular", size: 16))
                .padding(.horizontal, 10) // 버튼 가로 크기 조정
                .padding(.vertical, 9) // 버튼 세로 크기 조정
                .foregroundColor(Color("TextBlack"))
                .background(Color.white)
        }
    }
}

struct WritePostView: View {
    @State private var postContent = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack() {
            Text("글 작성")
                .font(.custom("Pretendard-Medium", size: 20))
                .frame(maxWidth: .infinity, alignment: .leading) // 가로 폭을 전체 너비로 지정
                .padding(.horizontal, 20) // 왼쪽 여백 추가
                .padding(.top, 20)
            
            ZStack(alignment: .topLeading) {
                TextEditor(text: $postContent)
                    .padding(.horizontal, 10)
                    .cornerRadius(10)
                
                RoundedRectangle(cornerRadius: 10)
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
                    // 게시 버튼이 눌렸을 때 할 동작 추가
                }) {
                    Text("게시")
                        .font(.custom("Pretendard-Medium", size: 16))
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(Color.white)
                        .foregroundColor(postContent.isEmpty ? Color("61gray") : Color("BackgroundBlue"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(postContent.isEmpty ? Color("61gray") : Color("BackgroundBlue"), lineWidth: 1)
                                .opacity(0.6)
                        )
                        .disabled(postContent.isEmpty)
                }
            }
        }
    }
}
