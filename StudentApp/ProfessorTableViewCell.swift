//
//  ProfessorTableViewCell.swift
//  StudentApp
//
//  Created by Fèlix Arribas on 10/02/17.
//  Copyright © 2017 Fèlix Arribas. All rights reserved.
//

import UIKit

class ProfessorTableViewCell: UITableViewCell {
    
    @IBOutlet weak var professorImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.professorImage.layer.cornerRadius = self.professorImage.frame.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
