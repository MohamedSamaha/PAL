//
//  LoginViewController.swift
//  product
//
//  Created by Mohamed Samaha on 23/05/2021.
//

import UIKit
import Firebase


class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginSelector: UIButton!
    @IBOutlet weak var registerSelector: UIButton!
    
    var usersRiskFor: CollectionReference!
    
    var             chocolateAllergy: String?
    var             milkAllergy: String?
    var             heartDisease: String?
    var             diabetes: String?
    var             obesity: String?
    var             diet: String?
//    var             riskForValues: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginSelector.layer.cornerRadius = 8
        loginSelector.layer.masksToBounds = false
        loginSelector.layer.shadowRadius = 2.0
        loginSelector.layer.shadowColor = UIColor.black.cgColor
        
        registerSelector.layer.cornerRadius = 8
        registerSelector.layer.masksToBounds = false
        registerSelector.layer.shadowRadius = 2.0
        registerSelector.layer.shadowColor = UIColor.black.cgColor
        
        emailTextfield.layer.cornerRadius = 8
        emailTextfield.layer.masksToBounds = false
        emailTextfield.layer.shadowRadius = 2.0
        emailTextfield.layer.shadowColor = UIColor.black.cgColor
        
        passwordTextfield.layer.cornerRadius = 8
        passwordTextfield.layer.masksToBounds = false
        passwordTextfield.layer.shadowRadius = 2.0
        passwordTextfield.layer.shadowColor = UIColor.black.cgColor
        
        loginButton.layer.cornerRadius = 8
        loginButton.layer.masksToBounds = false
        loginButton.layer.shadowRadius = 2.0
        loginButton.layer.shadowColor = UIColor.black.cgColor
//        loginButton.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
//        loginButton.layer.shadowOpacity = 1.0
        
////        for retriving data from firestore database
//        usersRiskFor = Firestore.firestore().collection("users")
//
    }
    

    
    //        for retriving data from firestore database
//    override func viewWillAppear(_ animated: Bool) {
//        
//        let user = Auth.auth().currentUser
//        if let user = user {
//          
//          let uid = user.uid
//            print(uid.first!)
//            
//            self.usersRiskFor.getDocuments { (snapshot, error) in
//                if let e = error {
//                    print(e.localizedDescription)
//                } else {
//                    
//                    for document in (snapshot?.documents)! {
//                        let data = document.data()
//                            let riskForValue = data["riskFor"] as? String
//                            print(riskForValue!)
//                            
//                            self.riskForValues = riskForValue
//                            
//                        }
//                    
//                }
//            }
//         }
//    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LoginToChat" {
            let tabCtrl       = segue.destination as! UITabBarController
            let destinationVC = tabCtrl.viewControllers![0] as! HomeViewController // Assuming home view controller is in the first tab,
//            else update the array index to connect with tab bar controller
//            let destinationVC = segue.destination as! HomeViewController
            
            destinationVC.riskForChocolateAllergy =             chocolateAllergy
            destinationVC.riskForMilkAllergy =             milkAllergy
            destinationVC.riskForHeartDisease =             heartDisease
            destinationVC.riskForCDiabetes =             diabetes
            destinationVC.riskForObesity =             obesity
            destinationVC.riskForHeartDiet =             diet
//            destinationVC.riskForValues =             riskForValues
        }
    }
    
    //MARK: - To dismiss the keyboard after typing
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        func logUserIn(withEmail: String, password: String) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {

            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in

                if let e = error {
                    let alert = UIAlertController(title: "\(e.localizedDescription)", message: "Please try again.", preferredStyle: .alert)

                    alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
                    alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

                    self.present(alert, animated: true)

                    print(e.localizedDescription)
                } else {
                    
                    self.performSegue(withIdentifier: "LoginToChat" , sender: self)
                }

            }
        }
        
            
        }
        
        guard let email = emailTextfield.text else {return}
        guard let password = passwordTextfield.text else {return}
        
        
        logUserIn(withEmail: email, password: password)

    }
    
  
    
}

