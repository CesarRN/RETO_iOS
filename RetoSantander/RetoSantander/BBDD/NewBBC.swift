//
//  New.swift
//  RetoSantander
//
//  Created by iOSDev2 on 18/10/2017.
//  Copyright © 2017 Accenture, S.L. All rights reserved.
//

import Foundation

class NewBBC {
    let author: String?
    let title: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: Date?
    let ampliada:String?
    
    init(author: String?, title:String?, ampliada: String?, url:String?, urlToImage:String?, publishedAt:Date?){
        
        self.author = author
        self.title = title
        self.ampliada = ampliada
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
    }
    
}
