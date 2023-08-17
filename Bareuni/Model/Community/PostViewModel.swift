//
//  PostViewModel.swift
//  Bareuni
//
//  Created by 김유빈 on 2023/08/10.
//

import Foundation

class PostViewModel: ObservableObject {
    @Published var posts: [Post] = [] 
    
    init() {
        posts = [
            Post(content: "저는 치아교정한지 2년 3개월 된 사람입니다. 다름이 아니라 현재 이런 고민이 있습니다..", modificationTime: "12시간 전 (수정됨)", likeCount: 10, comments: 21, isLiked: false),
            Post(content: "교정을 마친 지 3년째인데 혹시 저랑 같은 문제가 생기신 분 계시나요?", modificationTime: "2일 전 (수정됨)", likeCount: 5, comments: 2, isLiked: false),
            Post(content: "좋은 치과 선생님 좀 소개해 주세요! 저희 아이가 12살인데 지금 교정을 하는 것이 맞을까요?", modificationTime: "2시간 전", likeCount: 20, comments: 10, isLiked: false),
            Post(content: "교정 유지 장치가 갑자기 떨어져 버렸어요. 이거 어떻게 하는 게 좋을까요?", modificationTime: "10분 전", likeCount: 15, comments: 7, isLiked: false)
        ]
    }
}
