//
//  DeletingAccountView.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/17.
//

import SwiftUI

struct DeletingAccountView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var deletingReason_1: Bool = false
    @State var deletingReason_2: Bool = false
    @State var deletingReason_3: Bool = false
    @State var deletingReason_4: Bool = false
    @State var deletingReason_5: Bool = false
    
    @State var otherDeletingReason: String = ""
    
    @State var allInformationDeleting: Bool = false
    
    
    var body: some View {
        
        ScrollView{
            VStack(alignment: .leading){
                HStack{
                    Spacer()
                    Text("회원 탈퇴").font(.custom("Pretendard-Medium", size: 20)).padding(.leading, 24)
                    Spacer()
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(Color("TextBlack"))
                    }.frame(width: 24, height: 24).padding(.trailing, 24)
                }.frame(height: 40)
                Divider()
                VStack(alignment: .leading){
                    Text("바른이를 탈퇴하시면,")
                      .font(
                        Font.custom("Pretendard", size: 17)
                          .weight(.semibold)
                      )
                      .foregroundColor(.black)
                    
                    Text("• 신청하신 상담에 대한 모든 정보가 즉시 삭제됩니다. \n• 작성한 게시글(후기, 커뮤니티 등)이 모두 삭제되며 복구할 수 없습니다. \n• 중요한 정보가 있는지 탈퇴 전에 다시 한 번 확인 부탁드립니다.")
                      .font(
                        Font.custom("Pretendard", size: 14)
                          .weight(.medium)
                      )
                      .foregroundColor(.black).padding(.top, 15)
                    
                    Text("탈퇴 사유를 말씀해주세요.")
                      .font(
                        Font.custom("Pretendard", size: 17)
                          .weight(.semibold)
                      )
                      .foregroundColor(.black).padding(.top, 40)
                }.padding(.leading, 28).padding(.top, 25)
                
                VStack(alignment: .leading, spacing: 15){
                    reasonClickedView(isClicked: $deletingReason_1, deletingReason_1: $deletingReason_1, deletingReason_2: $deletingReason_2, deletingReason_3: $deletingReason_3, deletingReason_4: $deletingReason_4, deletingReason_5: $deletingReason_5, content: "얻고 싶은 정보가 부족해요.", isAll: false)
               
                    reasonClickedView(isClicked: $deletingReason_2, deletingReason_1: $deletingReason_1, deletingReason_2: $deletingReason_2, deletingReason_3: $deletingReason_3, deletingReason_4: $deletingReason_4, deletingReason_5: $deletingReason_5, content: "이미 다른 계정이 있어요.", isAll: false)
                    
                    reasonClickedView(isClicked: $deletingReason_3, deletingReason_1: $deletingReason_1, deletingReason_2: $deletingReason_2, deletingReason_3: $deletingReason_3, deletingReason_4: $deletingReason_4, deletingReason_5: $deletingReason_5, content: "탈퇴 후 재가입하고 싶이요.", isAll: false)

                    reasonClickedView(isClicked: $deletingReason_4, deletingReason_1: $deletingReason_1, deletingReason_2: $deletingReason_2, deletingReason_3: $deletingReason_3, deletingReason_4: $deletingReason_4, deletingReason_5: $deletingReason_5, content: "정보를 다 얻어서 떠나고 싶어요.", isAll: false)

                    reasonClickedView(isClicked: $deletingReason_5, deletingReason_1: $deletingReason_1, deletingReason_2: $deletingReason_2, deletingReason_3: $deletingReason_3, deletingReason_4: $deletingReason_4, deletingReason_5: $deletingReason_5, content: "기타사유", isAll: false)

                    
                }.padding(.leading, 28).padding(.top, 15)
                
                
                ZStack(alignment: .center) {
                    Rectangle()
                    .foregroundColor(.clear)
                    .background(Color(red: 0.91, green: 0.93, blue: 0.94))
                    .cornerRadius(16).padding(24).frame(height: 200)
                    
                    TextField("탈퇴 사유를 자세히 적어주세요. (20자 이상)", text: $otherDeletingReason, axis: .vertical)
                                .lineLimit(5, reservesSpace: true)
                                .cornerRadius(9).padding(.leading, 40)
                                .padding(.trailing, 40)
                }
                reasonClickedView(isClicked: $allInformationDeleting, deletingReason_1: $deletingReason_1, deletingReason_2: $deletingReason_2, deletingReason_3: $deletingReason_3, deletingReason_4: $deletingReason_4, deletingReason_5: $deletingReason_5, content: "모든 정보를 삭제하는데 동의합니다.", isAll: true).padding(.leading, 28)

                
                Button(action: {
                    dismiss()
                }, label: {
                        ZStack {
                                Rectangle().frame( height: 51)
                                    .cornerRadius(4)
                                    .foregroundColor(isEnabledBtn() ? Color("BackgroundBlue") : Color("disabledBtnColor"))
                            
                            Text("바른이 탈퇴하기")
                                .font(
                                    Font.custom("Pretendard-SemiBold", size: 16)
                                        .weight(.bold)
                                )
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(.white)
                        }
                }).padding(25).padding(.top, 20)

            }
        }
    }
    func reset(){
        deletingReason_1 = false
        deletingReason_2 = false
        deletingReason_3 = false
        deletingReason_4 = false
        deletingReason_5 = false
    }
    func isEnabledBtn() -> Bool {
        var isEnabled: Bool = false
        
        @State var atLeastOneReason: Bool = deletingReason_1 || deletingReason_2 || deletingReason_3 || deletingReason_4 || deletingReason_5
        
        if(atLeastOneReason && allInformationDeleting){
            if(deletingReason_5 == true){
                if(otherDeletingReason.count > 20){
                    isEnabled = true
                }else{
                    isEnabled = false
                }
            }else{
                isEnabled = true
            }
        }else{
            isEnabled = false
        }
        return isEnabled
    }
}

struct reasonClickedView: View {
    @Binding var isClicked: Bool
    
    
    @Binding var deletingReason_1: Bool
    @Binding var deletingReason_2: Bool
    @Binding var deletingReason_3: Bool
    @Binding var deletingReason_4: Bool
    @Binding var deletingReason_5: Bool
    
    let content: String
    
    let isAll: Bool
    
    var body: some View {
        HStack(alignment: .center){
            Button(action: {
                if(isAll == false){
                    reset()
                }
                
                isClicked.toggle()

            }, label: {
                Image(isClicked ? "blueCircle" : "grayCircle").resizable()
                    .aspectRatio(contentMode: .fill).frame(width: 25, height: 25)
            })
            
            Text(content)
              .font(
                Font.custom("Pretendard", size: 14)
                  .weight(.medium)
              ).padding(.leading, 11)
        }
    }
    func reset(){
        deletingReason_1 = false
        deletingReason_2 = false
        deletingReason_3 = false
        deletingReason_4 = false
        deletingReason_5 = false
    }
    
}

struct DeletingAccountView_Previews: PreviewProvider {
    static var previews: some View {
        DeletingAccountView()
    }
}
