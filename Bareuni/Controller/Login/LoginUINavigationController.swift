//
//  LoginUINavigationController.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/07/18.
//

import UIKit

class LoginUINavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 다른 UIViewController를 인스턴스화
            let secondViewController = loginSelectionViewController() // SecondViewController는 여러분의 뷰 컨트롤러 클래스명입니다.
            
            // present 메서드를 사용하여 두 번째 뷰 컨트롤러를 표시
        self.present(secondViewController, animated: true, completion: nil)
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
