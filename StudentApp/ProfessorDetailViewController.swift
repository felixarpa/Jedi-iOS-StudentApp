//
//  ProfessorDetailViewController.swift
//  StudentApp
//
//  Created by Fèlix Arribas on 10/02/17.
//  Copyright © 2017 Fèlix Arribas. All rights reserved.
//

import UIKit

class ProfessorDetailViewController: SingleObjectViewController {
    
    var professor: Professor!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthDateLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setUpView() {
        super.setUpView()

        self.mainImageView.image = UIImage(data: (self.professor.image)!)
        self.nameLabel.text = self.professor.fullName
        self.birthDateLabel.text = self.professor.birthDate
        
        var gender = "--"
        if self.professor.gender == Gender.female {
            gender = "Mujer"
        } else if self.professor.gender == Gender.male {
            gender = "Hombre"
        }
        
        self.genderLabel.text = gender
 
    }

}
