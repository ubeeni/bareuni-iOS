//
//  DentistTableViewCell.swift
//  Bareuni
//
//  Created by 김유빈 on 2023/07/19.
//

import UIKit

class DentistTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellName: UILabel!
    @IBOutlet weak var cellAddress: UILabel!
    @IBOutlet weak var customPhoto: UIImageView!
    @IBOutlet weak var cellNumber: UILabel!
    @IBOutlet weak var cellRating: UILabel!
    
    @IBOutlet weak var DentistView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
