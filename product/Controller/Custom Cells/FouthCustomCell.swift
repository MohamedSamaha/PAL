//
//  FouthCustomCell.swift
//  product
//
//  Created by Mohamed Samaha on 14/05/2021.
//

import UIKit

class FouthCustomCell: UITableViewCell {

    @IBOutlet weak var sodiumLabel: UILabel!
    @IBOutlet weak var sodiumValueLabel: UILabel!
    @IBOutlet weak var sodiumView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        sodiumView.layer.cornerRadius = 12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
