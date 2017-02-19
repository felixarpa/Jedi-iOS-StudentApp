//
//  StudentsViewController.swift
//  StudentApp
//
//  Created by Fèlix Arribas on 18/02/17.
//  Copyright © 2017 Fèlix Arribas. All rights reserved.
//

import UIKit
import RealmSwift

class StudentsViewController: UIViewController {
    
    @IBOutlet weak var studentsTableView: UITableView!
    @IBOutlet weak var addView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var gradeTextField: UITextField!
    
    var index: Int?
    var bigScaleMultiplier: CGFloat?
    var littleScaleMultiplier: CGFloat?
    
    //var studentsList: List<Student>?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.studentsTableView.delegate = self
        self.studentsTableView.dataSource = self
        
        let addViewHeight = self.addView.layer.frame.size.height
        let tableViewHeight = self.studentsTableView.layer.frame.size.height
        let tableViewBigHeight = addViewHeight + tableViewHeight
        
        self.bigScaleMultiplier = tableViewBigHeight / tableViewHeight
        self.littleScaleMultiplier = tableViewHeight / tableViewBigHeight
        
        self.hideAddView(time: 0)
    }

    @IBAction func showAddView() {
        UIView.animate(
        withDuration: 0.5,
        animations: {
            self.addView.isHidden = false
            self.addView.alpha = 1
            self.studentsTableView.transform = CGAffineTransform(scaleX: 1.0, y: self.littleScaleMultiplier!)
        })
    }
    
    @IBAction func addStudent() {
        if self.nameTextField.text!.characters.count > 0 && self.gradeTextField.text!.characters.count > 0 {
            let realm: Realm = try! Realm()
            try! realm.write {
                
                let mStudent = Student(fullName: self.nameTextField.text!, grade: self.gradeTextField.text!)
                DataController.course.at(index: self.index!).students.append(mStudent)
                
                //self.studentsList!.append(mStudent)
            }
        }
        self.studentsTableView.reloadData()
        self.hideAddView(time: 0.5)
    }
    
    func hideAddView(time: Float) {
        UIView.animate(
            withDuration: TimeInterval(time),
            animations: {
                self.addView.alpha = 0
                self.studentsTableView.transform = CGAffineTransform(scaleX: 1.0, y: self.bigScaleMultiplier!)
        }) { (finished) in
            self.addView.isHidden = true
        }
    }
    /*
    func getCourse() -> Course {
        let realm = try! Realm()
        
        let courses: [Course] = Array(realm.objects(Course.self))
        let course = courses[self.index!]
        
        return course
    }
 */
}

extension StudentsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0//self.getCourse().students.count //self.studentsList!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.studentsTableView.dequeueReusableCell(withIdentifier: "student_cell") as! StudentTableViewCell
        
        //let mStudent = self.getCourse().students[indexPath.row]
        let mStudent = DataController.course.at(index: self.index!).students[indexPath.row]
        /*
            Siempre es nil
            mStudent siempre es nil, el indice es correcto, pero quando intenta acceder curso, alumno y a todos los datos 
         */
        
        cell.nameLabel.text = mStudent.fullName
        cell.gradeLabel.text = "\(mStudent.grade)"
        
        return cell
    }
    
    
}
