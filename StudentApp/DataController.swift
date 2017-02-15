//
//  DataController.swift
//  StudentApp
//
//  Created by Fèlix Arribas on 08/02/17.
//  Copyright © 2017 Fèlix Arribas. All rights reserved.
//

import Foundation
import RealmSwift

class DataController {
    
    static let course = ModelContoller<Course>()
    static let student = ModelContoller<Student>()
    static let professor = ModelContoller<Professor>()
    
}
