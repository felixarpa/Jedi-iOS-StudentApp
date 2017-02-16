//
//  Controller.swift
//  StudentApp
//
//  Created by Fèlix Arribas on 08/02/17.
//  Copyright © 2017 Fèlix Arribas. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

protocol Controller {
    
    associatedtype T: Object
    
    func all() -> [T]
    func at(index: Int) -> T
    func add(_ element: T)

}


