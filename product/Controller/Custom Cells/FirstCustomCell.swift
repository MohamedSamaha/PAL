//
//  CellViewControllerTableViewCell.swift
//  product
//
//  Created by Mohamed Samaha on 11/05/2021.
//

import UIKit

class FirstCustomCell: UITableViewCell {

    
    @IBOutlet weak var labelTable: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var productView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ImageView.layer.cornerRadius = 12
        productView.layer.cornerRadius = 12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
