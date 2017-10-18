//
//  Constants.swift
//  Social
//
//  Created by José Ignacio Sanz García on 8/10/17.
//  Copyright © 2017 José Ignacio Sanz García. All rights reserved.
//

import UIKit

let SHADOW_GRAY: CGFloat = 120 / 255

enum WeekDays: Int {
    case sunday = 0,
         monday = 1,
         tuesday = 2,
         wednesday = 3,
         thursday = 4,
         friday = 5,
         saturday = 6
}

struct Settings {
    
    static let url = "url_preference"
}

struct Default {
    
    static let url = "https://newsapi.org/v1/articles?source=bbc-news&apiKey=a23c08a9795943e293324c43444b120a"
}

struct Storyboards {
    
    static let main: String = "Main"
}

struct ScenesId {
    
    static let master: String = "MasterViewController"
    static let detail: String = "DetailViewController"
}
