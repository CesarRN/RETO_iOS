//
//  New.swift
//  RetoSantander
//
//  Created by Cesar on 17/10/2017.
//  Copyright © 2017 Accenture, S.L. All rights reserved.
//

import Foundation

class NewBBC {
    let author: String?
    let title: String?
    let newDescription: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: Date?
    
    init(author: String?, title:String?, newDescription: String?, url:String?, urlToImage:String?, publishedAt:Date?){
        
        self.author = author
        self.title = title
        self.newDescription = newDescription
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
    }
    
}
