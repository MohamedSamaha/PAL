//
//  EighthCustomCell.swift
//  product
//
//  Created by Mohamed Samaha on 14/05/2021.
//

import UIKit

class EighthCustomCell: UITableViewCell {

    @IBOutlet weak var riskForLabel: UILabel!
    @IBOutlet weak var halalView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        halalView.layer.cornerRadius = 12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
