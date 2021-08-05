//
//  CategoryCollectionViewCell.swift
//  product
//
//  Created by Mohamed Samaha on 08/07/2021.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var background: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        background.layer.cornerRadius = 12
        categoryImage.layer.cornerRadius = 12
        
    }
    
    
}
