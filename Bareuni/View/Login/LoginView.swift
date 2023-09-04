//
//  LoginView.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/09/04.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        SignUpView()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct SignUpView : UIViewControllerRepresentable {
    
    typealias UIViewControllerType = loginSelectionViewController
    
    // MARK: UIViewController를 생성합니다.
    func makeUIViewController(context: Context) -> UIViewControllerType {
        let viewcontroller = loginSelectionViewController()
        return viewcontroller    // MARK: ScreenShareViewController의 UIViewController를 호출합니다.
    }
    
    // MARK: UIViewController를 변경하였을때 수행합니다.
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        //
    }
}
