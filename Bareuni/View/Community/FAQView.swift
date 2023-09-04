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
                    DetailView(title: "교정치료의 시기는 언제가 좋을까요?", content: "교정치료의 시기를 정확하게 대답하기는 어렵습니다.\n문제점에 따라 각기 적절한 치료를 한다고 볼 수 있는데, 일반적으로 7세경에 방문하여 교정문제가 없는지 진단받아보는 것이 가장 바람직합니다.\n\n아이들의 교정치료 시기를 진단하는 데 있어 가장 중요한 요소는 턱에 의한 문제인지 아니면 치아의 배열에만 문제인지가 교정치료 시기를 진단함에 가장 큰 기준이 된다고 할 수 있습니다. 턱의 성장은 정상이고 치아배열만 삐뚤어진 경우 영구치로 교환하는 데 있어 큰 문제가 없는 경우는 영구치가 어느 정도 교환된 시기인 만 10~12세에 교정치료를 받는 것이 좋습니다.\n\n하지만 영구치로 교환하는 데 있어 문제가 되는 경우 즉 유치가 너무 일찍 빠진 경우 또는 유치 밑에 자라고 있는 영구치의 발육에 이상이 있어 정상적으로 나오지 못한다면 바로 치료를 시작해야 합니다.\n\n반면에 턱의 성장에 문제가 있는 경우에는 영구치가 나오기 전에 교정치료를 시작하는 것이 좋습니다. 예를 들면 아래턱이 나와보이고 위아래 치아들이 반대로 물리는 경우 만 6~8세에 교정치료를 시작하는 것이 좋으며 이와 달리 위턱이 많이 나와 보이거나 위치아가 아래 치아를 많이 덮어 아래 치아가 보이지 않는 경우는 2차성징이 나타나기 전에 교정치료를 시작하는 것이 좋습니다.\n\n이렇게 턱 성장에 문제가 있을 경우 조기에 교정치료를 하는 것은 아이들의 전체적인 성장과 턱 성장을 균형 있게 잘 조절하여 치료하여 성인이 되어 수술로 교정치료를 하는 것을 막을 수 있습니다.\n\n특히 주의해야 할 것은 남자아이와 여자아이의 신체발달이 달라 그 시기에 차이가 있을 수 있습니다. 요즘 아이들이 워낙 성장이 빠르다 보니 교정치료 과정이 중요합니다.\n\n교정치료는 정확한 검사와 진단 그리고 상담을 통해 치료 계획을 수립하여 진행해야 합니다. 이는 매우 중요한 것입니다.\n\n이 밖에도 아이들 교정치료 시기를 좌우하는 것들이 있는데 그중 아이들의 구강악습관(손가락 빨기,구호흡등)도 교정치료시기를 고려함에 있어 중요한 요소가 되기도 합니다.")
                    
                    DetailView(title: "교정치료를 하면 턱이 갸름해질까요?", content: "치아 교정은 치아를 올바른 위치로 가지런하게 하고 윗니와 아래 치아의 교합 상태 등을 개선하는 것이지 턱이 갸름해지도록 치료 계획을 잡고 하지는 않습니다.\n\n턱이 갸름해지려면 턱뼈를 변화시키는 외과적 수술을 해야 합니다.\n\n하지만 치아 교정을 하게 되면 얼굴의 전체적인 윤곽선의 변화가 옵니다. 그러다 보니 턱선도 자연스럽게 변화된 것처럼 보이는 것입니다. 특히 돌출입을 가진 경우 치아교정을 하게 되면 일반적인 교정보다 입, 코, 턱, 입술 그리고 옆모습의 변화가 커서 교정 전과 후의 변화된 모습의 차이가 많습니다. 하지만 이러한 치아교정의 모습은 사람마다 그 차이가 있습니다.\n이러한 이유로 교정을 시작하기 전에 정확한 검사와 진단 그리고 환자와의 충분한 상담을 통하여 계획된 방향으로 치료를 하게 되는 것입니다.\n\n또 한 가지 이유로는 치아교정 시 먹는 음식에 대한 주의사항이 많아 턱의 근육이 움직임이 예전보다 많지 않아 일시적으로 턱선이 갸름해지기도 합니다. 이것은 교정치료가 끝난 후 음식물을 씹는 근육의 움직임이 늘어나면 원상태로 돌아갈 수도 있습니다.")
                    
                    DetailView(title: "교정치료의 기간은 얼마나 걸리나요?", content: "교정치료 기간은 부정교합의 유형과 심한 정도, 환자의 나이, 협조도, 조직의 상태에 따라 다릅니다. 정확한 교정진단을 받아야 자세한 치료 기간을 알 수 있습니다. 일차적으로 치료 기간은 1년 반에서 2년 반 정도라 할 수 있습니다.\n\n골격적인 문제가 있는 경우에는 1차적으로 턱 교정치료를 받고 2차적으로 치열교정치료가 필요한 경우도 있습니다.\n이 경우 1차 교정은 성장발육을 이용하기에 치료 기간이 약간 더 길어질 수 있습니다")
                    
                    DetailView(title: "교정치료시 치아를 뽑는 이유는 무엇인가요?", content: "교정치료를 위해 치아를 빼야 하는 경우가 있습니다. 삐뚤어진 치아를 바로잡기 위하여, 보다 환자분이 원하는 이상적인 얼굴을 위하여 발치를 하게 됩니다.\n\n상하지 않은 치아를 가진 경우 치아를 뽑는 것에 대해 걱정을 하는 분들도 있지만 대부분 유사한 기능을 하는 두 개의 치아 중 하나를 뽑는 것이므로 기능적인 부분을 크게 걱정하지 않으셔도 됩니다.\n\n발치(치아를 뽑는 것)를 동반한 교정치료를 통해 보다 아름다운 치열과 안모를 가질 수 있습니다.")
                    
                    DetailView(title: "교정치료에도 부작용이 있나요?", content: "치아교정의 부작용은 대부분 교정 중 치아관리를 철저히 하지 않은 경우 생기는 것들입니다.\n\n이런 문제들은 대부분 주의사항을 잘 지키시면 예방되며 치아 표면의 탈회, 잇몸 염증, 치근 흡수 등의 문제점이 생기더라도 경미한 수준으로 그칠 수 있습니다.")
                    
                    DetailView(title: "교정치료를 하면 얼마나 자주 치과에 방문해야 하나요?", content: "환자 개인의 상태에 따라 달라지기 때문에 정확한 주기는 말씀드리기 힘들지만 대체로 한 달에 한 번 정도 방문해 주시면 됩니다.")
                    
                    DetailView(title: "교정을 하면 많이 아픈가요?", content: "치료 초기에 교정장치에 의해 이물감을 느끼거나 자극을 받으시거나 장치를 조여 치아가 움직일 때 며칠 정도 통증을 느끼실 수 있습니다. 하지만 이는 참을만한 약한 통증입니다.\n\n장치를 부착하고 1주일 정도가 지나면 이물감에는 적응이 됩니다.")
                    
                    DetailView(title: "임신 중 치아교정를 받아도 될까요?", content: "교정치료 자체는 몸의 생리작용을 이용하여 치료하는 것입니다.\n그러므로 교정치료 중 임신을 하는 것, 임신 중 교정치료를 계속하는 것은 가능합니다.\n다만 항생제 복용, 엑스레이 촬영, 치아 발치를 임신 전에 하셔야 문제없이 진행하실 수 있습니다.\n\n임신 초기에는 호르몬 변화, 몸의 대사 활동의 변화 등 힘든 시기를 거치게 되는데요, 적응하는 기간 동안 불편함, 통증 등을 견뎌야 하므로 교정치료를 시작하지 않았다면 임신 초기가 지난 후에 시작하는 것이 좋을 것 같습니다.\n\n발치, 엑스레이 촬영 등은 임신전에 미리 시행하는 것이 좋고, 임신 중이라면 임신 2기쯤 주치의와 상의 후 진행하시면 됩니다.\n특히 임신 중에는 호르몬 변화가 있어 임신하지 않은 사람과 비교하여 잇몸 염증이 발생할 가능성이 높습니다.\n이 부분은 철저한 구강관리(올바른 칫솔질, 치실 사용 등)를 해주시면 됩니다. 임신과 교정치료를 동시에 계획 중이시면 우선 치과로 방문해서 진단 및 상담 후에 결정하시면 좋을 것 같습니다.")
                    
                    DetailView(title: "교정치료 중 주의해야 하는 음식은 무엇일까요?", content: "교정장치가 떨어지게 되면 장치가 붙어있었던 치아의 교정치료는 중단이 되는 것이고 장치가 그대로 붙어있는 치아들은 치료가 진행되어 원래 계획되었던 치료에서 벗어나 치열이 비뚤어지게 됩니다.\n\n장치가 떨어지자마자 병원에 오셔서 치료를 받으신다면 크게 문제가 없겠지만, 대부분 사회생활을 하고 계시기에 떨어진 장치를 다시 붙이러 오시는 데 시간이 걸리게 되고 오실 때까지 치아가 원하지 않는 방향으로 이동하여 치아와 치아 사이에 불필요한 공간이 생기게 됩니다.\n\n첫 번째, 딱딱한 음식-양념게장, 땅콩 호두 얼음, 오돌뼈 누룽지 등\n\n두 번째, 질긴 음식-오징어, 질긴 갈비, 육포, 등\n\n세 번째, 끈적이는 음식-떡, 엿, 카라멜, 껌 등\n\n네 번째, 진한 색소의 음식-카레, 커피, 와인, 빨간 음식 등\n\n특히 치아색(레진브라켓)로 교정하시는 분들은 장치에도 착색될 수 있습니다.")
                    
                    DetailView(title: "교정치료 중 장치가 떨어졌어요?!", content: "교정장치의 탈락이란, 치아 표면에 브라켓을 붙이고 와이어를 연결하게 되는 교정치료에서 브라켓이 치아에서 떨어진다거나 와이어가 브라켓 사이에서 끊어져 빠지거나 휘어져 빠져버리는 현상들을 말합니다.\n\n음식을 드실 때 가끔 장치 사이에 음식물이 끼이게 되고, 그로 인해 장치 사이가 벌어져 교정 와이어가 떨어지는 경우가 있습니다.\n\n바로 병원을 내원하지 않으시고 정기 치료 날짜까지 그냥 두시게 될 경우 장치가 잇몸을 찔러 상처가 날 수 있으며, 장치가 떨어진 상태로 오랫동안 방치할 경우 교정 치료 중이던 치아가 다시 원상태로 되돌아가 가려는 힘 때문에 교정 기간이 늘어나게 될 수 있습니다.")
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
