//
//  DietViewController.swift
//  product
//
//  Created by Mohamed Samaha on 09/07/2021.
//

import UIKit

class DietViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var uiView: UIView!
    let diet = ["209478", "7up-diet","63886", "432665","green tea", "I052673","pepsiDiet", "stirred-yogurt-plain-lf","laughing-cow-creamy-swiss-md", "44","71zeUChsT9L._SL1500_"]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return diet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DietCell", for: indexPath) as! DietCollectionViewCell
        
        cell.imageView?.image = UIImage(named: diet[indexPath.row])

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
