//
//  SingleObjectViewController.swift
//  StudentApp
//
//  Created by Fèlix Arribas on 10/02/17.
//  Copyright © 2017 Fèlix Arribas. All rights reserved.
//

import UIKit

class SingleObjectViewController: UIViewController {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var spaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var topView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
    }
    
    func setUpView() {
        let halfImageViewHeight = self.mainImageView.layer.frame.size.height / 2
        let topViewHeigh = self.topView.layer.frame.size.height
        self.spaceConstraint.constant = topViewHeigh - halfImageViewHeight
        self.mainImageView.layer.cornerRadius = halfImageViewHeight
        self.mainImageView.clipsToBounds = true
    }

}
