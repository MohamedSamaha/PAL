//
//  ProteinCollectionViewCell.swift
//  product
//
//  Created by Mohamed Samaha on 09/07/2021.
//

import UIKit

class ProteinCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var background: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        background.layer.cornerRadius = 12
        imageView.layer.cornerRadius = 12
        
    }

}
