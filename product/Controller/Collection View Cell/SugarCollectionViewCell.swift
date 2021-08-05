//
//  SugarCollectionViewCell.swift
//  product
//
//  Created by Mohamed Samaha on 09/07/2021.
//

import UIKit

class SugarCollectionViewCell: UICollectionViewCell {
 
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        background.layer.cornerRadius = 12
        imageView.layer.cornerRadius = 12
        
    }
}
