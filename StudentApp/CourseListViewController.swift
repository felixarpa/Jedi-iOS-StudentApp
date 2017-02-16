//
//  ViewController.swift
//  StudentApp
//
//  Created by Fèlix Arribas on 06/02/17.
//  Copyright © 2017 Fèlix Arribas. All rights reserved.
//

import UIKit

class CourseListViewController: UIViewController {
    
    @IBOutlet var courseTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.courseTableView.delegate = self
        self.courseTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.courseTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show_course" {
            print("SHOW COURSE!")
            let index = self.courseTableView.indexPathForSelectedRow?.row
            let courseDetailViewController = segue.destination as! CourseDatailViewController
            courseDetailViewController.index = index
        } else if segue.identifier == "add_course" {
            let addCourseViewController = segue.destination as! AddCourseViewController
            addCourseViewController.delegate = self
        }
    }
    
}

extension CourseListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataController.course.all().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.courseTableView.dequeueReusableCell(withIdentifier: "course_cell") as! CourseTableViewCell
        
        cell.mainImageView.layer.cornerRadius = cell.mainImageView.layer.frame.size.height / 2
        cell.mainImageView.clipsToBounds = true
        
        let course = DataController.course.at(index: indexPath.row)
        cell.mainImageView.image = UIImage(data: course.image!)
        cell.titleLabel.text = course.title
        cell.professorLabel.text = course.professor?.fullName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

extension CourseListViewController: AddToListDelegate {
    func added() {
        self.courseTableView.reloadData()
    }
}

