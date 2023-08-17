//
//  HiddenTabBarTest.swift
//  Bareuni
//
//  Created by 황인성 on 2023/08/17.
//

import SwiftUI


struct Tab1: View {
    @Binding var isTabBarHidden: Bool

    var body: some View {
        VStack {
            Text("탭 1 화면")
            Button(action: {
                isTabBarHidden.toggle()
            }, label: {
                Text("탭바 숨기기/보이기")
            })
        }
    }
}

struct Tab2: View {
    @Binding var isTabBarHidden: Bool

    var body: some View {
        VStack {
            Text("탭 2 화면")
            Button(action: {
                isTabBarHidden.toggle()
            }, label: {
                Text("탭바 숨기기/보이기")
            })
        }
    }
}

struct Tab3: View {
    @Binding var isTabBarHidden: Bool

    var body: some View {
        VStack {
            Text("탭 3 화면")
            Button(action: {
                isTabBarHidden.toggle()
            }, label: {
                Text("탭바 숨기기/보이기")
            })
        }
    }
}

struct Tab4: View {
    @Binding var isTabBarHidden: Bool

    var body: some View {
        VStack {
            Text("탭 4 화면")
            Button(action: {
                isTabBarHidden.toggle()
            }, label: {
                Text("탭바 숨기기/보이기")
            })
        }
    }
}

struct HiddenTabBarTest: View {
    @State private var isTabBarHidden: Bool = false
    @State private var selectedTabIndex: Int = 0

    

    var body: some View {
        ZStack {
            createTabsView(isTabBarHidden: $isTabBarHidden)
                .opacity(isTabBarHidden ? 0 : 1)

            if isTabBarHidden {
                VStack {
//                    Spacer()
                    Button(action: {
                        isTabBarHidden.toggle()
                    }, label: {
                        Text("탭바 보이기")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    })
                    .padding()
                }
            }
        }
    }
}


struct createTabsView: View {
    
    @Binding var isTabBarHidden: Bool
    @State private var selectedTabIndex: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTabIndex) {
            Tab1(isTabBarHidden: $isTabBarHidden)
                .tabItem {
                    Text("탭 1")
                }
                .tag(0)
            
            Tab2(isTabBarHidden: $isTabBarHidden)
                .tabItem {
                    Text("탭 2")
                }
                .tag(1)
            
            Tab3(isTabBarHidden: $isTabBarHidden)
                .tabItem {
                    Text("탭 3")
                }
                .tag(2)
            
            Tab4(isTabBarHidden: $isTabBarHidden)
                .tabItem {
                    Text("탭 4")
                }
                .tag(3)
        }
    }
}



struct HiddenTabBarTest_Previews: PreviewProvider {
    static var previews: some View {
        HiddenTabBarTest()
    }
}
