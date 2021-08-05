//
//  ThirdCustomCell.swift
//  product
//
//  Created by Mohamed Samaha on 14/05/2021.
//

import UIKit

class ThirdCustomCell: UITableViewCell {

    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var proteinValue: UILabel!
    @IBOutlet weak var proteinView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        proteinView.layer.cornerRadius = 12    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
