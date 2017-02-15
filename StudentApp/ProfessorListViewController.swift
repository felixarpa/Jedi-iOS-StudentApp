//
//  ProfessorListViewController.swift
//  StudentApp
//
//  Created by Fèlix Arribas on 10/02/17.
//  Copyright © 2017 Fèlix Arribas. All rights reserved.
//

import UIKit

class ProfessorListViewController: UITableViewController {
    
    @IBOutlet var professorTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.professorTableView.delegate = self
        self.professorTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.professorTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show_professor" {
            let index = self.professorTableView.indexPathForSelectedRow?.row
            let professorDetailViewController = segue.destination as! ProfessorDetailViewController
            professorDetailViewController.professor = DataController.professor.at(index: index!)
        } else if segue.identifier == "add_professor" {
            
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataController.professor.all().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.professorTableView.dequeueReusableCell(withIdentifier: "professor_cell") as! ProfessorTableViewCell
        
        let professor = DataController.professor.at(index: indexPath.row)
        cell.professorImage.image = UIImage(data: professor.image!)
        cell.nameLabel.text = professor.fullName
        
        return cell
    }
    
}

