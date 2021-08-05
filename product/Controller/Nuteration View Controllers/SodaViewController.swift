//
//  SodaViewController.swift
//  product
//
//  Created by Mohamed Samaha on 09/07/2021.
//

import UIKit

class SodaViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var sodaView: UIView!
    let image = ["1-1", "2-1","3-1","4-1", "5-1","6", "7","8", "9","10", "11","12","13","14","15"]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SodaCell", for: indexPath) as! SodaCollectionViewCell
        
        cell.imageView?.image = UIImage(named: image[indexPath.row])

        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        sodaView.layer.cornerRadius = 8
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
