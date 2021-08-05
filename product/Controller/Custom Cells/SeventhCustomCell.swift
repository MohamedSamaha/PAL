//
//  SeventhCustomCell.swift
//  product
//
//  Created by Mohamed Samaha on 14/05/2021.
//

import UIKit

class SeventhCustomCell: UITableViewCell {

    @IBOutlet weak var arabCountriesLabel: UILabel!
    @IBOutlet weak var arabCountriesView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        arabCountriesView.layer.cornerRadius = 12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
