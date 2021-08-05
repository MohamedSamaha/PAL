//
//  HelpViewController.swift
//  product
//
//  Created by Mohamed Samaha on 05/07/2021.
//

import UIKit

class HelpViewController: UIViewController {

    @IBOutlet weak var liveChat: UIButton!
    @IBOutlet weak var terms: UIButton!
    @IBOutlet weak var howToButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        liveChat.layer.cornerRadius = 12
        terms.layer.cornerRadius = 12
        howToButton.layer.cornerRadius = 12
    }
    
    @IBAction func liveChatButton(_ sender: UIButton) {
        self.performSegue(withIdentifier:"ChatIdentifier", sender: self)
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
