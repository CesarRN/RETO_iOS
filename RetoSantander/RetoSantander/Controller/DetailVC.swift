//
//  DetailVC.swift
//  RetoSantander
//
//  Created by iOSDev2 on 18/10/2017.
//  Copyright © 2017 Accenture, S.L. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    var newBBC: NewBBC!

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var date: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if newBBC != nil {
            self.title = newBBC.title
            titleLabel.text = newBBC.title
            descriptionTextView.text = newBBC.ampliada
            date.text =  Utils.formatNSDate(date: newBBC.publishedAt! as NSDate)
            image.downloadedFrom(link: newBBC.urlToImage!, contentMode: UIViewContentMode.scaleAspectFit)
        }
    }
    
    @IBAction func goToWebPress(_ sender: Any) {
        let url = URL(string: newBBC.url!)
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
}
