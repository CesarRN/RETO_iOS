//
//  UImageview+Ext.swift
//  Social
//
//  Created by iOSDev2 on 18/10/2017.
//  Copyright © 2017 José Ignacio Sanz García. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    //Método que descarga una imagen a partir de una URL
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    
    //Método que descarga una imagen a partir de un String
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}
