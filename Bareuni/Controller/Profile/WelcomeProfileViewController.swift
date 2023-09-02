//
//  WelcomeProfileViewController.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/07/31.
//

import UIKit

class WelcomeProfileViewController: UIViewController {
    var signUpData: SignUpRequest?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    override func viewDidAppear(_ animated: Bool) {
          super.viewDidAppear(animated)
        
       
        let newStoryboard = UIStoryboard(name: "Login", bundle: nil)
        let newViewController = newStoryboard.instantiateViewController(identifier: "LoginUINavigationController")

        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
          // 1초 후 실행될 부분
            self.changeRootViewController(newViewController)
        }

       }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
