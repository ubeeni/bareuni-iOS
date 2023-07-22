//
//  CommunityTableViewCell.swift
//  Bareuni
//
//  Created by 김유빈 on 2023/07/20.
//

import UIKit

class CommunityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellRating: UILabel!
    @IBOutlet weak var cellContents: UILabel!
    @IBOutlet weak var cellTag: UILabel!
    @IBOutlet weak var cellTime: UILabel!
    
    @IBOutlet weak var CommunityView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
