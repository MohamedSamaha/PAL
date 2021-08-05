//
//  WelcomeViewController.swift
//  product
//
//  Created by Mohamed Samaha on 23/05/2021.

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    @IBOutlet weak var titleTwoLabel: CLTypingLabel!
    @IBOutlet weak var loginbtn: UIButton!
    @IBOutlet weak var registerbtn: UIButton!
    
//    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.isNavigationBarHidden = true
//    }
    
    var orientationLock = UIInterfaceOrientationMask.all

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginbtn.layer.cornerRadius = 12
        registerbtn.layer.cornerRadius = 12
//        using pod animation instead of all the lines commented below
        titleLabel.text = "🌿 PAL App For Nutrition & Healthiness"
        
//        for title animation that appends on the screen
//        titleLabel.text = ""
//        let titleText = "🌿 PAL"
//        var lag = 0.0
//        for letter in titleText {
//            Timer.scheduledTimer(withTimeInterval: 0.25 * lag, repeats: false) { (Timer) in
//                self.titleLabel.text?.append(letter)
//            }
//            lag += 1
//        }
//
//        //        for title animation that appends on the screen
//        titleTwoLabel.text = "FOOD SCANNER"
//                titleTwoLabel.text = ""
//                let titleTwoText = "FOOD SCANNER"
//                var lag1 = 0.0
//                for letter in titleTwoText {
//                    Timer.scheduledTimer(withTimeInterval: 0.1 * lag1, repeats: false) { (Timer) in
//                        self.titleTwoLabel.text?.append(letter)
//                    }
//                    lag1 += 1
//                }
       
    }
    

}
