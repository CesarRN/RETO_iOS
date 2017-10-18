//
//  FancyView.swift
//  Social
//
//  Created by José Ignacio Sanz García on 8/10/17.
//  Copyright © 2017 José Ignacio Sanz García. All rights reserved.
//

import UIKit

class FancyView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.75).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        layer.cornerRadius = 2
    }

}
