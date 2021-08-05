//
//  RealmObjects.swift
//  product
//
//  Created by Mohamed Samaha on 05/05/2021.
//

import Foundation
import RealmSwift

class product: Object {
    
    @objc dynamic var Calories : String? = nil
    @objc dynamic var productName : String? = nil
    @objc dynamic var Protein : String? = nil
    @objc dynamic var Sodium : String? = nil
    @objc dynamic var Sugars : String? = nil
    @objc dynamic var arabCountries : String? = nil
    @objc dynamic var riskFor : String? = nil
    @objc dynamic var totalFat : String? = nil
    
    override static func primaryKey() -> String? {
        return "productName"
    }
}
extension product {
    func writeToRealm() {
        try! uiRealm.write {
            uiRealm.add(self, update: .all)
        }
    }
}
