//
//  RegisterViewController.swift
//  product
//
//  Created by Mohamed Samaha on 23/05/2021.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pickerViewTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var loginSelector: UIButton!
    @IBOutlet weak var registerSelector: UIButton!
    

    let diseases = ["Chocolate Allergy","Allergy","Heart Disease","Diabetes","Obesity","Diet"]
    let pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.dataSource = self
        
        usernameTextField?.layer.cornerRadius = 8
        usernameTextField?.layer.masksToBounds = false
        usernameTextField?.layer.shadowRadius = 2.0
        usernameTextField?.layer.shadowColor = UIColor.black.cgColor
        
        pickerViewTextField?.layer.cornerRadius = 8
        pickerViewTextField?.layer.masksToBounds = false
        pickerViewTextField?.layer.shadowRadius = 2.0
        pickerViewTextField?.layer.shadowColor = UIColor.black.cgColor
        pickerViewTextField?.inputView = pickerView
        
        loginSelector?.layer.cornerRadius = 8
        loginSelector?.layer.masksToBounds = false
        loginSelector?.layer.shadowRadius = 2.0
        loginSelector?.layer.shadowColor = UIColor.black.cgColor
        
        registerSelector?.layer.cornerRadius = 8
        registerSelector?.layer.masksToBounds = false
        registerSelector?.layer.shadowRadius = 2.0
        registerSelector?.layer.shadowColor = UIColor.black.cgColor
        
        emailTextfield?.layer.cornerRadius = 8
        emailTextfield?.layer.masksToBounds = false
        emailTextfield?.layer.shadowRadius = 2.0
        emailTextfield?.layer.shadowColor = UIColor.black.cgColor
        
        passwordTextfield?.layer.cornerRadius = 8
        passwordTextfield?.layer.masksToBounds = false
        passwordTextfield?.layer.shadowRadius = 2.0
        passwordTextfield?.layer.shadowColor = UIColor.black.cgColor
        
        nextButton?.layer.cornerRadius = 8
        nextButton?.layer.masksToBounds = false
        nextButton?.layer.shadowRadius = 2.0
        nextButton?.layer.shadowColor = UIColor.black.cgColor
        
        
        print(diseases[1])
        
        
    }
    
    
    //MARK: - Picker View
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return diseases.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return diseases[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerViewTextField.text = diseases[row]
        pickerViewTextField.resignFirstResponder()
    }
    
    //MARK: - To dismiss the keyboard after typing
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        
       
        //MARK: - For user auth saving the user's data in realtime firestore database
        
        func createUser(withEmail: String, password: String, riskFor: String, username : String) {
           
                if let email = emailTextfield.text, let password = passwordTextfield.text {
                    
                    
                    Auth.auth().createUser(withEmail: email, password: password) { result, error in
                        
                        if let e = error {
                            let alert = UIAlertController(title: "\(e.localizedDescription)", message: "Please try again.", preferredStyle: .alert)

                            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
                            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

                            self.present(alert, animated: true)

                            print(e.localizedDescription)
                        } else {
                            guard let uid = result?.user.uid else {return}
                            let values = ["email": email, "riskFor": self.pickerViewTextField?.text, "username": self.usernameTextField.text ] as [String : Any]
                            
                            Database.database().reference().child("users").child(uid).updateChildValues(values, withCompletionBlock:  { (error, ref) in
                                if let e = error {
                                    let alert = UIAlertController(title: "\(e.localizedDescription)", message: "Please try again.", preferredStyle: .alert)

                                    alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
                                    alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

                                    self.present(alert, animated: true)

                                    print(e.localizedDescription)
                            }
                                print("sccsuflly signed in")
                            })
                            
                            self.performSegue(withIdentifier: "RegisterToImageView" , sender: self)
                        }
                      
                    }
                }
                print(pickerViewTextField.text ?? "Please Select a Disease")
            }
        
        guard let username = usernameTextField.text else {return}
        guard let email = emailTextfield.text else {return}
        guard let password = passwordTextfield.text else {return}
        guard let  diseasePicker = pickerViewTextField?.text else {return}
        
        createUser(withEmail: email, password: password, riskFor: diseasePicker, username: username)
            

          
    }
}
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "RegisterToChat" {
//        let destinationVC = segue.destination as! surveyController
//            destinationVC.passwordText = passwordText
//            destinationVC.emailText = emailText
//        }
//    }

