//
//  Course.swift
//  StudentApp
//
//  Created by Fèlix Arribas on 08/02/17.
//  Copyright © 2017 Fèlix Arribas. All rights reserved.
//

import Foundation
import RealmSwift

class Course: Object {
    
    dynamic var title: String?
    dynamic var professor: Professor?
    var students = List<Student>()
    dynamic var price: Float = 0.0
    dynamic var schedule: Schedule?
    dynamic var image: Data?
    
    convenience init(title: String, professor: Professor, students: List<Student> = List<Student>(), price: Float, schedule: Schedule, image: Data) {
        self.init()
        self.title = title
        self.professor = professor
        self.students = students
        self.price = price
        self.schedule = schedule
        self.image = image
    }
    
    override static func primaryKey() -> String {
        return "title"
    }
}
