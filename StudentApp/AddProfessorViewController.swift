//
//  AddProfessorViewController.swift
//  StudentApp
//
//  Created by Fèlix Arribas on 10/02/17.
//  Copyright © 2017 Fèlix Arribas. All rights reserved.
//

import UIKit

class AddProfessorViewController: SingleObjectViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnamesTextField: UITextField!
    @IBOutlet weak var birthDateTextField: UITextField!
    @IBOutlet weak var genderSwitch: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
