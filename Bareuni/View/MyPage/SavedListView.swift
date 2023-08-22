//
//  SavedListView.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/12.
//

import SwiftUI

struct SavedListView: View {
    @State var dentistList = [Dentist(name: "연세반디치과교정과", info: "가리지 말고 당당하게 웃으세요! Sure smile! 연세반디교정치과 01. 진정한 치아교정 전문병원 연세반디교정치과는 치아교정에만 집중합니다. 환자 개개인에 맞는 치료 방법을 연구하고 제공합니다. 일반 치과진료는 다른 치과의원과 긴밀한 협력관계를 갖고 있습니다. 02. 환자의 눈높이에 맞춘 친절한 설명과 상담 무선 PACS 시스템인 닥터패드를 도입하여 환자의 이해를 돕기 위해 노력합니다. 편안하고 쾌적하게 진료를 받을 수 있도록 항상 노력하겠습니다. 03. 연세대 출신 교정전문의 원장진료 역동적으로 발전하고 있는 치규ㅘ교정학에 발맞추어 항상 새로운 치료법을 연구하고 최신의 장치를 사용합니다. 치아 교정은 다른 치과 치료와는 달리 평생에 1번, 장시간에 걸쳐 주기적으로 내원하여 받는 치료이기 때문에 치료 의사의 선택이 매우 중요합니다. 연세반디교정치과는 진단부터 치료완료까지 교정전문의 백인규 원장과 진행하여 체계적인 치료를 받을 수 있습니다. 또한 치료 기간 도중 의료진이 바뀌는 경우가 없어서 치료의 안정성과 효율성을 보장해드립니다.", star: 4.8, address: "서울특별시 영등포구 영등포동3가 10-15 대선빌딩 8층", reservation: true, Favorites: false),
    Dentist(name: "연세바로치과교정과치과의원", info: "※ 오직 교정치료를 위해 모인 5인의 치과전문의 연세대학교 교정과 최대 교정 전문 네트워크 '압구정 연세바로치과' 투명교정 인비절라인, 일반교정, 무삭제 피팅라미네이트(젤라미), 충치·보철치료 등을 통합적으로 진료받으세요! ★ 인비절라인 블랙 다이아몬드 등급을 달성! ★ - 1:1 주치의 제도를 진행 - 무리되는 진료나 과잉진료는 NO! - 부작용을 최소화 하는 안전한 진료만을 권장 - 프라이빗한 시설로 집중치료 진행 - 마취 연고, 가글 마취, 무통 마취를 사용하여 치과에 대한 두려움을 최소화", star: 5, address: "서울특별시 양천구 신정3동 1191-7", reservation: true, Favorites: false),
    Dentist(name: "연세쌍둥이치과교정과치과의원", info: "주말에도 활짝 열려있는 치과, 연세쌍둥이 치과교정과입니다. 주말에도 편하게 진료할 수 있는 치과를 찾으셨나요? 연세 쌍둥이 치과교정과는 요일 상관없이 활짝 열려있습니다. 평일에 진료하기 위해 애써서 시간내지마시고 연세 쌍둥이 치과교정과로 오세요!", star: 4.8, address: "서울 양천구 목동동로 293 현대41타워 4층 401호", title: ["야간진료", "주말", "쌍둥이", "전문의", "무료주차"], reservation: false, Favorites: false),
    Dentist(name: "바른턱치과교정과치과의원", info: "유명 대표원장과의 1:1 상담을 해보고 싶다면?", star: 4.5, address: "서울특별시 송파구 송파대로 345", reservation: true, Favorites: false)]
    
    var body: some View {
        VStack{
            Divider()
            Spacer()
            
            if(dentistList.isEmpty){
                BlankView(text: "아직 저장된 치과가 없어요.")
            }else{
                ScrollView {
                    LazyVStack {
                        
                        ForEach(dentistList){ dentist in
                            recommendedDentistView(dentist: dentist)
                            Spacer().frame(height: 23)
                        }
                        
                    }.scrollContentBackground(.hidden).listStyle(.plain)
                }
            }
            
            Spacer()
            
            
        }.navigationBarTitle("", displayMode: .inline).accentColor(.gray)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("저장 목록")
                        .font(.custom("Pretendard-Medium", size: 20))
                }
                
            }
    }
}

internal struct BlankView: View{
    let text: String
    
    var body: some View {
        Image("Tooth").resizable()
            .aspectRatio(contentMode: .fill).frame(width:80, height: 80)
        Text(text).font(.custom("Pretendard-Medium", size: 16)).padding(.top, 16)
    }
    
    
}

struct SavedListView_Previews: PreviewProvider {
    static var previews: some View {
        SavedListView()
    }
}
