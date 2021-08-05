//
//  SugarViewController.swift
//  product
//
//  Created by Mohamed Samaha on 09/07/2021.
//

import UIKit

class SugarViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var uiView: UIView!
    let image = ["34g", "22.77g","23g", "28.7g","30g", "32g","34g", "39.8g","47g", "52g","53.19g", "56.3g","62.84g", "66g","68.8g", "73g"]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SugarCell", for: indexPath) as! SugarCollectionViewCell
        
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
