//
//  NicknameSettingViewController.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/07/24.
//

import UIKit

class NicknameSettingViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
        
        self.picker.delegate = self
        self.picker.sourceType = .photoLibrary
        self.picker.modalPresentationStyle = .fullScreen
        
        
    }
    let picker = UIImagePickerController()
    
    @IBAction func profileImgSelectiBtnDidTap(_ sender: Any) {
        self.present(picker, animated: true, completion: nil)
    }
    
    @IBAction func nextBtnDidTap(_ sender: Any) {
        // 데이터 저장
        UserDefaults.standard.set(nicknameTextField.text, forKey: "nickname")
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            self.dismiss(animated: false, completion: {
                
                DispatchQueue.main.async {
                    
                    self.profileImageView.image = image
                    self.profileImageView.layer.cornerRadius = self.profileImageView.frame.width / 2
                    self.profileImageView.contentMode = .scaleToFill
                    self.profileImageView.clipsToBounds = true
                    self.profileImageView.layer.borderWidth = 0.5
                    self.profileImageView.layer.borderColor = UIColor(red: 0.637, green: 0.637, blue: 0.637, alpha: 1).cgColor
                    
                }
                
            })
            
        }
        
    }
}


