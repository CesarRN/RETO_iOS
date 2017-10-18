//
//  DetailVC.swift
//  RetoSantander
//
//  Created by José Ignacio Sanz García on 17/10/17.
//  Copyright © 2017 Accenture, S.L. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    var newBBC: NewBBC!

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if newBBC != nil {
            self.title = newBBC.title
            titleLabel.text = newBBC.title
            descriptionTextView.text = newBBC.ampliada
            image.downloadedFrom(link: newBBC.urlToImage!, contentMode: UIViewContentMode.scaleAspectFill)
        }

        // Do any additional setup after loading the view.
    }

}
