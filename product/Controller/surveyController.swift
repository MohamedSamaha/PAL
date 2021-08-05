//
//  surveyController.swift
//  product
//
//  Created by Mohamed Samaha on 20/05/2021.
//

import UIKit
import Firebase

//class surveyController: UIViewController {
//
//    @IBOutlet weak var chocolateAllergyButton: UIButton!
//    @IBOutlet weak var milkAllergyButton: UIButton!
//    @IBOutlet weak var heartDiseaserButton: UIButton!
//    @IBOutlet weak var diabetesButton: UIButton!
//    @IBOutlet weak var obesityButton: UIButton!
//    @IBOutlet weak var dietButton: UIButton!
//
//    var             chocolateAllergy: String?
//    var             milkAllergy: String?
//    var             heartDisease: String?
//    var             diabetes: String?
//    var             obesity: String?
//    var             diet: String?
//
//
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//
//
//    }
//
//    @IBAction func chocolateAllergyButton(_ sender: UIButton) {
//        if sender.isSelected {
//            sender.isSelected = false
//        } else {
//            sender.isSelected = true
//
//                        chocolateAllergy = "Chocolate Allergy"  // that value should be the same of the riskfor value data in terms of captlization
//            print(            chocolateAllergy!)
//        }
//    }
//
//    @IBAction func milkAllergyButton(_ sender: UIButton) {
//        if sender.isSelected {
//            sender.isSelected = false
//        } else {
//            sender.isSelected = true
//                        milkAllergy = "allergy" // that value should be the same of the riskfor value data in terms of captlization
//            print(            milkAllergy!)
//
//        }
//    }
//
//    @IBAction func heartDiseaserButton(_ sender: UIButton) {
//        if sender.isSelected {
//            sender.isSelected = false
//        } else {
//            sender.isSelected = true
//                        heartDisease = "Heart Disease"  // that value should be the same of the riskfor value data in terms of captlization
//            print(            heartDisease!)
//
//        }
//    }
//
//    @IBAction func diabetesButton(_ sender: UIButton) {
//        if sender.isSelected {
//            sender.isSelected = false
//        } else {
//            sender.isSelected = true
//                        diabetes = "diabetes"  // that value should be the same of the riskfor value data in terms of captlization
//            print(            diabetes!)
//
//        }
//    }
//
//    @IBAction func obesityButton(_ sender: UIButton) {
//        if sender.isSelected {
//            sender.isSelected = false
//        } else {
//            sender.isSelected = true
//                        obesity = "Obesity"  // that value should be the same of the riskfor value data in terms of captlization
//            print(            obesity!)
//
//        }
//    }
//    @IBAction func dietButton(_ sender: UIButton) {
//        if sender.isSelected {
//            sender.isSelected = false
//        } else {
//            sender.isSelected = true
//                        diet = "Diet"  // that value should be the same of the riskfor value data in terms of captlization
//            print(            diet!)
//
//        }
//    }
//
    
//    @IBAction func navButton(_ sender: UIBarButtonItem) {
//        self.performSegue(withIdentifier: "goToProduct", sender: self)
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "goToProduct" {
//        let destinationVC = segue.destination as! LoginViewController
//            destinationVC.chocolateAllergy =             chocolateAllergy
//            destinationVC.milkAllergy =             milkAllergy
//            destinationVC.heartDisease =             heartDisease
//            destinationVC.diabetes =             diabetes
//            destinationVC.obesity =             obesity
//            destinationVC.diet =             diet
//        }
//    }
    
//    @IBAction func riskFor(_ sender: UIButton) {
        
//        func createUser(withEmail: String, password: String, riskFor: UIButton) {
//
//
//            if let email = emailText, let password = passwordText {
//                createUser(withEmail: email, password: password, riskFor: milkAllergyButton)
//                Auth.auth().createUser(withEmail: email, password: password) { result, error in
//                            if let e = error {
//                                print(e.localizedDescription)
//                            }
//
//
//                                guard let uid = result?.user.uid else {return}
//                                let values = ["riskFor":self.riskFor(self.milkAllergyButton)]
//
//                                Database.database().reference().child("users").child(uid).updateChildValues(values, withCompletionBlock:  { (error, ref) in
//                                    if let e = error {
//                                        print(e.localizedDescription)
//                                }
//                                    print("sccsuflly signed in")
//                                })
//                }
//
//            }
//        }
                                // Firestore DataBase to store the riskFor and link it to user auth
                                
//                                if self.chocolateAllergyButton.isSelected {
//                                let db = Firestore.firestore()
//                                    db.collection("users").addDocument(data: ["riskFor" : self.chocolateAllergy ?? "nil"]) { (error) in
//                                    if let e = error {
//                                        print(e.localizedDescription)
//
//                                }
//
//                                self.performSegue(withIdentifier: "goToProduct", sender: self)
//                            }
//                        }
//
//                                else if self.milkAllergyButton.isSelected {
//                                let db = Firestore.firestore()
//                                db.collection("users").addDocument(data: ["riskFor" : self.milkAllergy ?? "nil"]) { (error) in
//                                    if let e = error {
//                                        print(e.localizedDescription)
//
//                                }
//
//                                self.performSegue(withIdentifier: "goToProduct", sender: self)
//                            }
//
//                        }
//
//
//                                else if self.heartDiseaserButton.isSelected {
//                                let db = Firestore.firestore()
//                                db.collection("users").addDocument(data: ["riskFor" : self.heartDisease ?? "nil"]) { (error) in
//                                    if let e = error {
//                                        print(e.localizedDescription)
//                                }
//
//                                self.performSegue(withIdentifier: "goToProduct", sender: self)
//                            }
//                        }
//                                else if self.diabetesButton.isSelected {
//                                let db = Firestore.firestore()
//                                db.collection("users").addDocument(data: ["riskFor" : self.diabetes ?? "nil"]) { (error) in
//                                    if let e = error {
//                                        print(e.localizedDescription)
//                                }
//
//
//                                self.performSegue(withIdentifier: "goToProduct", sender: self)
//                            }
//                        }
//
//                                else if self.obesityButton.isSelected {
//                                let db = Firestore.firestore()
//                                db.collection("users").addDocument(data: ["riskFor" : self.obesity ?? "nil"]) { (error) in
//                                    if let e = error {
//                                        print(e.localizedDescription)
//                                }
//
//                                self.performSegue(withIdentifier: "goToProduct", sender: self)
//                            }
//                        }
//
//                                else if self.dietButton.isSelected {
//                                let db = Firestore.firestore()
//                                db.collection("users").addDocument(data: ["riskFor" : self.diet ?? "nil"]) { (error) in
//                                    if let e = error {
//                                        print(e.localizedDescription)
//                                }
//
//                                self.performSegue(withIdentifier: "goToProduct", sender: self)
//                            }
//                        }
//            }
//        }
//
//

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
        
    

