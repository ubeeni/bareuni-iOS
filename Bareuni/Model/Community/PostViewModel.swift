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
            Post(content: "제가 나이가 46살인데요.\n\n치과공포증 때문에 치과를 잘 가질 않아서 윗쪽 잇몸염증도 심하고 예전에 치아가 썩어서 깨져서 박혀있는 어금니가 있어 임플란트도 해야 하는데, 덧니도 아래위로 심하거든요.\n\n큰맘먹고 내년에 치과가서 싹 치료하고 치아교정도 하려고 하는데요.\n\n제가 찾아보니 저같은 나이에는 잇몸염증이 심하면 치아교정을 하려고 해도 못한다는 글을 봐서요.\n\n밑쪽은 아니고 위쪽 왼쪽 잇몸이 많이 부어있고 치아도 좀 내려앉은 상태인데 혹시 저는 임플란트하고 치아교정은 할 수 없는걸까요?\n\n치과가서 상담은 안받아봐서 아직 자세힌 모르지만 작년에 어떤 병원 의사분한테 질문올려보니 치아교정은 나이랑 상관없고 치아교정, 임플란트 순서로 하게 되니 일단 상담받아보러 오라고 하시더라구요.\n\n상담 받아보는게 좋을까요?\n\n여러분 의견은 어떠세요?", modificationTime: "12시간 전 (수정됨)", likeCount: 10, comments: 21, isLiked: false),
            Post(content: "치아 교정 할 때 잇몸같은데 무슨 나사 박는거 있다고 들었는데 그걸 박는 이유가 뭔지 아시는 분 있나요?\n\n그리고 혹시 치아교정을 하면 입꼬리가 비대칭인것도 개선되신 분 계신가요?", modificationTime: "2일 전 (수정됨)", likeCount: 5, comments: 2, isLiked: false),
            Post(content: "방학때 치아교정 할라고 하는데 약간 돌출입이거든요.\n\n심하진 않은데 치아교정할때 돌출입도 그냥 같이 해주나요? 아니면 따로 말을 해야 하나요?", modificationTime: "2시간 전", likeCount: 20, comments: 10, isLiked: false),
            Post(content: "치아교정이 비싸다고 해서 보험을 미리 들어두고 싶은데요. 치아교정 보험이 가능한가요?\n\n부모님께 민폐를 끼치고 싶지 않은데..", modificationTime: "10분 전", likeCount: 15, comments: 7, isLiked: false),
            Post(content: "치아교정을 하면 돌출입이 고쳐지는건가요 아니면 돌출입이 교정되는 종류의 치아교정이 있는건가요?\n\n하신 분들 있으면 답변주세요!", modificationTime: "10분 전", likeCount: 15, comments: 7, isLiked: false)
        ]
    }
}
