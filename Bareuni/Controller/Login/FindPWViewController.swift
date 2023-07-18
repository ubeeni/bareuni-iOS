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
        
        confirmBtn.backgroundColor = UIColor(red: 0.821, green: 0.821, blue: 0.821, alpha: 1)
        confirmBtn.layer.cornerRadius = 12
        
    }
    

    @IBOutlet weak var explainLb: UILabel!
    @IBOutlet weak var findEmailTF: UITextField!
    @IBOutlet weak var confirmBtn: UIButton!
}
