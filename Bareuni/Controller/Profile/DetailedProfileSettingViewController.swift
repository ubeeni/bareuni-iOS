//
//  DetailedProfileSettingViewController.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/07/24.
//

import UIKit

class DetailedProfileSettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setBackBtn()
        nextBtn.changeDisabledState()
        nextBtn.layer.cornerRadius = 12
        
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
    var isReplyOneSelected: Bool {
        return yesBtn.isSelected || noBtn.isSelected
    }
    
    @IBAction func manBtnDidTap(_ sender: Any) {
        if isSexOneSelected == false{
            manBtn.isSelected = true
            setBtnSelected(manBtn)
        }
        else{
            manBtn.isSelected = true
            setBtnSelected(manBtn)
            
            womanBtn.isSelected = true
            setBtnDefaultBorder(womanBtn)
        }
    }
    @IBAction func womanBtnDidTap(_ sender: Any) {
        if isSexOneSelected == false{
            womanBtn.isSelected = true
            setBtnSelected(womanBtn)
        }
        else{
            womanBtn.isSelected = true
            setBtnSelected(womanBtn)
            
            manBtn.isSelected = true
            setBtnDefaultBorder(manBtn)
        }
    }
    
    func setBtnDefaultBorder(_ button: UIButton){
        button.setTitleColor(UIColor(red: 0.729, green: 0.729, blue: 0.729, alpha: 1), for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.837, green: 0.837, blue: 0.837, alpha: 1).cgColor
    }
    
    func setBtnSelected(_ button: UIButton){
        button.setTitleColor(UIColor(red: 0, green: 0.58, blue: 1, alpha: 1), for: .normal)
    }
}
