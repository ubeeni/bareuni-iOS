//
//  EmailAuthViewController.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/07/20.
//

import UIKit

class EmailAuthViewController: UIViewController, UITextFieldDelegate {
    var email: String = ""
    var authCode: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        authCodeTF.doViewSetting(paddingWidth: 28, cornerRadius: 12)
        nextBtn.layer.cornerRadius = 12
        nextBtn.isEnabled = false
        authCodeTF.delegate = self
        self.setBackBtn()
        
        LoginAPI.shared.verifyEmail(email: email, completion: {result in
            switch result {
            case .success(let result):
                if(result.code == 1000){
                    self.authCode = result.result!
                }else if(result.code == 2016){
                    print(result.message)
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        })

    }
    
    override func viewDidAppear(_ animated: Bool) {
        setTimer()
    }
    @IBOutlet weak var timerLb: UILabel!
    @IBOutlet weak var authCodeTF: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var warngingLb: UILabel!
    
    var countDownTime: Int = 180
    var timer: Timer?
    
    func setTimer(){
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.countDownTime = self.countDownTime - 1
            
            let minute =  self.countDownTime / 60
            let second =  self.countDownTime % 60
            self.timerLb.text = "\(minute):\(String(format: "%02d", second))"
            
            if  self.countDownTime <= 0 {
                timer.invalidate()
                DispatchQueue.main.async {
                    self.nextBtn.isEnabled = false
                    self.nextBtn.backgroundColor = UIColor(named: "disabledBtnColor")
                }
            }
        }
    }
    
    @IBAction func codeTextDidChange(_ sender: Any) {

        if(authCodeTF.text!.count == 0){
            self.nextBtn.isEnabled = false
            self.nextBtn.backgroundColor = UIColor(named: "disabledBtnColor")
            
        }
        else{
            nextBtn.isEnabled = true
            self.nextBtn.backgroundColor = UIColor(named: "BackgroundBlue")
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newLength = (textField.text?.count)! + string.count - range.length
            return !(newLength > 10)
    }
    
    @IBAction func reSendBtnDidTap(_ sender: Any) {
        self.timerLb.text = "3:00"
        timer!.invalidate()
        countDownTime = 180
        setTimer()
        LoginAPI.shared.verifyEmail(email: email, completion: {result in
            switch result {
            case .success(let result):
                if(result.code == 1000){
                    self.authCode = result.result!
                }else if(result.code == 2016){
                    print(result.message)
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        })
    }
    
    @IBAction func nextBtnDidTap(_ sender: Any) {
        if(self.countDownTime > 0){
            if(self.authCodeTF.text == authCode){
                self.warngingLb.isHidden = true
                let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ConfirmPWViewController") as? ConfirmPWViewController
                nextVC!.email = email
                self.navigationController?.pushViewController(nextVC!, animated: true)
            }else{
                self.warngingLb.isHidden = false
            }
        }
        else{
            self.warngingLb.text = "제한시간을 초과하셨습니다."
            self.warngingLb.isHidden = false
            
        }
    }
    
}

