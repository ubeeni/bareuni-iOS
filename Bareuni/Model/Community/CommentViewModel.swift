//
//  CommentViewModel.swift
//  Bareuni
//
//  Created by 김유빈 on 2023/08/10.
//

import Foundation

class CommentViewModel: ObservableObject {
    @Published var comments: [Comment] = []
    
    init() {
        comments = [
            Comment(profileImageName: "Tooth", nickname: "이아파", content: "공감합니다.", date: Date()),
            Comment(profileImageName: "Tooth", nickname: "토깽이굴", content: "저도 궁금해요.", date: Date())
        ]
    }
}
