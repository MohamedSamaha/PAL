//
//  ProteinViewController.swift
//  product
//
//  Created by Mohamed Samaha on 09/07/2021.
//

import UIKit

class ProteinViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var proteinView: UIView!
    let image = ["10g", "12g","24g", "25g","26.1 g", "7g","13g", "24 g","39.2g", "53.4 g"]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProteinCell", for: indexPath) as! ProteinCollectionViewCell
        
        cell.imageView?.image = UIImage(named: image[indexPath.row])

        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        proteinView.layer.cornerRadius = 8
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
