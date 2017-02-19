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
    
    dynamic var fullName: String?
    dynamic var grade: String?
    
    
    convenience init(fullName: String, grade: String) {
        self.init()
        self.fullName = fullName
        self.grade = grade
    }
    
}
