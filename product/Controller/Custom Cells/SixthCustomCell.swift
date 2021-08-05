//
//  SixthCustomCell.swift
//  product
//
//  Created by Mohamed Samaha on 14/05/2021.
//

import UIKit

class SixthCustomCell: UITableViewCell {

    @IBOutlet weak var totalFatLabel: UILabel!
    @IBOutlet weak var totalFatValueLabel: UILabel!
    @IBOutlet weak var totalfatView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        totalfatView.layer.cornerRadius = 12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
