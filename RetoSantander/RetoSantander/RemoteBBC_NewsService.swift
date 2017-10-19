//
//  RemoteBBC_NewsService.swift
//  RetoSantander
//
//  Created by iOSDev2 on 18/10/2017.
//  Copyright © 2017 Accenture, S.L. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class RemoteBBC_NewsService {
    
    func getBBC_News(completionHandler: @escaping ([[String:String]]?) -> Void) {
        
        guard let strUrl = UserDefaults.standard.string(forKey:Settings.url) else {
            
            return
        }
        
        if let url = URL(string: strUrl) {
            
            Alamofire.request(url, method: .get).validate().responseJSON() { response in
            
            switch response.result {
                
            case .success:
                
                if let value = response.result.value {
                    
                    let json = JSON(value)
                    var result = [[String:String]]()
                    let entries = json["articles"].arrayValue
                    
                    for entry in entries {
                        
                        var newBBC = [String:String]()
                        newBBC["author"] = entry["author"].stringValue
                        newBBC["title"] = entry["title"].stringValue
                        newBBC["ampliada"] = entry["description"].stringValue
                        newBBC["url"] = entry["url"].stringValue
                        newBBC["urlToImage"] = entry["urlToImage"].stringValue
                        newBBC["publishedAt"] = entry["publishedAt"].stringValue
                        result.append(newBBC)
                        
                    }
                    
                    completionHandler(result)
                    
                }
                
            case .failure(let error):
                
                print(error)
                completionHandler(nil)
                
            }
        }
        }
    }
}
