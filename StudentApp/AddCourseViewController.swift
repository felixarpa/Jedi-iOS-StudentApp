//
//  AddCourseViewController.swift
//  StudentApp
//
//  Created by Fèlix Arribas on 08/02/17.
//  Copyright © 2017 Fèlix Arribas. All rights reserved.
//

import UIKit

class AddCourseViewController: SingleObjectViewController {
    
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var initialHourLabel: UITextField!
    @IBOutlet weak var finalHourLabel: UITextField!

    @IBOutlet weak var professorLabel: UITextField!
    @IBOutlet weak var professorImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setUpView() {
        super.setUpView()
        
        self.professorImageView.layer.cornerRadius = self.professorImageView.frame.height / 2
        self.professorImageView.clipsToBounds = true
    }
    
    @IBAction func accept() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel() {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func image() {
        
    }
    
}
