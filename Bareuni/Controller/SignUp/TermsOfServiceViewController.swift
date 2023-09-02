//
//  TermsOfServiceViewController.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/07/22.
//

import UIKit

class TermsOfServiceViewController: UIViewController {
    var signUpData: SignUpRequest?

    override func viewDidLoad() {
        super.viewDidLoad()

        nextBtn.layer.cornerRadius = 12
        nextBtn.changeDisabledState()
        serviceAgreeBtn.backgroundColor = .none
        self.setBackBtn()
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
    
    var isRequired: Bool {
        return serviceAgreeBtn.isSelected && privacyAgreeBtn.isSelected && locationAgreeBtn.isSelected && ageAgreeBtn.isSelected && commerceAgreeBtn.isSelected
    }
    
    @IBAction func allAgreeBtnDidTap(_ sender: UIButton) {
        sender.checkBtnDidTap()
        
        if(sender.isSelected == true){
            serviceAgreeBtn.isSelected = false; privacyAgreeBtn.isSelected = false; locationAgreeBtn.isSelected = false; ageAgreeBtn.isSelected = false;  commerceAgreeBtn.isSelected = false;  serviceMessageAgreeBtn.isSelected = false
            serviceAgreeBtn.checkBtnDidTap()
            privacyAgreeBtn.checkBtnDidTap()
            locationAgreeBtn.checkBtnDidTap()
            ageAgreeBtn.checkBtnDidTap()
            commerceAgreeBtn.checkBtnDidTap()
            serviceMessageAgreeBtn.checkBtnDidTap()
        }
        else{
            serviceAgreeBtn.isSelected = true; privacyAgreeBtn.isSelected = true; locationAgreeBtn.isSelected = true; ageAgreeBtn.isSelected = true;  commerceAgreeBtn.isSelected = true;  serviceMessageAgreeBtn.isSelected = true
            serviceAgreeBtn.checkBtnDidTap()
            privacyAgreeBtn.checkBtnDidTap()
            locationAgreeBtn.checkBtnDidTap()
            ageAgreeBtn.checkBtnDidTap()
            commerceAgreeBtn.checkBtnDidTap()
            serviceMessageAgreeBtn.checkBtnDidTap()
        }
        checkAllRequiredBtn()
        
    }
    
    @IBAction func serviceAgreeBtnDidTap(_ sender: UIButton) {
        sender.checkBtnDidTap()
        checkAllAgreeBtn()
        checkAllRequiredBtn()
    }
    
    @IBAction func privacyAgreeBtnDidTap(_ sender: UIButton) {
        sender.checkBtnDidTap()
        checkAllAgreeBtn()
        checkAllRequiredBtn()
    }
    @IBAction func locationAgreeBtn(_ sender: UIButton) {
        sender.checkBtnDidTap()
        checkAllAgreeBtn()
        checkAllRequiredBtn()
    }
    
    @IBAction func ageAgreeBtnDidTap(_ sender: UIButton) {
        sender.checkBtnDidTap()
        checkAllAgreeBtn()
        checkAllRequiredBtn()
    }
    @IBAction func commerceAgreeBtnDidTap(_ sender: UIButton) {
        sender.checkBtnDidTap()
        checkAllAgreeBtn()
        checkAllRequiredBtn()
    }
    @IBAction func serviceMessageAgreeBtnDidTap(_ sender: UIButton) {
        sender.checkBtnDidTap()
        checkAllAgreeBtn()
        checkAllRequiredBtn()
    }
    func checkAllAgreeBtn(){
        if(isAllSelected == true){
            allAgreeBtn.checkBtnDidTap()
        }else{
            if(allAgreeBtn.isSelected == true ){
                allAgreeBtn.checkBtnDidTap()
            }
        }
    }
    func checkAllRequiredBtn(){
        if(isRequired == true){
            self.nextBtn.changeEnabledState()
        }else{
            self.nextBtn.changeDisabledState()
        }
    }
    
    @IBAction func nextBtnDidTap(_ sender: UIButton) {
        let newStoryboard = UIStoryboard(name: "Profile", bundle: nil)
//        let newViewController = newStoryboard.instantiateViewController(identifier: "ProfileNavigationController")
//        self.changeRootViewController(newViewController)
//
        guard let nextVC = newStoryboard.instantiateViewController(withIdentifier: "profileGuideViewController")
                      as? profileGuideViewController else {
                          return
                  }
        signUpData?.reception = serviceMessageAgreeBtn.isSelected

        nextVC.signUpData = signUpData

                  let nC = UINavigationController(rootViewController: nextVC)
                  self.navigationController?.pushViewController(nextVC, animated: true)
    }
           
    
}

extension UIButton {
    func checkBtnDidTap(){
        if(self.isSelected == true){
            self.isSelected = false
            self.setImage(UIImage(named: "checkNoFill"), for: UIControl.State.normal)
            
        }
        else{
            self.isSelected = true
    
            self.setImage(UIImage(named: "checkFilled"), for: UIControl.State.normal)
        }
    }
}
extension UIViewController{
    // MARK: UIWindow의 rootViewController를 변경하여 화면전환
        func changeRootViewController(_ viewControllerToPresent: UIViewController) {
            if let window = UIApplication.shared.windows.first {
                window.rootViewController = viewControllerToPresent
                UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil)
            } else {
                viewControllerToPresent.modalPresentationStyle = .overFullScreen
                self.present(viewControllerToPresent, animated: true, completion: nil)
            }
        }
}
