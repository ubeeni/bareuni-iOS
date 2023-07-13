//
//  loginViewController.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/07/13.
//

import UIKit

class loginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // uiview 설정
        emailTextField.doViewSetting(paddingWidth: 28, cornerRadius: 12)
        pwTextField.doViewSetting(paddingWidth: 28, cornerRadius: 12)
        
        loginSubmitBtn.layer.cornerRadius = 12
        
        findPWBtn.setTitleColor(UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1), for: .normal)
    }
    

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    

    @IBOutlet weak var loginSubmitBtn: UIButton!
    
    @IBOutlet weak var findPWBtn: UIButton!
}

extension UITextField{
    func doViewSetting(paddingWidth: Float, cornerRadius: Float){
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: CGFloat(paddingWidth), height: self.frame.height))
        
        self.leftView = paddingView
        self.leftView?.layer.borderColor = UIColor(red: 0.837, green: 1, blue: 0.837, alpha: 1).cgColor
        self.leftViewMode = ViewMode.always
        
        self.rightView = paddingView
        self.rightView?.backgroundColor = .none
        self.rightView?.layer.borderColor = .none
        self.rightViewMode = ViewMode.always
        
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 1
        
        self.layer.borderColor = UIColor(red: 0.837, green: 0.837, blue: 0.837, alpha: 1).cgColor


    }
}
