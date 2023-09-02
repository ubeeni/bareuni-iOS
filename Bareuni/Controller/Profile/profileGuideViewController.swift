//
//  profileGuideViewController.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/07/24.
//

import UIKit

class profileGuideViewController: UIViewController {
    var signUpData: SignUpRequest?

    override func viewDidLoad() {
        super.viewDidLoad()

        nextBtn.layer.cornerRadius = 12
        self.setBackBtn()
    }
    
    @IBOutlet weak var nextBtn: UIButton!
    
    
    @IBAction func nextBtnDidTap(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "NicknameSettingViewController") as? NicknameSettingViewController
        nextVC!.signUpData = signUpData
        self.navigationController?.pushViewController(nextVC!, animated: true)
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
