//
//  ViewController.swift
//  Bareuni
//
//  Created by 윤지성 on 2023/07/05.
//

import UIKit
import SwiftUI

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBSegueAction func addContentView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: ContentView())
    }
}

