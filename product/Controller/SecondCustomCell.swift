//
//  SecondCustomCell.swift
//  product
//
//  Created by Mohamed Samaha on 12/05/2021.
//

import UIKit

class SecondCustomCell: UITableViewCell {

    @IBOutlet weak var CaloriesLabel: UILabel!
    @IBOutlet weak var CaloriesValueLabel: UILabel!
    @IBOutlet weak var calView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        calView.layer.cornerRadius = 12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
