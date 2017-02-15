//
//  AddProfessorViewController.swift
//  StudentApp
//
//  Created by Fèlix Arribas on 10/02/17.
//  Copyright © 2017 Fèlix Arribas. All rights reserved.
//

import UIKit

class AddProfessorViewController: SingleObjectViewController {
    
    var delegate: AddToListDelegate?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnamesTextField: UITextField!
    @IBOutlet weak var birthDateTextField: UITextField!
    @IBOutlet weak var genderSwitch: UISegmentedControl!
    
    var imageData: Data?
    
    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageData = UIImagePNGRepresentation(UIImage(named: "placeholder.png")!)
        self.imagePicker.delegate = self
    }
    
    @IBAction func accept() {
        
        var gender = Gender.no
        
        if self.genderSwitch.selectedSegmentIndex == 0 {
            gender = Gender.female
        } else if self.genderSwitch.selectedSegmentIndex == 1 {
            gender = Gender.male
        }
        
        let professor = Professor(
            name: self.nameTextField.text!,
            surname: self.surnamesTextField.text!,
            gender: gender,
            birthDate: self.birthDateTextField.text!,
            image: self.imageData!
        )
        
        DataController.professor.add(element: professor)
        
        self.delegate?.added()
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func image() {
        self.imagePicker.sourceType = .photoLibrary
        present(self.imagePicker, animated: true, completion: nil)
    }
}

extension AddProfessorViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imageData = UIImagePNGRepresentation(pickedImage)
            self.mainImageView.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        self.imagePicker.sourceType = .photoLibrary
        present(self.imagePicker, animated: true, completion: nil)
    }
}

