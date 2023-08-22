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
        let comment1 = Comment(profileImageName: "Tooth", authorName: "공감이", text: "돌출입 교정되죠 당연히~ 부정교합이나 고르지못한 치열도 교정되구요. 외관상 예뻐지는 대신, 오랜기간 힘든건 감수해야겠더라구요. 그래서 전 그냥 생긴대로 살아갑니다;;ㅎㅎ", date: Date())
        let comment2 = Comment(profileImageName: "Tooth", authorName: "바르니", text: "저도 궁금해요", date: Date())
        let comment3 = Comment(profileImageName: "Tooth", authorName: "댓글러", text: "공감합니다 ..", date: Date())

        posts = [
            Post(authorName: "바른이" , content: "질문있어요! 치아교정고통이 어느 정도나 될까요?\n\n제가 하려고 마음을 먹었는데 주위에 해본 사람들이 하나같이 다 아프다며 치과갔다 온 날에는 음식도 못 씹을 정도라고 해서 겁이 나네요;\n\n교정기 자체가 아프기도 하고, 발치를 하거나 쪼이면 엄청 아프다고 하는데..\n\n저는 잇몸도 원래 약한 편이어서 더 심할 거 같아서 걱정이에요; 안 아프게 하는 방법은 없을까요..?\n\n종류도 다양하다고 들었는데 일반적인 방법 말고 새로운 방법으로 해보신 분 계시다면 치아교정고통 얼마나 되는지 좀 알려주세요ㅠ", modificationTime: "12시간 전 (수정됨)", likeCount: 10, comments: [comment2] , isLiked: false),
            Post(authorName: "못난이" , content: "치아 교정 할 때 잇몸같은데 무슨 나사 박는거 있다고 들었는데 그걸 박는 이유가 뭔지 아시는 분 있나요?\n\n그리고 혹시 치아교정을 하면 입꼬리가 비대칭인것도 개선되신 분 계신가요?", modificationTime: "2일 전 (수정됨)", likeCount: 5, comments: [comment2], isLiked: false),
            Post(authorName: "이아파" , content: "방학때 치아교정 할라고 하는데 약간 돌출입이거든요.\n\n심하진 않은데 치아교정할때 돌출입도 그냥 같이 해주나요? 아니면 따로 말을 해야 하나요?", modificationTime: "2시간 전", likeCount: 20, comments: [comment2], isLiked: false),
            Post(authorName: "교정이" , content: "치아교정이 비싸다고 해서 보험을 미리 들어두고 싶은데요. 치아교정 보험이 가능한가요?\n\n부모님께 민폐를 끼치고 싶지 않은데..", modificationTime: "10분 전", likeCount: 15, comments: [comment3], isLiked: false),
            Post(authorName: "토깽이굴" , content: "치아교정을 하면 돌출입이 고쳐지는건가요 아니면 돌출입이 교정되는 종류의 치아교정이 있는건가요?\n\n하신 분들 있으면 답변주세요!", modificationTime: "10분 전", likeCount: 15, comments: [comment1, comment2], isLiked: false)
        ]
    }
}
