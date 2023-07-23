//
//  loginSelectionViewController.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/07/13.
//

import UIKit

class loginSelectionViewController: UIViewController {
    
    let screenWidth = UIScreen.main.bounds.size.width

    override func viewDidLoad() {
        super.viewDidLoad()

        //버튼 속성 설정
        kakaoSignupBtn.setTitleColor(UIColor(red: 0.142, green: 0.142, blue: 0.142, alpha: 1), for: .normal)
        kakaoSignupBtn.backgroundColor = UIColor(red: 0.98, green: 0.902, blue: 0.298, alpha: 1)
        kakaoSignupBtn.layer.cornerRadius = 12
        
        appleSignupBtn.layer.cornerRadius = 12
        
        emailSignupBtn.setTitleColor(UIColor(red: 0.183, green: 0.183, blue: 0.183, alpha: 1), for: .normal)
        emailSignupBtn.backgroundColor = UIColor(red: 0.931, green: 0.931, blue: 0.931, alpha: 1)
        emailSignupBtn.layer.cornerRadius = 12
        
        signupLbLeadingConst.constant = screenWidth/2 - 72
        
        self.setBackBtn()
    }
    
    @IBOutlet weak var kakaoSignupBtn: UIButton!
    @IBOutlet weak var appleSignupBtn: UIButton!
    @IBOutlet weak var emailSignupBtn: UIButton!
    
    @IBOutlet weak var signupLbLeadingConst: NSLayoutConstraint!
    
}

extension UIViewController {
    func setBackBtn(){
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)
    }
}
