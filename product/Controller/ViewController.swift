//
//  ViewController.swift
//  whatproduct
//
//  Created by Mohamed Samaha on 02/05/2021.
//

import UIKit
import CoreML
import Vision
import RealmSwift
import FirebaseDatabase
import Firebase

class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    

    @IBOutlet weak var productNameView: UIView!
    @IBOutlet weak var poductLabelPressedOutlet: UIButton!
    @IBOutlet weak var cameraButton: UIButton!

    @IBOutlet weak var secondCamera: UIButton!
    @IBOutlet weak var secondClickLabel: UILabel!
    @IBOutlet weak var secondLine: UITextField!
    @IBOutlet weak var clickLabel: UILabel!
    
    var productName = "nil"
    var riskForChocolateAllergy: String?
    var riskForMilkAllergy: String?
    var riskForHeartDisease: String?
    var riskForDiabetes: String?
    var riskForObesity: String?
    var riskForHeartDiet: String?
    var riskForValues: String?
    

    @IBOutlet weak var productNameLabel: UILabel!
    let imagePicker = UIImagePickerController()
    @IBOutlet weak var imageView: UIImageView!
    
    
    //MARK: - retriving riskFor data from realtime data to the label view to display it
    func loadUserriskForData() {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        Database.database().reference().child("users").child(uid).child("riskFor").observeSingleEvent(of: .value) { (snapshot) in
            guard let riskForDisease = snapshot.value as? String else {return}
            
            self.riskForValues = riskForDisease
            UIView.animateKeyframes(withDuration: 0.5, delay: 0.1, animations: {
                
            })
        }
            print("sccsuflly signed in")
        
        }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productNameView.isHidden = true
        secondClickLabel.isHidden = true
        secondLine.isHidden = true
        poductLabelPressedOutlet.isHidden = true
        secondCamera.isHidden = true
        productNameLabel.isHidden = true
        
        productNameView.layer.cornerRadius = 12
        
        poductLabelPressedOutlet.layer.cornerRadius = 12
        poductLabelPressedOutlet.addTarget(self, action: #selector (poductLabelPressed), for: .touchUpInside)
        
        loadUserriskForData()
        
        
        
        navigationItem.hidesBackButton = true
        
        cameraButton.layer.cornerRadius = cameraButton.frame.size.width/2
        cameraButton.layer.borderColor = UIColor.white.cgColor
        cameraButton.layer.borderWidth = 6.0
        
//        authrnticationUser()
        
        // Do any additional setup after loading the view.
        
        // UIView controller camera picker delegate
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
    }
    
//    //MARK: - Handle Alert Controller
//
//    @objc func handleLogOut() {
//
//        let alertController = UIAlertController(title: nil, message: "Are you sure you want to sign out?", preferredStyle: .actionSheet)
//        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in self.logOut()
//
//        }))
//        present(alertController, animated: true, completion: nil)
//    }
//
//    //MARK: - API
//
//    func authrnticationUser () {
//
//        if Auth.auth().currentUser == nil {
//            DispatchQueue.main.async {
//                let navController = UINavigationController(rootViewController: LoginViewController())
//                navController.navigationBar.barStyle = .black
//                self.present(navController, animated: true, completion: nil)
//            }
//
//        } else {
//
//            configureViewComponents()
//        }
//    }
//
//    //MARK: - Helper Function
//
//    func configureViewComponents() {
//        view.backgroundColor = UIColor.white
//
//        navigationItem.title = "PAL Login"
////        navigationItem.leftBarButtonItem = UIBarButtonItem(action: #selector(logOutButton))
//        navigationItem.leftBarButtonItem?.tintColor = .blue
//
//    }
    
    //MARK: - UIView controller camera picker delegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if  let userPickerImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            
            guard let ciimage = CIImage(image: userPickerImage) else {
                fatalError("we couldn't convert ui image into CIImage")
            }
            detect(image: ciimage)
            imageView.image = userPickerImage
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
        
        poductLabelPressedOutlet.isHidden = false
        productNameLabel.isHidden = false
        secondCamera.isHidden = false
        secondLine.isHidden = false
        secondClickLabel.isHidden = false
        clickLabel.isHidden = true
        productNameView.isHidden = false

        
    }
    
    //MARK: - to read the .mlmodel classifer model
    
    func detect(image: CIImage) {
        
        guard let model = try? VNCoreMLModel(for: MyProductImageClassifier(configuration: .init()).model) else {
            fatalError("cannoy import model")
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            let classification = request.results?.first as? VNClassificationObservation
            
            self.navigationItem.title = classification?.identifier.capitalized
            
            self.productNameLabel?.text = "The Product :  \(classification?.identifier.capitalized ?? "Not Found")"
            self.poductLabelPressedOutlet.setTitle("\(classification?.identifier.capitalized ?? "Not Found") Nutrition & Healthiness", for: .normal)
            
            self.productName = (classification?.identifier.capitalized)!
            
            
        }
        let handler = VNImageRequestHandler(ciImage: image)
        
        do{
            try handler.perform([request])
        } catch{
            print(error)
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
    
    
    
    
    //MARK: - poduct Label Pressed Button
    
    @IBAction func poductLabelPressed(_ sender: UIButton) {
        
                performSegue(withIdentifier: "ProductIdentifier", sender: self)
        
                let rootVC = ProductTableViewController()
                let navVC = UINavigationController(rootViewController: rootVC)
                
                present(navVC, animated: true)
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "goToProduct" {
//            let destinationVC = segue.destination as! ProductTableViewController
//            destinationVC.productNameValue = productName
//
//        }
         if segue.identifier == "ProductIdentifier" {
            let destinationVC = segue.destination as! ProductTableViewController
            destinationVC.productNameValue = productName
            destinationVC.riskForChocolateAllergy = riskForChocolateAllergy
            destinationVC.riskForMilkAllergy = riskForMilkAllergy
            destinationVC.riskForHeartDisease = riskForHeartDisease
            destinationVC.riskForDiabetes = riskForDiabetes
            destinationVC.riskForObesity = riskForObesity
            destinationVC.riskForHeartDiet = riskForHeartDiet
            destinationVC.riskForValues = riskForValues
        }
        
    }
    
    @IBAction func secondCamera(_ sender: Any) {
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func cameraButton(_ sender: UIButton) {
        
        present(imagePicker, animated: true, completion: nil)
    }}
    





