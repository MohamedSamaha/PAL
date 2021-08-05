//
//  CollectionViewCell.swift
//  product
//
//  Created by Mohamed Samaha on 09/07/2021.
//

import UIKit

class DietCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var wallpaper: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.layer.cornerRadius = 12
        background.layer.cornerRadius = 12
        wallpaper.layer.cornerRadius = 12
    }
}
