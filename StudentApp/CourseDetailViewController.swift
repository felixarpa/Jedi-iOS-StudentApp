//
//  CourseDetailViewController.swift
//  StudentApp
//
//  Created by Fèlix Arribas on 08/02/17.
//  Copyright © 2017 Fèlix Arribas. All rights reserved.
//

import UIKit

class CourseDatailViewController: SingleObjectViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var initialLabel: UILabel!
    @IBOutlet weak var finalLabel: UILabel!
    
    @IBOutlet weak var professorImageView: UIImageView!
    @IBOutlet weak var professorLabel: UILabel!
    
    var course: Course?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        setUpData()
    }
    
    override func setUpView() {
        super.setUpView()
        self.professorImageView.layer.cornerRadius = self.professorImageView.frame.height / 2
        self.professorImageView.clipsToBounds = true
    }
    
    func setUpData() {
        self.mainImageView.image = UIImage(data: (course?.image)!)
        self.titleLabel.text = course?.title
        self.initialLabel.text = course?.schedule?.initial
        self.finalLabel.text = course?.schedule?.final
        self.professorImageView.image = UIImage(data: (course?.professor?.image)!)
        self.professorLabel.text = course?.professor?.fullName
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show_students" {
            
        }
    }

}
