//
//  NewManaged+Mapping.swift
//  RetoSantander
//
//  Created by Cesar on 17/10/2017.
//  Copyright © 2017 Accenture, S.L. All rights reserved.
//

import Foundation

extension NewBBC {
    
    func mappedObject() -> NewBBC{
        return NewBBC(author:self.author, title:self.title, newDescription:self.newDescription, url:self.url, urlToImage:self.urlToImage, publishedAt:self.publishedAt)
        
    }
    
}
