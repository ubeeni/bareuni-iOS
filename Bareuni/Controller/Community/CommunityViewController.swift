//
//  CommunityViewController.swift
//  Bareuni
//
//  Created by 김유빈 on 2023/07/24.
//

import UIKit
import SwiftUI

class CommunityViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBSegueAction func addCommunityView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: CommunityMainView())
    }
}
