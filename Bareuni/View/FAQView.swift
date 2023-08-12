//
//  FAQView.swift
//  Bareuni
//
//  Created by 김유빈 on 2023/07/26.
//

import SwiftUI

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

struct FAQView_Previews: PreviewProvider {
    static var previews: some View {
        FAQView()
    }
}
