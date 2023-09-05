//
//  MyPageViewController.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/08/08.
//

import UIKit
import SwiftUI

class MyPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBSegueAction func addMyPageView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: MyPageMainView())
    }
    
    
//    @IBSegueAction func addCommunityView(_ coder: NSCoder) -> UIViewController? {
//        return UIHostingController(coder: coder, rootView: MyPageMainView())
//    }
}
