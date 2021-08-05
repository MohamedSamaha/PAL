//
//  HighCalViewController.swift
//  product
//
//  Created by Mohamed Samaha on 08/07/2021.
//

import UIKit

class HighCalViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var uiView: UIView!
    
    let images = ["170 cal", "660cal", "630 cal", "884cal","828cal","595 cal","900 cal","100cal","276 cal","588 cal","114Cal","884cal"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        uiView.layer.cornerRadius = 8
        // Do any additional setup after loading the view.
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HighCalCell", for: indexPath) as! HighCalCollectionViewCell
                
                cell.imageView?.image = UIImage(named: images[indexPath.row])
        
        
                
                return cell
               
        
    }

}
