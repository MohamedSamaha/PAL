//
//  HomeViewController.swift
//  product
//
//  Created by Mohamed Samaha on 07/07/2021.
//

import UIKit
import CoreML
import Vision
import RealmSwift
import FirebaseDatabase
import Firebase

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var highCal: UIButton!
    @IBOutlet weak var dietButton: UIButton!
    @IBOutlet weak var sugar: UIButton!
    @IBOutlet weak var protein: UIButton!
    @IBOutlet weak var salt: UIButton!
    @IBOutlet weak var soda: UIButton!
    @IBOutlet weak var labelView: UILabel!
    
    var riskForChocolateAllergy: String?
    var riskForMilkAllergy: String?
    var riskForHeartDisease: String?
    var riskForCDiabetes: String?
    var riskForObesity: String?
    var riskForHeartDiet: String?
    var riskForValues: String?
    let image = ["kitkatt", "4", "5", "3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialization code
        
        loadUsernameData()
        
        highCal.layer.cornerRadius = 8
        dietButton.layer.cornerRadius = 8
        sugar.layer.cornerRadius = 8
        protein.layer.cornerRadius = 8
        salt.layer.cornerRadius = 8
        soda.layer.cornerRadius = 8
        
    }
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCollectionViewCell
                
                cell.categoryImage?.image = UIImage(named: image[indexPath.row])
                
                return cell
               
        
    }
    
    //MARK: - retriving username data from realtime data to the label view to display it
    
    func loadUsernameData() {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        Database.database().reference().child("users").child(uid).child("username").observeSingleEvent(of: .value) { (snapshot) in
            guard let username = snapshot.value as? String else {return}
            self.labelView.text = "Welcome \(username)"
            
            UIView.animateKeyframes(withDuration: 0.5, delay: 0.1, animations: {
                self.labelView.alpha = 1
            })
        }
            print("sccsuflly signed in")
        
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "goToProduct" {
//            let destinationVC = segue.destination as! ProductTableViewController
//            destinationVC.productNameValue = productName
//
//        }
         if segue.identifier == "HomeToView" {
            let destinationVC = segue.destination as! ViewController
            destinationVC.riskForChocolateAllergy = riskForChocolateAllergy
            destinationVC.riskForMilkAllergy = riskForMilkAllergy
            destinationVC.riskForHeartDisease = riskForHeartDisease
            destinationVC.riskForDiabetes = riskForCDiabetes
            destinationVC.riskForObesity = riskForObesity
            destinationVC.riskForHeartDiet = riskForHeartDiet
            destinationVC.riskForValues = riskForValues
        }
        
    }
    
    //MARK: - LogOut Button
        
            
        @IBAction func logOutButton(_ sender: UIBarButtonItem) {
                
            do {
              try Auth.auth().signOut()
                
                navigationController?.popToRootViewController(animated: true)
                
            } catch let signOutError as NSError {
              print ("Error signing out: %@", signOutError)
            }
              
            }

  
}
