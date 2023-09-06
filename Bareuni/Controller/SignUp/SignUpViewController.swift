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
        self.setBackBtn()
        
        emailTF.delegate = self
    }
    
    
    @IBAction func nextBtnDidTap(_ sender: Any) {
        LoginAPI.shared.checkEmail(email: self.emailTF.text!, completion: {result in
            switch result {
            case .success(let result):
                if(result.code == 1000){ // 중복된 이메일
                    print("이메일 중복")
                    self.emailWarningLb.text = "이미 가입된 이메일입니다."
                    self.emailWarningLb.isHidden = false
                    print(result.message)
                    
                }
                else if(result.code == 2018){
                    self.emailWarningLb.isHidden = true
                    print(result.message)
                    let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "EmailAuthViewController") as? EmailAuthViewController
                    nextVC!.email = self.emailTF.text!
                    self.navigationController?.pushViewController(nextVC!, animated: true)
                }
               
                
            case .failure(let error):
                print("Error: \(error)")
            }
        })
    
        UserDefaults.standard.set(emailTF.text, forKey: "email")
    }
    
    @IBOutlet weak var nicknameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var emailWarningLb: UILabel!
    @IBOutlet weak var nicknameWarningLb: UILabel!
    
    @objc func emailTFDidChange(_sender: Any) {
        if(self.emailTF.checkEmailValid() == false){
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
    func isValidEmail(email: String) -> Bool{
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", regex)
        return emailTest.evaluate(with: email)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newLength = (textField.text?.count)! + string.count - range.length
            return !(newLength > 254)
    }
}
