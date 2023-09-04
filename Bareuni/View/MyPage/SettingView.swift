//
//  SettingView.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/17.
//

import SwiftUI
import UIKit

struct SettingView: View {
    @State var isLocked: Bool = true
    @State var isShowLogoutAlert: Bool = false
    @State var showingDeletingUser: Bool = false
    @State var showSignUpView: Bool = false
    
    var body: some View {
        VStack(alignment: .leading){
            Divider()
            
            ScrollView{
                VStack(alignment: .leading){
                    Text("계정 관리")
                        .font(
                            .custom("Pretendard", size: 12)
                            .weight(.semibold))
                        .kerning(0.12)
                        .foregroundColor(Color(red: 0.5, green: 0.51, blue: 0.52))
                    NavigationLink(destination: AccountInfoView()){

                            Text("계정 정보")
                                .font(
                                    Font.custom("Pretendard", size: 16)
                                        .weight(.medium)
                                )
                                .kerning(0.16)
                                .foregroundColor(Color(red: 0.22, green: 0.23, blue: 0.23)).padding(.top, 20).frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    
                    
                    Text("알림 및 보안")
                        .font(
                            Font.custom("Pretendard", size: 12)
                                .weight(.semibold)
                        )
                        .kerning(0.12)
                        .foregroundColor(Color(red: 0.5, green: 0.51, blue: 0.52)).padding(.top, 55)
                    NavigationLink(destination: AlarmSettingView()){
                        HStack() {
                            Text("알림 설정")
                                .font(
                                    Font.custom("Pretendard", size: 16)
                                        .weight(.medium)
                                )
                                .kerning(0.16)
                                .foregroundColor(Color(red: 0.22, green: 0.23, blue: 0.23))
                            
                            Spacer()
                            
                            Image("ArrowBack").frame(width: 15, height: 15)
                            
                        }.padding(.top, 20).padding(.trailing, 20)
                    }
                    
                    
                        HStack() {
                            Text("앱 잠금")
                                .font(
                                    Font.custom("Pretendard", size: 16)
                                        .weight(.medium)
                                )
                                .kerning(0.16)
                                .foregroundColor(Color(red: 0.22, green: 0.23, blue: 0.23))
                            
                            Spacer()
                            
                            Toggle(isOn: $isLocked, label: { })
                                .padding()
                                .toggleStyle(SwitchToggleStyle(tint: Color("BackgroundBlue")))
                            
                        }.padding(.top, 20).padding(.trailing, 20)
                    
                    
                    Text("앱 정보")
                        .font(
                            Font.custom("Pretendard", size: 12)
                                .weight(.semibold)
                        )
                        .kerning(0.12)
                        .foregroundColor(Color(red: 0.5, green: 0.51, blue: 0.52)).padding(.top, 40)
                    NavigationLink(destination: PrivacyPolicyView()){
                        HStack() {
                            Text("개인정보 처리방침")
                                .font(
                                    Font.custom("Pretendard", size: 16)
                                        .weight(.medium)
                                )
                                .kerning(0.16)
                                .foregroundColor(Color(red: 0.22, green: 0.23, blue: 0.23))
                            
                            Spacer()
                            
                            Image("ArrowBack").frame(width: 15, height: 15)
                            
                        }.padding(.top, 25).padding(.trailing, 20)
                    }
                    
                    Group(){
                        HStack() {
                            Text("버전 정보")
                                .font(
                                    Font.custom("Pretendard", size: 16)
                                        .weight(.medium)
                                )
                                .kerning(0.16)
                                .foregroundColor(Color(red: 0.22, green: 0.23, blue: 0.23))
                            
                            Spacer()
                            
                            Text("최신 버전")
                                .font(
                                    Font.custom("Pretendard", size: 16)
                                        .weight(.medium)
                                )
                                .kerning(0.16)
                                .foregroundColor(Color(red: 0.81, green: 0.81, blue: 0.81))
                            
                        }.padding(.top, 25).padding(.trailing, 20)
                        
                        Text("현재 1.1")
                            .font(
                                Font.custom("Pretendard", size: 12)
                                    .weight(.medium)
                            )
                            .kerning(0.12)
                            .foregroundColor(Color(red: 0.81, green: 0.81, blue: 0.81))
                        Button(action: {
                            isShowLogoutAlert.toggle()
                        }, label: {
                            HStack() {
                                Text("로그아웃")
                                    .font(
                                        Font.custom("Pretendard", size: 16)
                                            .weight(.medium)
                                    )
                                    .kerning(0.16)
                                    .foregroundColor(Color(red: 0.22, green: 0.23, blue: 0.23))
                                
                                Spacer()
                                
                                Image("ArrowBack").frame(width: 15, height: 15)
                                
                            }.padding(.top, 25).padding(.trailing, 20)
                        }).fullScreenCover(isPresented: $showSignUpView) {
                            StoryboardViewController()
                        }.alert(isPresented: $isShowLogoutAlert) {
                            
                            let SomeButton1 = Alert.Button.default(Text("네").foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                            ) {
                                LoginAPI.shared.logout(completion: {
                                    result in
                                    switch result {
                                    case .success(let result):
                                        if(result.code == 1000){
                                            print("로그아웃 성공")
                                            showSignUpView = true
                                        }
                                        print("code: \(result.code),  message: \(result.message)")
                                        
                                        
                                    case .failure(let error):
                                        print("Error: \(error)")
                                    }
                                    
                                })
                            }
                            let SomeButton2 = Alert.Button.cancel(Text("아니오")) {
                                print("secondary button pressed")
                            }
                            return Alert(title: Text("로그아웃 하시겠습니까?"),
                                         message: Text(""),
                                         primaryButton: SomeButton1, secondaryButton: SomeButton2)
                        }
                      
                        Button(action: {
                            showingDeletingUser.toggle()
                        }, label: {
                            HStack() {
                                Text("회원 탈퇴")
                                    .font(
                                        Font.custom("Pretendard", size: 16)
                                            .weight(.medium)
                                    )
                                    .kerning(0.16)
                                    .foregroundColor(Color(red: 0.22, green: 0.23, blue: 0.23))
                                
                                Spacer()
                                
                                Image("ArrowBack").frame(width: 15, height: 15)
                                
                            }.padding(.top, 25).padding(.trailing, 20)
                        }).fullScreenCover(isPresented: $showingDeletingUser) {
                            DeletingAccountView()
                        }
                    }
                }.padding(.leading, 24)
            }.padding(.top, 30)
            Spacer()
            
            
            
        }.navigationBarTitle("", displayMode: .inline).accentColor(.gray)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("설정")
                        .font(.custom("Pretendard-Medium", size: 20))
                }
                
            }
    }
    
}

struct StoryboardViewController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let storyboard = UIStoryboard(name: "Login", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(identifier: "LoginUINavigationController")
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
