//
//  CommunityViewController.swift
//  Bareuni
//
//  Created by 정슬기 on 2023/07/10.
//

import Foundation
import UIKit

class CommunityViewController: UIViewController {

    @IBOutlet weak var HomeChatView: UIView! //'자유수다' UIView
    @IBOutlet weak var HomeFAQView: UIView! //'FAQ' UIView
    
    @IBAction func HomeChatButton(_ sender: UIButton) {
    }
    
    @IBAction func HomeFAQButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // '자유수다' UIView
        HomeChatView?.layer.cornerRadius = 10 //테두리 곡률
        HomeChatView?.layer.borderWidth = 0.5 //테두리 두께
        HomeChatView?.layer.borderColor = UIColor(red: 0.762, green: 0.762, blue: 0.762, alpha: 1).cgColor //테두리 컬러
        // 'FAQ' UIView
        HomeFAQView?.layer.cornerRadius = 10 //테두리 곡률
        HomeFAQView?.layer.borderWidth = 0.5 //테두리 두께
        HomeFAQView?.layer.borderColor = UIColor(red: 0.762, green: 0.762, blue: 0.762, alpha: 1).cgColor //테두리 컬러
       
    }


}
