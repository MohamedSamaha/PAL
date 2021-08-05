//
//  HighCalCollectionViewCell.swift
//  product
//
//  Created by Mohamed Samaha on 08/07/2021.
//

import UIKit

class HighCalCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var wallpaper: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        wallpaper.layer.cornerRadius = 12
        imageView.layer.cornerRadius = 12
        
    }
}
