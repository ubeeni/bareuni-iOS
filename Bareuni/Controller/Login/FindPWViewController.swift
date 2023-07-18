//
//  FindPWViewController.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/07/18.
//

import UIKit

class FindPWViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        explainLb.numberOfLines = 2
        explainLb.text = "가입한 이메일 주소를 입력해주세요 \n비밀번호 재설정을 위한 이메일을 보내드리겠습니다 "
        findEmailTF.doViewSetting(paddingWidth: 28, cornerRadius: 12)
        self.findEmailTF.addTarget(self, action: #selector(self.textFieldDidChange(_sender:)), for: .editingChanged)
        
        confirmBtn.backgroundColor = UIColor(red: 0.821, green: 0.821, blue: 0.821, alpha: 1)
        confirmBtn.layer.cornerRadius = 12
        
    }
    

    @IBOutlet weak var explainLb: UILabel!
    @IBOutlet weak var findEmailTF: UITextField!
    @IBOutlet weak var warningLb: UILabel!
    @IBOutlet weak var confirmBtn: UIButton!
    
    @objc func textFieldDidChange(_sender: Any) {
        if(self.findEmailTF.checkEmail() == false){
            explainLb.layer.borderColor = UIColor(red: 1, green: 0.314, blue: 0.314, alpha: 1).cgColor
            
            warningLb.text = "이메일을 확인해주세요."
            warningLb.textColor = UIColor(red: 1, green: 0.314, blue: 0.314, alpha: 1)
            confirmBtn.backgroundColor = UIColor(red: 0.821, green: 0.821, blue: 0.821, alpha: 1)
        }
        else{
            findEmailTF.doViewSetting(paddingWidth: 28, cornerRadius: 12)
            warningLb.text = "대소문자를 구분하여 입력해주세요."
            warningLb.textColor = UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
            confirmBtn.backgroundColor = UIColor(named: "BackgroundBlue")
        }
    }
    
}

extension UITextField {
    public func checkEmail() -> Bool {
        let str =  self.text
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return  NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: str)
    }
}
