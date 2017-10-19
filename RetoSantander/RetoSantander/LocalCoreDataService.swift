//
//  LocalCoreDataService.swift
//  RetoSantander
//
//  Created by iOSDev2 on 18/10/2017.
//  Copyright © 2017 Accenture, S.L. All rights reserved.
//

import Foundation
import CoreData

class LocalCoreDataService {
    
    let remoteNewService = RemoteBBC_NewsService()
    let stack  = CoreDataStack.sharedInstance
    
    
    
    
    func getBBC_News(localHandler: ([NewBBC]?) -> Void, remoteHandler: @escaping ([NewBBC]?) -> Void) {
        
        localHandler(self.queryGetNews())
        
        remoteNewService.getBBC_News() { news in
            
            if let news = news {
                
                for newBBCDictionary in news {
                    
                    if let new = self.getNewByTitle(title: newBBCDictionary["title"]!) {
                        self.updateNewBBC(newBBCDictionary: newBBCDictionary, newBBC: new)
                    } else {
                        self.insertNewBBC(newBBCDictionary: newBBCDictionary)
                    }
                    
                }
                
                remoteHandler(self.queryGetNews())
                
            } else {
                remoteHandler(nil)
            }
            
        }
        
        
    }
    

    func queryGetNews() -> [NewBBC]? {
        
        let context = stack.persistentContainer.viewContext
        let request : NSFetchRequest<NewBBCManaged> = NewBBCManaged.fetchRequest()
        
        let sortDescriptor = NSSortDescriptor(key: "publishedAt", ascending: false)
        request.sortDescriptors = [sortDescriptor]
        
        do {
            
            let fetchedNews = try context.fetch(request)
            
            var news = [NewBBC]()
            for managedNew in fetchedNews {
                news.append(managedNew.mappedObject())
            }
            return news
            
        } catch {
            print("Error while getting news from Core Data")
            return nil
        }
    }


    func getNewByTitle(title: String) -> NewBBCManaged? {
        
        let context = stack.persistentContainer.viewContext
        let request : NSFetchRequest<NewBBCManaged> = NewBBCManaged.fetchRequest()
        
        let predicate = NSPredicate(format: "title == %@",title as String)
        request.predicate = predicate
        
        
        do {
            
            let fetchedNews = try context.fetch(request)
            if fetchedNews.count > 0 {
                return fetchedNews.last
            } else {
                return nil
            }
            
        } catch {
            print("Error while getting new from Core Data")
            return nil
        }
        
    }


    func insertNewBBC(newBBCDictionary : [String:String]) {
        
        let context = stack.persistentContainer.viewContext
        let newBBC = NewBBCManaged(context: context)
        
        newBBC.title = newBBCDictionary["title"]
        
        updateNewBBC(newBBCDictionary: newBBCDictionary, newBBC: newBBC)
    }
    
    
    func updateNewBBC(newBBCDictionary: [String:String], newBBC: NewBBCManaged) {
        
        let context = stack.persistentContainer.viewContext
        
        newBBC.author = newBBCDictionary["author"]
        newBBC.ampliada = newBBCDictionary["ampliada"]
        newBBC.url = newBBCDictionary["url"]
        newBBC.urlToImage = newBBCDictionary["urlToImage"]
        
        //Convertir de string a date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
        let date = dateFormatter.date(from: newBBCDictionary["publishedAt"]!)
        
        newBBC.publishedAt = date;
        
        do {
            try context.save()
        } catch {
            print("Error while updating Core Data")
        }
        
    }



}
