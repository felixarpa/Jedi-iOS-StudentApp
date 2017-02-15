//
//  Student.swift
//  StudentApp
//
//  Created by Fèlix Arribas on 08/02/17.
//  Copyright © 2017 Fèlix Arribas. All rights reserved.
//

import Foundation
import RealmSwift

class Student: Object {
    
    dynamic var name: String?
    dynamic var surname: String?
    dynamic var gender: Int = Gender.no // 0 = female, 1 = male
    dynamic var paid: Bool = false
    dynamic var birthDate: Date?
    dynamic var image: Data?
    
    var fullName: String {
        return "\(self.name!) \(self.surname!)"
    }
    
    convenience init(name: String, surname: String, gender: Int, paid: Bool, birthDate: Date, image: Data) {
        self.init()
        self.name = name
        self.surname = surname
        self.gender = gender
        self.paid = paid
        self.birthDate = birthDate
        self.image = image
    }
    
    override static func primaryKey() -> String {
        return "name"
    }
    
}
