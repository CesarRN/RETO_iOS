//
//  RemoteBBC_NewsService.swift
//  RetoSantander
//
//  Created by Cesar on 17/10/2017.
//  Copyright © 2017 Accenture, S.L. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class RemoteBBC_NewsService {
    
    func getBBC_News(completionHandler: @escaping ([[String:String]]?) -> Void) {
        
        let url = URL(string: "https://newsapi.org/v1/articles?source=bbc-news&apiKey=a23c08a9795943e293324c43444b120a")!
        
        Alamofire.request(url, method: .get, encoding: URLEncoding.default, headers: nil).validate().responseJSON() { response in
            
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
                        newBBC["newDescription"] = entry["description"].stringValue
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
