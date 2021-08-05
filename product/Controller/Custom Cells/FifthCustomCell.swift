//
//  FifthCustomCell.swift
//  product
//
//  Created by Mohamed Samaha on 14/05/2021.
//

import UIKit

class FifthCustomCell: UITableViewCell {

    @IBOutlet weak var sugarLabel: UILabel!
    @IBOutlet weak var sugarsValueLabel: UILabel!
    @IBOutlet weak var sugarView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        sugarView.layer.cornerRadius = 12
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
