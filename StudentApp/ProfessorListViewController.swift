//
//  ProfessorListViewController.swift
//  StudentApp
//
//  Created by Fèlix Arribas on 10/02/17.
//  Copyright © 2017 Fèlix Arribas. All rights reserved.
//

import UIKit

class ProfessorListViewController: UIViewController {
    
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
            professorDetailViewController.index = index!
        } else if segue.identifier == "add_professor" {
            let addProfessorViewController = segue.destination as! AddProfessorViewController
            addProfessorViewController.delegate = self
        }
    }
    
}

extension ProfessorListViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataController.professor.all().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.professorTableView.dequeueReusableCell(withIdentifier: "professor_cell") as! ProfessorTableViewCell
        
        cell.professorImage.layer.cornerRadius = cell.professorImage.layer.frame.size.height / 2
        cell.professorImage.clipsToBounds = true
        
        let professor = DataController.professor.at(index: indexPath.row)
        cell.professorImage.image = UIImage(data: professor.image!)
        cell.nameLabel.text = professor.fullName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

extension ProfessorListViewController: AddToListDelegate {
    func added() {
        self.professorTableView.reloadData()
    }
}

