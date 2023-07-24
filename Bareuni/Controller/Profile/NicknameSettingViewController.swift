//
//  NicknameSettingViewController.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/07/24.
//

import UIKit

class NicknameSettingViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        nextBtn.layer.cornerRadius = 12
        self.setBackBtn()
        
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderWidth = 0.5
        profileImageView.layer.borderColor = UIColor(red: 0.637, green: 0.637, blue: 0.637, alpha: 1).cgColor

        nicknameTextField.doViewSetting(paddingWidth: 28, cornerRadius: 12)
        
        nextBtn.changeDisabledState()
        nextBtn.setTitleColor(UIColor.white, for: .normal)
    }
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nicknameTextField: UITextField!
    
    @IBAction func deleteBtnDidTap(_ sender: UIButton) {
        nicknameTextField.text = ""
    }
    
    
    
    @IBAction func nicknameTextFieldDidChange(_ sender: UITextField) {
        if(nicknameTextField.text!.count > 0 ){
            nextBtn.changeEnabledState()
        }
    }
    
    
    
    
}
