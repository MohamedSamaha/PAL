//
//  SaltViewController.swift
//  product
//
//  Created by Mohamed Samaha on 09/07/2021.
//

import UIKit

class SaltViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var uiView: UIView!
    let image = ["18g", "10g-1","2g", "12g-1","13g-1", "16g","18g", "22g","70mg", "170g","190 mg", "200mg"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SaltCell", for: indexPath) as! SaltCollectionViewCell
        
        cell.imageView?.image = UIImage(named: image[indexPath.row])

        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        uiView.layer.cornerRadius = 8
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
