//
//  WelcomeProfileViewController.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/07/31.
//

import UIKit

class WelcomeProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = UserDefaults.standard.object(forKey: "nickname") as! String + "님, 환영해요"
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
          super.viewDidAppear(animated)
        
       
        let tabbar = UIStoryboard.init(name: "Main", bundle: nil)
                guard let tabBarController = tabbar.instantiateViewController(withIdentifier: "TabBarController")as? TabBarController else {return}
                
                tabBarController.modalPresentationStyle = .fullScreen
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
          // 1초 후 실행될 부분
            self.present(tabBarController, animated: true, completion: nil)
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
