//
//  Schedule.swift
//  StudentApp
//
//  Created by Fèlix Arribas on 08/02/17.
//  Copyright © 2017 Fèlix Arribas. All rights reserved.
//

import Foundation
import RealmSwift

class Schedule: Object {
    
    static let am = "AM"
    static let pm = "PM"
    
    dynamic var initialHour: Int = 12
    dynamic var initialTime: String?
    dynamic var finalHour: Int = 12
    dynamic var finalTime: String?
    
    convenience init(initialHour: Int, initialTime: String, finalHour: Int, finalTime: String) {
        self.init()
        self.initialHour = initialHour
        self.initialTime = initialTime
        self.finalHour = finalHour
        self.finalTime = finalTime
    }
    
    var initial: String {
        return "\(initialHour):00 \(initialTime)"
    }
    
    var final: String {
        return "\(finalHour):00 \(finalTime)"
    }
}
