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
                .cornerRadius(10)
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

struct FAQView: View {
    var body: some View {
        VStack(spacing: 8) {
            Text("FAQ")
                .font(.custom("Pretendard-Medium", size: 32))
            Text("자주 물어보는 질문 TOP 10")
                .font(.custom("Pretendard-Regular", size: 16))
            ScrollView {
                VStack(spacing: 0) {
                    DetailView(title: "나이가 들면 교정이 불가능한가요?", content: "그렇지 않습니다.\n어린 아이의 경우 치아가 조금 더 빨리 움직이는 경향이 있기는 하지만, 나이가 들었다고 해서 교정이 불가능하지 않습니다. 불규칙한 치열 때문에 잇몸 관리를 하기가 어려운 경우 오히려 교정을 통해 잇몸 관리를 편하게 할 수 있는 환경을 만들어 줄 수 있습니다.")
                    
                    DetailView(title: "어떤 경우에 교정치과에 가야하나요?", content: "답변중 ...")
                    
                    DetailView(title: "교정치료의 시기는 언제가 좋을까요?", content: "답변중 ...")
                    
                    DetailView(title: "교정치료를 받지 않으면 얼마나 나빠질까요?", content: "답변중 ...")
                    
                    DetailView(title: "처음 교정치과에 내원시 무엇을 하나요?", content: "답변중 ...")
                    
                    DetailView(title: "교정 치료시 치료기간은 얼마나 걸릴까요?", content: "답변중 ...")
                    
                    DetailView(title: "교정을 하면 많이 아픈가요?", content: "답변중 ...")
                    
                    DetailView(title: "교정 후 관리가 필요한가요?", content: "답변중 ...")
                }
            }
            .padding(.top, 20)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("자주 물어보는 질문")
                    .font(.custom("Pretendard-Medium", size: 20))
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Image("icon_search")
            }
        }
        .padding(.top, 20)
        Spacer()
    }
}

struct DetailView: View {
    @State private var isExpanded = false
    var title: String
    var content: String
    
    var body: some View {
        VStack(spacing: 0) {
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    Text(title)
                        .font(.custom("Pretendard-Regular", size: 15))
                        .foregroundColor(.blue)
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(isExpanded ? .blue : .gray)
                }
                .padding(.top, 20)
                .padding(.bottom, 20)
                .padding(.horizontal, 25)
                .frame(maxWidth: .infinity)
                .background(isExpanded ? Color("SubBlue") : Color.white)
            }
            
            if isExpanded {
                Divider()
                ScrollView {
                    Text(content)
                        .font(.custom("Pretendard-Regular", size: 14))
                        .padding(.top, 20)
                        .padding(.bottom, 20)
                        .padding(.horizontal, 25)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color("SubBlue"))
                }
            }
        }
    }
}

struct CommunityMainView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityMainView()
    }
}
