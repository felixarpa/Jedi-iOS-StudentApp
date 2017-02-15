//
//  ModelControllers.swift
//  StudentApp
//
//  Created by Fèlix Arribas on 08/02/17.
//  Copyright © 2017 Fèlix Arribas. All rights reserved.
//

import Foundation
import RealmSwift

class ModelContoller<T: Object>: Controller {
    
    var realm: Realm = try! Realm()
    
    func all() -> [T] {
        return Array(self.realm.objects(T.self))
    }
    
    func at(index: Int) -> T {
        return all()[index]
    }
    
    func add(element: T) {
        try! self.realm.write {
            self.realm.add(element)
        }
    }
    
}
