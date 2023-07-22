//
//  TermsOfServiceViewController.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/07/22.
//

import UIKit

class TermsOfServiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        nextBtn.layer.cornerRadius = 12
        nextBtn.changeDisabledState()
    }
    
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var allAgreeBtn: UIButton!
    
    @IBOutlet weak var serviceAgreeBtn: UIButton!
    @IBOutlet weak var privacyAgreeBtn: UIButton!
    @IBOutlet weak var locationAgreeBtn: UIButton!
    @IBOutlet weak var ageAgreeBtn: UIButton!
    @IBOutlet weak var commerceAgreeBtn: UIButton!

    @IBOutlet weak var serviceMessageAgreeBtn: UIButton!
    
    var isAllSelected: Bool {
        return serviceAgreeBtn.isSelected && privacyAgreeBtn.isSelected && locationAgreeBtn.isSelected && ageAgreeBtn.isSelected && commerceAgreeBtn.isSelected && serviceMessageAgreeBtn.isSelected
    }
    
    @IBAction func allAgreeBtnDidTap(_ sender: Any) {
        self.allAgreeBtn.isSelected()
    }
    
}

extension UIButton {
    func isSelected(){
        if(self.isSelected == true){
            self.isSelected = false
            self.setBackgroundImage(UIImage(named: "checkNoFill"), for: .normal)
            print("notselected")
        }
        else{
            self.isSelected = true
            self.setBackgroundImage(UIImage(named: "checkFilled"), for: .normal)
            print("selected")

        }
    }
}
