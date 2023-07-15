//
//  CategoryViewController.swift
//  Bareuni
//
//  Created by 정슬기 on 2023/07/15.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var ChatButton: UIButton! //'자유수다'버튼
    @IBOutlet weak var FAQButton: UIButton! //'자주 물어보는 질문'버튼
    @IBOutlet weak var CategoryStackView: UIStackView! //'자유수다','자주 물어보는 질문' 버튼 스택뷰
    
    var CategoryViewControllers : [UIViewController] = []
    var tapButtons : [UIButton] = []
    var prevIndex : Int = 0
    var selectedIndex : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CategoryViewControllers = [
            UIStoryboard(name: "Community", bundle: nil).instantiateViewController(withIdentifier: "ChatViewController"),
            UIStoryboard(name: "Community", bundle: nil).instantiateViewController(withIdentifier: "FAQViewController")
        ]
        tapButtons = [ChatButton, FAQButton]
    }
    
    @IBAction func buttonTouchUpInside(_ sender : UIButton) {
        prevIndex = selectedIndex
        selectedIndex = sender.tag
        
        tapButtons[prevIndex].isSelected = false
    }

}
