//
//  TabBarController.swift
//  Bareuni
//
//  Created by 김유빈 on 2023/07/08.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = UIColor.black
        tabBar.backgroundColor = UIColor.white
        
        // 탭바 모서리 업데이트
        tabBar.layer.cornerRadius = tabBar.frame.height * 0.5
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        // 탭바 그림자 설정
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 1)
        tabBar.layer.shadowRadius = 2
        tabBar.layer.shadowOpacity = 0.2
    }
}
