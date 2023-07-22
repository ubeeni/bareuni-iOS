//
//  CommunityData.swift
//  Bareuni
//
//  Created by 김유빈 on 2023/07/20.
//

import Foundation

class CommunityData {
    var rating: String
    var contents: String
    var tag: String
    var time: String
    
    init(rating: String, contents: String, tag: String, time: String) {
        self.rating = rating
        self.contents = contents
        self.tag = tag
        self.time = time
    }
    
    static var dummyCommunityList = [CommunityData(rating: "1.", contents: "저는 치아교정한지 2년 3개월 된 사람입니다. 다름이 아니라 ..", tag: "의사 Q&A", time: "12시간 전 (수정됨)"), CommunityData(rating: "2.", contents: "교정을 마친 지 3년째인데 혹시 저랑 같은 문제가 생기신 분 계시나요?", tag: "자유 수다", time: "2일 전 (수정됨)"), CommunityData(rating: "3.", contents: "좋은 치과 선생님 좀 소개해 주세요! 저희 아이가 12살인데 지금 교정을 하는 것이 맞을까요?", tag: "자유 수다", time: "2시간 전"), CommunityData(rating: "4.", contents: "교정 유지 장치가 갑자기 떨어져 버렸어요.. 이거 어떻게 하는 게 좋을까요?", tag: "의사 Q&A", time: "10분 전")]
}
