//
//  AddCourseViewController.swift
//  StudentApp
//
//  Created by Fèlix Arribas on 08/02/17.
//  Copyright © 2017 Fèlix Arribas. All rights reserved.
//

import UIKit

class AddCourseViewController: SingleObjectViewController {
    
    var delegate: AddToListDelegate?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var initialHourTextField: UITextField!
    @IBOutlet weak var finalHourTextField: UITextField!

    @IBOutlet weak var professorTextField: UITextField!
    @IBOutlet weak var professorImageView: UIImageView!
    
    @IBOutlet weak var pickerToolbar: UIToolbar!
    
    @IBOutlet var pickerCollection: [UITextField]!
    @IBOutlet var textFieldCollection: [UITextField]!
    
    var imageData: Data?
    let imagePicker = UIImagePickerController()
    
    let hours = Array(1...12)
    let times = ["AM", "PM"]
    var schedule = Schedule(initialHour: 12, initialTime: Schedule.am, finalHour: 12, finalTime: Schedule.am)
    @IBOutlet weak var schedulePicker: UIPickerView!
    
    let none = -1
    let initial = 0
    let final = 1
    var editingSchedule = -1
    
    var professors: [String]?
    var professor = Professor()
    @IBOutlet weak var professorPicker: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let allProfessors = DataController.professor.all()
        
        self.professors = allProfessors.map({ (professor: Professor) -> String in
            return professor.fullName
        })
        
        self.imageData = UIImagePNGRepresentation(UIImage(named: "placeholder.png")!)
        self.imagePicker.delegate = self
    }
    
    override func setUpView() {
        super.setUpView()
        
        self.professorImageView.layer.cornerRadius = self.professorImageView.layer.frame.size.height / 2
        self.professorImageView.clipsToBounds = true
        
        self.schedulePicker.delegate = self
        self.schedulePicker.backgroundColor = UIColor.white
        self.professorPicker.delegate = self
        self.professorPicker.backgroundColor = UIColor.white
        
        self.hidePickers()
        
        for textField in self.textFieldCollection {
            textField.delegate = self
        }
    }
    
    @IBAction func accept() {
        
        let course = Course(
            title: self.titleTextField.text!,
            professor: self.professor,
            price: 0.0,
            schedule: self.schedule,
            image: self.imageData!
        )
        
        DataController.course.add(course)
        
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
    
    func showSchedulePicker() {
        self.schedulePicker.isHidden = false
        self.pickerToolbar.isHidden = false
    }
    
    func showProfessorPicker() {
        self.professorPicker.isHidden = false
        self.pickerToolbar.isHidden = false
    }
    
    func hidePickers() {
        self.schedulePicker.isHidden = true
        self.professorPicker.isHidden = true
        self.pickerToolbar.isHidden = true
    }
    
    @IBAction func donePicker(_ sender: UIButton) {
        self.editingSchedule = self.none
        self.hidePickers()
    }
    
}

extension AddCourseViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            //self.imageData = UIImagePNGRepresentation(pickedImage)
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

extension AddCourseViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == professorPicker {
            if component == 0 {
                return (self.professors?.count)!
            } else {
                return 0
            }
        } else {
            if component == 0 {
                return self.hours.count
            } else if component == 1 {
                return self.times.count
            } else {
                return 0
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == professorPicker {
            return 1
        } else {
            return 2
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == professorPicker {
            return self.professors![row]
        } else {
            if component == 0 {
                return "\(self.hours[row]):00"
            } else if component == 1 {
                return self.times[row]
            } else {
                return ""
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == professorPicker {
            self.professor = DataController.professor.at(index: row)
            self.professorTextField.text = self.professor.fullName
            self.professorImageView.image = UIImage(data: self.professor.image!)
        } else {
            switch self.editingSchedule {
            case self.initial:
                if component == 0 {
                    self.schedule.initialHour = self.hours[row]
                } else if component == 1 {
                    self.schedule.initialTime = self.times[row]
                }
                self.initialHourTextField.text = "\(self.schedule.initialHour):00 \(self.schedule.initialTime!)"
            case self.final:
                if component == 0 {
                    self.schedule.finalHour = self.hours[row]
                } else if component == 1 {
                    self.schedule.finalTime = self.times[row]
                }
                self.finalHourTextField.text = "\(self.schedule.finalHour):00 \(self.schedule.finalTime!)"
                
            default:
                break
            }
        }
    }
}

extension AddCourseViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        self.editingSchedule = self.none
        self.hidePickers()
        
        if pickerCollection.contains(textField) {
            self.showSchedulePicker()
            textField.resignFirstResponder()
            if textField == self.initialHourTextField {
                self.editingSchedule = self.initial
            } else {
                self.editingSchedule = self.final
            }
        } else if self.professorTextField == textField {
            self.showProfessorPicker()
            textField.resignFirstResponder()
        }
    }
}



