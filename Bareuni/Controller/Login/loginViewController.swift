//
//  loginViewController.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/07/13.
//

import UIKit
import KeychainSwift

class loginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // uiview 설정
        emailTextField.doViewSetting(paddingWidth: 28, cornerRadius: 12)
        pwTextField.doViewSetting(paddingWidth: 28, cornerRadius: 12)
        pwTextField.isSecureTextEntry = true
        
        loginSubmitBtn.layer.cornerRadius = 12
        
        findPWBtn.setTitleColor(UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1), for: .normal)
        self.setBackBtn()
    }
    

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    @IBOutlet weak var loginSubmitBtn: UIButton!
    @IBOutlet weak var findPWBtn: UIButton!
    
    @IBOutlet weak var emailWarningLb: UILabel!
    @IBOutlet weak var pwWarningLb: UILabel!
    
    @IBOutlet weak var hideBtn: UIButton!
    
    @IBAction func hideBtnDidTap(_ sender: Any) {
        if(self.pwTextField.isSecureTextEntry == true){
            self.pwTextField.isSecureTextEntry = false
            hideBtn.setImage(UIImage(named: "unhide"), for: .normal)
        }else{
            self.pwTextField.isSecureTextEntry = true
            hideBtn.setImage(UIImage(named: "hide"), for: .normal)

        }
    }
    
    @IBAction func loginBtnDidTap(_ sender: Any) {
        emailWarningLb.isHidden = true
        pwWarningLb.isHidden = true
        
        if(emailTextField.text == ""){
            emailWarningLb.text = "이메일을 입력해주세요."
            emailWarningLb.isHidden = false
        }
        
        else if(pwTextField.text == ""){
            pwWarningLb.text = "비밀번호를 입력해주세요."
            pwWarningLb.isHidden = false
        }else{
            let email: String = "wltjd3459@naver.com"
            let password: String = "@yoon1515"
            LoginAPI.shared.login(email: emailTextField.text!, password: pwTextField.text!, completion: {result in
                switch result {
                case .success(let result):
                    if(result.code == 1000){
                        print("로그인 성공")
                        KeychainSwift().set(result.result![1].token, forKey: "accessToken")
                        KeychainSwift().set(result.result![0].token, forKey: "refreshToken")

                        
                        //메인화면으로 화면전환
                        let tabbar = UIStoryboard.init(name: "Main", bundle: nil)
                        guard let tabBarController = tabbar.instantiateViewController(withIdentifier: "TabBarController")as? TabBarController else {return}
                        
                        tabBarController.modalPresentationStyle = .fullScreen
                        self.present(tabBarController, animated: true, completion: nil)
                    }
                    else if(result.code == 3014){
                        self.pwWarningLb.text = "아이디와 비밀번호를 다시 확인해주세요!"
                        self.pwWarningLb.isHidden = false
                    }
                   
                    
                case .failure(let error):
                    print("Error: \(error)")
                }
            })
        }
        
    }
}


extension UITextField{
    func doViewSetting(paddingWidth: Float, cornerRadius: Float){
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: CGFloat(paddingWidth), height: self.frame.height))
        
        self.leftView = paddingView
        self.leftView?.layer.borderColor = UIColor(red: 0.837, green: 1, blue: 0.837, alpha: 1).cgColor
        self.leftViewMode = ViewMode.always
        
        self.rightView = paddingView
        self.rightView?.backgroundColor = .none
        self.rightView?.layer.borderColor = .none
        self.rightViewMode = ViewMode.always
        
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 1
        
        self.layer.borderColor = UIColor(red: 0.837, green: 0.837, blue: 0.837, alpha: 1).cgColor


    }
}
