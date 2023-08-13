//
//  MyPageMainView.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/08.
//

import SwiftUI

struct MyPageMainView: View {
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    Image("Tooth")
                        .resizable()
                        .aspectRatio(contentMode: .fill).frame(width: 60, height: 60).clipShape(Circle())
                        .overlay(Circle().stroke(Color(UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1).cgColor), lineWidth: 0.5))
                        .padding(.leading, 13)
                    
                    VStack(alignment: .leading, spacing: 6){
                        Text("이아파").font(.custom("Pretendard-SemiBold", size: 18))
                        Text("교정 0").font(.custom("Pretendard-Medium", size: 13)).foregroundColor(Color(UIColor(red: 0.583, green: 0.583, blue: 0.583, alpha: 1)))
                        
                        Text("5,000p").font(.custom("Pretendard-Medium", size: 13)).foregroundColor(Color(UIColor(red: 0.469, green: 0.751, blue: 0.954, alpha: 1)))
                    }
                    Spacer()
                    NavigationLink(destination: MyInfoView()) { // $ 표시로 Binding으로 전달
                        Text("내 정보 수정").font(.custom("Pretendard-Medium", size: 12)).foregroundColor(Color(UIColor(red: 0.442, green: 0.442, blue: 0.442, alpha: 1))).frame(width: 73, height: 25).background(Color(UIColor(red: 0.913, green: 0.913, blue: 0.913, alpha: 1)))
                            .cornerRadius(8).padding(.trailing, 13)
                    }
                }.overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(UIColor(red: 0.762, green: 0.762, blue: 0.762, alpha: 1)), lineWidth: 0.5)
                        .frame( height: 112)
                ).padding(.leading, 24).padding(.trailing, 24).padding(.top, 30)
                
                HStack{
                    NavigationLink(destination: SavedListView()) {
                        VStack {
                            Image("BookMark")
                            Text("저장 목록").font(.custom("Pretendard-Medium", size: 14)).foregroundColor(Color.black)
                        }.frame(width: 66, height: 54)
                    }
                    NavigationLink(destination: PostHistroyView()) {
                        VStack {
                            Image("pencil")
                            Text("작성 내역").font(.custom("Pretendard-Medium", size: 14)).foregroundColor(Color.black)
                        }.frame(width: 66, height: 54)
                    }
                    Button(action: {}) {
                        VStack {
                            Image("note")
                            Text("예약 내역").font(.custom("Pretendard-Medium", size: 14)).foregroundColor(Color.black)
                        }.frame(width: 66, height: 54)
                    }
                    
                }.frame( width: 244, height: 66).padding(.top, 36)
                
                
                Image("Line").padding(.top, 40)
                
                VStack(spacing: 20){
                    NavigationLink(destination: PointView()) {
                        HStack(spacing: 8){
                            Text("포인트 관리").font(.custom("Pretendard-Medium", size: 16)).foregroundColor(Color.black)
                            Spacer()
                            
                            Image("ArrowBack").frame(width: 15, height: 15)
                        }
                    }.frame(height: 35)
                    Button(action: {}) {
                        HStack(spacing: 8){
                            Text("바른이 칼럼").font(.custom("Pretendard-Medium", size: 16)).foregroundColor(Color.black)
                            Spacer()
                            
                            Image("ArrowBack").frame(width: 15, height: 15)
                        }
                    }.frame(height: 35)
                    
                    NavigationLink(destination: CustomerServiceView()) {
                        HStack(spacing: 8){
                            Text("이용 내역").font(.custom("Pretendard-Medium", size: 16)).foregroundColor(Color.black)
                            Spacer()
                            
                            Image("ArrowBack").frame(width: 15, height: 15)
                        }
                    }.frame(height: 35)
                }.padding(.top, 25).padding(.leading, 18).padding(.trailing, 25)
                
                Spacer()
                
            }.padding(.top, 30).navigationBarTitle("", displayMode: .inline).accentColor(.gray)
                .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("마이페이지")
                        .font(.custom("Pretendard-Medium", size: 24))
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {print("Button1")}){
                        Image("icon_bell")
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {print("Button1")}){
                        Image("setting")
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                }
                
            }
        }.accentColor(.gray)
    }
}
struct MyPageMainView_Previews: PreviewProvider {
  static var previews: some View {
      MyPageMainView()
  }
}
