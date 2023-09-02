//
//  DetailedProfileSettingViewController.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/07/24.
//

import UIKit

class DetailedProfileSettingViewController: UIViewController {
    
    var signUpData: SignUpRequest?
    var sexBtnArr: [UIButton] = []
    var ageBtnArr: [UIButton] = []
    var toothBtnArr: [UIButton] = []
    var gender: String?
    var age: Int?
    var ortho: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setBackBtn()
        nextBtn.changeDisabledState()
        nextBtn.layer.cornerRadius = 12
        
        sexBtnArr = [womanBtn, manBtn]
        ageBtnArr = [age1Btn, age2Btn, age3Btn, age4Btn, age5Btn, age6Btn]
        toothBtnArr = [yesBtn, noBtn]
        
        setBtnDefaultBorder(manBtn); setBtnDefaultBorder(womanBtn); setBtnDefaultBorder(age1Btn); setBtnDefaultBorder(age2Btn); setBtnDefaultBorder(age3Btn); setBtnDefaultBorder(age4Btn); setBtnDefaultBorder(age5Btn); setBtnDefaultBorder(age6Btn)
        
        setBtnDefaultBorder(yesBtn); setBtnDefaultBorder(noBtn)
    }
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var manBtn: UIButton!
    @IBOutlet weak var womanBtn: UIButton!
    var isSexOneSelected: Bool {
        return manBtn.isSelected || womanBtn.isSelected
    }
    
    @IBOutlet weak var age1Btn: UIButton!
    @IBOutlet weak var age2Btn: UIButton!
    @IBOutlet weak var age3Btn: UIButton!
    @IBOutlet weak var age4Btn: UIButton!
    @IBOutlet weak var age5Btn: UIButton!
    @IBOutlet weak var age6Btn: UIButton!
    var isAgeOneSelected: Bool {
        return age1Btn.isSelected || age2Btn.isSelected || age3Btn.isSelected || age4Btn.isSelected || age5Btn.isSelected || age6Btn.isSelected
    }
    
    
    
    @IBOutlet weak var yesBtn: UIButton!
    @IBOutlet weak var noBtn: UIButton!
    var isToothOneSelected: Bool {
        return yesBtn.isSelected || noBtn.isSelected
    }
    
    @IBAction func manBtnDidTap(_ sender: UIButton) {
        gender = "MALE"
        setSexBtnSelected(sender, sender.isSelected)
    }
    @IBAction func womanBtnDidTap(_ sender: UIButton) {
        gender = "FEMALE"
        setSexBtnSelected(sender, sender.isSelected)
    }
    func setSexBtnSelected(_ clickedButton: UIButton, _ isSelected: Bool){ // 성별 버튼 처리 이벤트 함수
        if(isSexOneSelected == false){
            clickedButton.isSelected = true
            setBtnSelected(clickedButton)
        }else{
            for i in sexBtnArr{
                i.isSelected = false
                setBtnDefaultBorder(i)
            }
            if(isSelected == false){
                clickedButton.isSelected = true
                setBtnSelected(clickedButton)
            }else{
                setBtnDefaultBorder(clickedButton)
            }
        }
        isConfirmBtnEnabled()
    }
    
    @IBAction func age10BtnDidTap(_ sender: UIButton) {
        age = 10
        setAgeBtnSelected(sender, sender.isSelected)
    }
    @IBAction func age20BtnDidTap(_ sender: UIButton) {
        age = 20
        setAgeBtnSelected(sender, sender.isSelected)
    }
    
    @IBAction func age30BtnDidTap(_ sender: UIButton) {
        age = 30
        setAgeBtnSelected(sender, sender.isSelected)
    }
    @IBAction func age40BtnDidTap(_ sender: UIButton) {
        age = 40
        setAgeBtnSelected(sender, sender.isSelected)
    }
    @IBAction func age50BtnDidTap(_ sender: UIButton) {
        age = 50
        setAgeBtnSelected(sender, sender.isSelected)
    }
    @IBAction func age60BtnDidTap(_ sender: UIButton) {
        age = 60
        setAgeBtnSelected(sender, sender.isSelected)
    }
    
    func setAgeBtnSelected(_ clickedButton: UIButton, _ isSelected: Bool){ // 나이 클릭 이벤트 처리 함수
        if(isAgeOneSelected == false){
            clickedButton.isSelected = true
            setBtnSelected(clickedButton)
        }else{
            for i in ageBtnArr{
                i.isSelected = false
                setBtnDefaultBorder(i)
            }
            if(isSelected == false){
                clickedButton.isSelected = true
                setBtnSelected(clickedButton)
            }else{
                setBtnDefaultBorder(clickedButton)
            }
        }
        isConfirmBtnEnabled()
    }
    
    @IBAction func yesBtnDidTap(_ sender: UIButton) {
        ortho = true
        setToothBtnSelected(sender, sender.isSelected)
    }
    
    @IBAction func noBtnDidTap(_ sender: UIButton) {
        ortho = false
        setToothBtnSelected(sender, sender.isSelected)
    }
    
    func setToothBtnSelected(_ clickedButton: UIButton, _ isSelected: Bool){ // 교정여부 클릭 이벤트 처리 함수
        if(isToothOneSelected == false){
            clickedButton.isSelected = true
            setBtnSelected(clickedButton)
        }else{
            for i in toothBtnArr{
                i.isSelected = false
                setBtnDefaultBorder(i)
            }
            if(isSelected == false){
                clickedButton.isSelected = true
                setBtnSelected(clickedButton)
            }else{
                setBtnDefaultBorder(clickedButton)
            }
        }
        isConfirmBtnEnabled()
    }
    
    
    func setBtnDefaultBorder(_ button: UIButton){
        button.setTitleColor(UIColor(red: 0.729, green: 0.729, blue: 0.729, alpha: 1), for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.837, green: 0.837, blue: 0.837, alpha: 1).cgColor
    }
    
    func setBtnSelected(_ button: UIButton){
        button.setTitleColor(UIColor(red: 1, green: 0.58, blue: 1, alpha: 1), for: .normal)
    }
    func isConfirmBtnEnabled(){
        if isSexOneSelected && isAgeOneSelected && isToothOneSelected {
            nextBtn.changeEnabledState()
        }
        else{
            nextBtn.changeDisabledState()
        }
    }
    @IBAction func confirmBtnDidTap(_ sender: Any) {
        LoginAPI.shared.signUp(photo: signUpData!.file, email: signUpData!.email, password: signUpData!.password, nickname: signUpData!.nickname, gender: gender!, age: age!, ortho: ortho!, reception: signUpData!.reception, completion:{
            result in
            switch result{
            case .success(let result):
                print("success")
                let newViewController = self.storyboard!.instantiateViewController(identifier: "WelcomeProfileViewController")
                self.changeRootViewController(newViewController)
            case .failure(let error):
                print("Error: \(error)")
            }
        })
    }
    
}

