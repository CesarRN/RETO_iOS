//
//  NewCellTableViewCell.swift
//  RetoSantander
//
//  Created by José Ignacio Sanz García on 17/10/2017.
//  Copyright © 2017 Accenture, S.L. All rights reserved.
//

import UIKit

class NewCell: UITableViewCell {

    var newBBC: NewBBC!
    
    @IBOutlet weak var URLImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //Configura los elementos visuales de la celda
    func configureCell(new: NewBBC) {
        self.newBBC = new
        titleLabel.text = new.title
        descriptionLabel.text = new.ampliada
        URLImage.downloadedFrom(link: new.urlToImage!)
    }

}
