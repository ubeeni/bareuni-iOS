//
//  DentistViewModel.swift
//  Bareuni
//
//  Created by 황인성 on 2023/07/18.
//

import Foundation

class DentistViewModel: ObservableObject{
    @Published var Dentists = [Dentist]()

    
    init(){
        Dentists.append(Dentist(name: "오목교정치과의", info: "목동에 위치해 있는 JS치과입니다. 교정과 미백에 관한 모든 궁금한 사항과 문제점을 해결해드릴 수 있는 치과이므로 많은 이용바랍니다. 감사합니다.", star: 1, address: "서울특별시 양천구 신목로 102, 203~205호 (목동, 대경프라자)", title: ["일반의 1명", "교정전문", "턱관절", "치과의원", "주차"], reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "연세쌍둥이 치과교정과 치과의원", info: "주말에도 활짝 열려있는 치과, 연세쌍둥이 치과교정과입니다. 주말에도 편하게 진료할 수 있는 치과를 찾으셨나요? 연세 쌍둥이 치과교정과는 요일 상관없이 활짝 열려있습니다. 평일에 진료하기 위해 애써서 시간내지마시고 연세 쌍둥이 치과교정과로 오세요!", star: 2, address: "서울 양천구 목동동로 293 현대41타워 4층 401호", title: ["야간진료", "주말", "쌍둥이", "전문의", "무료주차"], reservation: false, Favorites: false))
        Dentists.append(Dentist(name: "치즈 치과교정과 치과의원", info: "정보", star: 3, address: "서울특별시 구로구 신도림동 경인로67길 23", title: ["구강내과", "안면방사선과", "전문의", "보건소"], reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "연세반디 치과교정과", info: "가리지 말고 당당하게 웃으세요! Sure smile! 연세반디교정치과 01. 진정한 치아교정 전문병원 연세반디교정치과는 치아교정에만 집중합니다. 환자 개개인에 맞는 치료 방법을 연구하고 제공합니다.일반 치과진료는 다른 치과의원과 긴밀한 협력관계를 갖고 있습니다. 02. 환자의 눈높이에 맞춘 친절한 설명과 상담 무선 PACS 시스템인 닥터패드를 도입하여 환자의 이해를 돕기 위해 노력합니다. 편안하고 쾌적하게 진료를 받을 수 있도록 항상 노력하겠습니다. 03. 연세대 출신 교정전문의 원장진료 역동적으로 발전하고 있는 치규ㅘ교정학에 발맞추어 항상 새로운 치료법을 연구하고 최신의 장치를 사용합니다. 치아 교정은 다른 치과 치료와는 달리 평생에 1번, 장시간에 걸쳐 주기적으로 내원하여 받는 치료이기 때문에 치료 의사의 선택이 매우 중요합니다. 연세반디교정치과는 진단부터 치료완료까지 교정전문의 백인규 원장과 진행하여 체계적인 치료를 받을 수 있습니다. 또한 치료 기간 도중 의료진이 바뀌는 경우가 없어서 치료의 안정성과 효율성을 보장해드립니다.", star: 4, address: "서울특별시 영등포구 영등포동3가 10-15 대선빌딩 8층", reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "연세바로치과교정과치과의원", info: "※ 오직 교정치료를 위해 모인 5인의 치과전문의 연세대학교 교정과 최대 교정 전문 네트워크 '압구정 연세바로치과' 투명교정 인비절라인, 일반교정, 무삭제 피팅라미네이트(젤라미), 충치·보철치료 등을 통합적으로 진료받으세요! ★ 인비절라인 블랙 다이아몬드 등급을 달성! ★ - 1:1 주치의 제도를 진행 - 무리되는 진료나 과잉진료는 NO! - 부작용을 최소화 하는 안전한 진료만을 권장 - 프라이빗한 시설로 집중치료 진행 - 마취 연고, 가글 마취, 무통 마취를 사용하여 치과에 대한 두려움을 최소화", star: 5, address: "서울특별시 양천구 신정3동 1191-7", reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "바른턱치과교정과치과의원", info: "정보6", star: 6, address: "서울특별시 송파구 송파대로 345", reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "연세새미치과교정과치과의원", info: "정보7", star: 7, address: "서울특별시 송파구 문정2동 131-2", reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "연세모두치과교정과치과의원", info: "정보8", star: 8, address: "KR 중앙타워 703호, 300, 위례광장로, 감북동 수정구 성남시 경기도", reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "웃는내일치과교정과치과의원", info: "정보9", star: 9, address: "서울특별시 강남구 대치1동 남부순환로 2909 3층", reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "서울클리어치과교정과치과의원 잠실점", info: "정보10", star: 10, address: "서울특별시 송파구 올림픽로 145 리센츠상가 5층", reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "고우넷치과교정과치과의원 천호클리닉", info: "정보1", star: 1, address: "서울특별시 강동구 천호 천호대로 1006 403-405호 브라운스톤", reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "미소유치과교정과치과의원", info: "정보2", star: 2, address: "서울특별시 강동구 올림픽로 663 아스하임 2층", reservation: false, Favorites: false))
        Dentists.append(Dentist(name: "아름다운바른이치과교정과치과의원", info: "정보3", star: 3, address: "서울특별시 강서구 마곡 747 타워 스터벅스건물 4층", reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "타임교정치과", info: "정보4", star: 4, address: "서울특별시 강서구 공항대로 269-15 힐스테이트에코마곡빌딩 3층", reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "강서바른이치과교정과/GSB orthodontic", info: "정보5", star: 5, address: "서울특별시 강서구 강서로 348 우장산힐스테이트 상가 3층", reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "연세바로치과교정과치과의원", info: "정보6", star: 6, address: "서울특별시 양천구 신정3동 1191-7", reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "정우선 교정치과", info: "정보7", star: 7, address: "대치역 1번출구 622-1 KR 서울특별시 강남구 대치동 대치클래시아 3층", reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "웃는내일치과교정과치과의원", info: "정보8", star: 8, address: "서울특별시 강남구 대치1동 남부순환로 2909 3층", reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "김진호교정치과", info: "정보9", star: 9, address: "서울특별시 강남구 대치동 507 3 김진호교정치과 층 306-1호", reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "스마일어게인교정치과 강남점", info: "정보10", star: 10, address: "서울특별시 서초구 서초동 서초대로 397 부띠크모나크 204호", reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "서울메이플치과교정과치과의원", info: "정보1", star: 1, address: "번지 2층 203 KR 서울특별시 노원구 중계동 366-9 호 스카이타워", reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "퍼스트원치과교정과치과의원", info: "정보2", star: 2, address: "서울특별시 노원구 노해로 480 조광빌딩 9층(902호", reservation: false, Favorites: false))
        Dentists.append(Dentist(name: "샤인 치과교정과 치과병원", info: "정보3", star: 3, address: "서울특별시 노원구 노해로 488 근호빌딩 5층", reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "하얀미소치과 교정과", info: "정보4", star: 4, address: "64, 상계로 노원구 서울특별시", reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "서울나란이 교정전문치과", info: "정보5", star: 5, address: "서울특별시 관악구 남부순환로 1801", reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "원스치과교정과치과의원", info: "정보6", star: 6, address: "서울특별시 관악구 시흥대로 558-1 G밸리마인드 1차 4층", reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "홍선생치과교정과치과의원", info: "정보7", star: 7, address: "서울특별시 은평구 갈현동 통일로 869", reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "서울클리어치과교정과치과의원 연신내점", info: "정보8", star: 8, address: "서울특별시 은평구 통일로 854 3층", reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "서울고운누리 치과교정과", info: "정보9", star: 9, address: "서울특별시 은평구 대조동 연서로 214 3층", reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "미소유치과교정과치과의원", info: "정보10", star: 10, address: "서울특별시 강동구 올림픽로 663 아스하임 2층", reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "시그니처교정치과", info: "정보1", star: 1, address: "서울특별시 강동구 천호동 엘크루주상복합 3층 301호", reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "고우넷치과교정과치과의원 천호클리닉", info: "정보2", star: 2, address: "서울특별시 강동구 천호 천호대로 1006 403-405호 브라운스톤", reservation: false, Favorites: false))
        Dentists.append(Dentist(name: "연세바로치과교정과치과의원", info: "정보3", star: 3, address: "서울특별시 양천구 신정3동 1191-7", reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "연세쌍둥이 치과교정과 치과의원", info: "정보4", star: 4, address: "서울특별시 양천구 목동 917-9 현대41타워 4층 401호", reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "연세바로치과교정과치과의원", info: "정보5", star: 5, address: "서울특별시 양천구 신정3동 1191-7", reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "더가지런한 치과교정과 치과의원", info: "정보6", star: 6, address: "서울특별시 강북구 35-22 3층", reservation: true, Favorites: false))
        Dentists.append(Dentist(name: "뉴욕바른라인치과의원 (New York Bareunline Orthodontics)", info: "정보7", star: 7, address: "서울특별시 중구 승지빌딩 6층", reservation: true, Favorites: false))
    }
}















