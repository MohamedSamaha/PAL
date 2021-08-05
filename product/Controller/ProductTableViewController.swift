//
//  ProductTableViewController.swift
//  product
//
//  Created by Mohamed Samaha on 11/05/2021.
//

import UIKit
import FirebaseDatabase
import RealmSwift

class ProductTableViewController: UITableViewController {

    
    var productNameValue: String?
    var riskForChocolateAllergy: String?
    var riskForMilkAllergy: String?
    var riskForHeartDisease: String?
    var riskForDiabetes: String?
    var riskForObesity: String?
    var riskForHeartDiet: String?
    var riskForValues: String?
   
    var window: UIWindow?
    
//    @IBOutlet weak var labelTable: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        

//        tableView.rowHeight = 50.0
//        labelTable.text = productNameValue
        grabData()
        
    }
    
    @IBAction func showSecondViewController() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let secondVC = storyboard.instantiateViewController(identifier: "SecondViewController")

            show(secondVC, sender: self)
        }
    
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//       self.window = UIWindow(frame: UIScreen.main.bounds)
//       let nav1 = UINavigationController()
//       let mainView = ViewController(nibName: nil, bundle: nil) //ViewController = Name of your controller
//       nav1.viewControllers = [mainView]
//       self.window!.rootViewController = nav1
//       self.window?.makeKeyAndVisible()
//    return true
//    }
    
    
    //MARK: - UITableViewControler
    

    var products : Results<product>!
    
    func grabData() {
        let databaseRef = Database.database().reference()
        databaseRef.child("product").observe(.value, with: {
            snapshot in
            print(snapshot)
//            print(self.productNameValue?)
            for snap in snapshot.children.allObjects as! [DataSnapshot] {
                guard let dictionary = snap.value as? [String : AnyObject] else {
                    return
                }
                
                let Calories = dictionary["Calories"] as? String
                let productName = dictionary["productName"] as? String
                let Protein = dictionary["Protein"] as? String
                let Sodium = dictionary["Sodium"] as? String
                let Sugars = dictionary["Sugars"] as? String
                let arabCountries = dictionary["arabCountries"] as? String
                let riskFor = dictionary["riskFor"] as? String
                let totalFat = dictionary["totalFat"] as? String
                
               
                    let ProductToAdd = product()
                    ProductToAdd.Calories = Calories
                    ProductToAdd.productName = productName
                    ProductToAdd.Protein = Protein
                    ProductToAdd.Sodium = Sodium
                    ProductToAdd.Sugars = Sugars
                    ProductToAdd.arabCountries = arabCountries
                    ProductToAdd.riskFor = riskFor
                    ProductToAdd.totalFat = totalFat
                    ProductToAdd.writeToRealm()
                    
                    self.reloadData()
                    
                
                
                
            }
        })
    }
    
    func reloadData() {
//        u can use .filter method to filter the data to specify with data should appear
        products = uiRealm.objects(product.self)
            .filter("productName == '\(productNameValue ?? "Product Not Found By Filtering")'")
//            .sorted(byKeyPath: productNameValue ?? "Zero", ascending: true).filter("productNameValue == productNameValue")
            .sorted(byKeyPath: "productName", ascending: true)
        self.tableView.reloadData()
        

    }
    
   
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return min(stats.count, 10)
        if products != nil {
            return products.count
        } else {
            return 0
        }
        
    }
        
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        if indexPath.count < 1 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! FirstCustomCell // <- to inheret the proporty of cell and connect it with TableViewCell
//
//            cell.labelTable.text = productNameValue
//
//            return cell
//
//        } else if indexPath.row > 1 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! SecondCustomCell // <- to inheret the proporty of cell and connect it with TableViewCell
//
//            cell.CaloriesLabel.text = products[indexPath.row].Protein
//            cell.riskForLabel.text = products[indexPath.row].Calories
//
//
//            return cell
//        } else {
//            fatalError("Error")
//        }

        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // if you want to display two  diferent cells togthter like return cell1 + cell2 you should use this swift statment
    switch indexPath.section {
        case 0 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! FirstCustomCell // <- to inheret the proporty of cell and connect it with TableViewCell
                tableView.rowHeight = 170.0
                cell.labelTable.text = productNameValue
                cell.ImageView?.image = UIImage(named: productNameValue ?? "nil")
                
            tableView.layer.cornerRadius = 12
                return cell
            
    case 1:
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! SecondCustomCell // <- to inheret the proporty of cell and connect it with TableViewCell
            tableView.rowHeight = 80.0
            cell.CaloriesLabel.text = "Calories"
            cell.CaloriesValueLabel.text = products[indexPath.row].Calories
            
                
        
            return cell
        
    case 2:
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell3", for: indexPath) as! ThirdCustomCell // <- to inheret the proporty of cell and connect it with TableViewCell
        tableView.rowHeight = 80.0
        cell.proteinLabel.text = "Protein"
        cell.proteinValue.text = products[indexPath.row].Protein
        
        
        
            return cell
        
    case 3:
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell4", for: indexPath) as! FouthCustomCell // <- to inheret the proporty of cell and connect it with TableViewCell
        tableView.rowHeight = 80.0
        cell.sodiumLabel.text = "Sodium"
        cell.sodiumValueLabel.text = products[indexPath.row].Sodium
        

        return cell
        
    case 4:
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell5", for: indexPath) as! FifthCustomCell // <- to inheret the proporty of cell and connect it with TableViewCell
        tableView.rowHeight = 80.0
        cell.sugarLabel.text = "Sugar"
        cell.sugarsValueLabel.text = products[indexPath.row].Sugars
        
            return cell
        
    case 5:
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell6", for: indexPath) as! SixthCustomCell // <- to inheret the proporty of cell and connect it with TableViewCell
        tableView.rowHeight = 80.0
        cell.totalFatLabel.text = "Total Fat"
        cell.totalFatValueLabel.text = products[indexPath.row].totalFat
        
            return cell
        
        
    case 6:
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell7", for: indexPath) as! SeventhCustomCell // <- to inheret the proporty of cell and connect it with TableViewCell
        tableView.rowHeight = 90.0
        cell.arabCountriesLabel.text = products[indexPath.row].arabCountries
        
            return cell
        
    
        default:
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell8", for: indexPath) as! EighthCustomCell // <- to inheret the proporty of cell and connect it with TableViewCell
//            if (riskFor != nil) {
//                riskFor = self.riskForAllergy
//            }
            tableView.rowHeight = 90.0
            if products[indexPath.row].riskFor! == riskForValues {
                cell.riskForLabel.text = "Unhealthy it cause \(riskForValues ?? "no it does not")"

            }
            else if products[indexPath.row].riskFor! == riskForValues {
                cell.riskForLabel.text = "Unhealthy it cause \(riskForValues ?? "no it does not")"

            } else if products[indexPath.row].riskFor! == riskForValues {
                cell.riskForLabel.text = "Unhealthy it cause \(riskForValues ?? "no it does not")"
            }
            else if products[indexPath.row].riskFor! == riskForValues {
                cell.riskForLabel.text = "Unhealthy it cause \(riskForValues ?? "no it does not")"
            }
            else if products[indexPath.row].riskFor! == riskForValues {
                cell.riskForLabel.text = "Unhealthy it cause \(riskForValues ?? "no it does not")"
            }
            else if products[indexPath.row].riskFor! == riskForValues {
                cell.riskForLabel.text = "Unhealthy it cause \(riskForValues ?? "no it does not")"
            }
            
            else {
                cell.riskForLabel.text = products[indexPath.row].riskFor
                print(products[indexPath.row].riskFor!)
                print(riskForMilkAllergy ?? "ALL")

            }
            
            
//            cell.riskForLabel.text = riskForAllergy
//            print(products[indexPath.row].riskFor!)
            
            return cell

        }
        
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
    



