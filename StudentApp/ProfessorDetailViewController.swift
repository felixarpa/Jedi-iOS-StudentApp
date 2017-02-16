//
//  ProfessorDetailViewController.swift
//  StudentApp
//
//  Created by Fèlix Arribas on 10/02/17.
//  Copyright © 2017 Fèlix Arribas. All rights reserved.
//

import UIKit

class ProfessorDetailViewController: SingleObjectViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthDateLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    var index: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpData()
    }
    
    func setUpData() {
        
        let professor = DataController.professor.at(index: index!)

        self.mainImageView.image = UIImage(data: (professor.image)!)
        self.nameLabel.text = professor.fullName
        self.birthDateLabel.text = professor.birthDate
        
        var gender = "--"
        if professor.gender == Gender.female {
            gender = "Mujer"
        } else if professor.gender == Gender.male {
            gender = "Hombre"
        }
        
        self.genderLabel.text = gender
 
    }

}
