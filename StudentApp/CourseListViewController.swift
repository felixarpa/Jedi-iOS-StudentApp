//
//  ViewController.swift
//  StudentApp
//
//  Created by Fèlix Arribas on 06/02/17.
//  Copyright © 2017 Fèlix Arribas. All rights reserved.
//

import UIKit

class CourseListViewController: UITableViewController {
    
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
            let index = self.courseTableView.indexPathForSelectedRow?.row
            let courseDetailViewController = segue.destination as! CourseDatailViewController
            courseDetailViewController.course = DataController.course.at(index: index!)
        } else if segue.identifier == "add_course" {
            
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataController.course.all().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.courseTableView.dequeueReusableCell(withIdentifier: "course_cell") as! CourseTableViewCell
        
        let course = DataController.course.at(index: indexPath.row)
        cell.mainImageView.image = UIImage(data: course.image!)
        cell.titleLabel.text = course.title
        cell.professorLabel.text = course.professor?.fullName
        
        return cell
    }
    
}

