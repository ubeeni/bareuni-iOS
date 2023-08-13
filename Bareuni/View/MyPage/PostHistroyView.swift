//
//  PostHistroyView.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/12.
//

import SwiftUI

struct PostHistroyView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var slideBarLocation: Int = 1
    @State var reviewCount: Int = 0
    @StateObject private var postviewModel = PostViewModel()
    
    
    var body: some View {
        VStack{
            Divider()
            //중간 탭 바
            HStack(alignment: .firstTextBaseline){
                
                Button(action: {
                    slideBarLocation = 1
                }, label: {
                    VStack{
                        Text("작성한 후기").font(.pretendard(.medium, size: 18)).foregroundColor(slideBarLocation == 1 ? .black: Color(UIColor(red: 0.67, green: 0.67, blue: 0.67, alpha: 1))
                        )
                        Rectangle().frame(width: 88, height: 4).foregroundColor(slideBarLocation == 1 ? Color("BackgroundBlue") : .white)
                    }
                }).padding(.trailing, 28).padding(.leading, 30)
                
                
                Button(action: {slideBarLocation = 2}, label: {
                    VStack{
                        Text("작성한 글").font(.pretendard(.medium, size: 18)).foregroundColor(slideBarLocation == 2 ? .black : Color(UIColor(red: 0.67, green: 0.67, blue: 0.67, alpha: 1)))
                        Rectangle().frame(width: 80, height: 4).foregroundColor(slideBarLocation == 2 ? Color("BackgroundBlue") : .white)
                    }
                })
                
                Spacer()
            }.padding(.top, 35).frame(height: 60)
            
            if(slideBarLocation == 1){
                if(reviewCount == 0){
                    Spacer()
                    BlankView(text: "아직 작성한 후기가 없어요.")
                    Spacer()
                }else{
                    ScrollView {
                        LazyVStack {
                            ForEach(Array(postviewModel.posts.enumerated()), id: \.element.id) { index, post in
                                NavigationLink(destination: PostDetailView(postviewModel: postviewModel, index: index)) {
                                    VStack {
                                        PostCell(postviewModel: postviewModel, index: index)
                                        Image("Line")
                                    }
                                }
                            }
                        }
                    }
                }
            }else{
                if(postviewModel.posts.count == 0){
                    Spacer()
                    BlankView(text: "아직 작성한 글이 없어요.")
                    Spacer()
                }else{
                    ScrollView {
                        LazyVStack {
                            ForEach(Array(postviewModel.posts.enumerated()), id: \.element.id) { index, post in
                                NavigationLink(destination: PostDetailView(postviewModel: postviewModel, index: index)) {
                                    VStack {
                                        PostCell(postviewModel: postviewModel, index: index)
                                        Image("Line")
                                    }
                                }
                            }
                        }
                    }
                }
            }

        }.navigationBarTitle("", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("작성 내역")
                        .font(.custom("Pretendard-Medium", size: 20))
                }
                
            }
        
            
    }
}

struct PostHistroyView_Previews: PreviewProvider {
    static var previews: some View {
        PostHistroyView()
    }
}
