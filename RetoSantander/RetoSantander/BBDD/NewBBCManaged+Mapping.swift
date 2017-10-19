//
//  NewManaged+Mapping.swift
//  RetoSantander
//
//  Created by iOSDev2 on 18/10/2017.
//  Copyright © 2017 Accenture, S.L. All rights reserved.
//

import Foundation

extension NewBBCManaged {
    
    func mappedObject() -> NewBBC{
        return NewBBC(author:self.author, title:self.title, ampliada:self.ampliada, url:self.url, urlToImage:self.urlToImage, publishedAt:self.publishedAt)
        
    }
    
}
