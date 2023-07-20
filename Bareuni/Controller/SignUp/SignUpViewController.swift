//
//  SignUpViewController.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/07/18.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        nicknameTF.doViewSetting(paddingWidth: 28, cornerRadius: 12)
        emailTF.doViewSetting(paddingWidth: 28, cornerRadius: 12)
        
        nextBtn.layer.cornerRadius = 12
        
        self.emailTF.addTarget(self, action: #selector(self.emailTFDidChange(_sender:)), for: .editingChanged)
//        self.nicknameTF.addTarget(self, action: #selector(self.nicknameTFDidChange(_sender:)), for: .editingChanged)
        
        nextBtn.isEnabled = false
    }
    
    
    @IBOutlet weak var nicknameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var emailWarningLb: UILabel!
    @IBOutlet weak var nicknameWarningLb: UILabel!
    
    @objc func emailTFDidChange(_sender: Any) {
        if(self.emailTF.checkEmail() == false){
            emailWarningLb.isHidden = false
            nextBtn.isEnabled = false
        }
        else{
            emailWarningLb.isHidden = true
            nextBtn.backgroundColor = UIColor(named: "BackgroundBlue")
            nextBtn.isEnabled = true
        }
    }
//    @objc func nicknameTFDidChange(_sender: Any) {
//        if(self.nicknameTF.text == ""){
//            nicknameWarningLb.isHidden = false
//        }
//        else{
//            nicknameWarningLb.isHidden = true
//        }
//    }
}
