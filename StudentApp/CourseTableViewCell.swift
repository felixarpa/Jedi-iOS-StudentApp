//
//  CourseTableViewCell.swift
//  StudentApp
//
//  Created by Fèlix Arribas on 08/02/17.
//  Copyright © 2017 Fèlix Arribas. All rights reserved.
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var professorLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.mainImageView.layer.cornerRadius = self.mainImageView.frame.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
