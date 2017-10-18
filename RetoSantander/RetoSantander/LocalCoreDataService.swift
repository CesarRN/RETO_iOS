//
//  LocalCoreDataService.swift
//  RetoSantander
//
//  Created by Juan Francisco Cordoba Cardeñas on 18/10/2017.
//  Copyright © 2017 Accenture, S.L. All rights reserved.
//

import Foundation
import CoreData

class LocalCoreDataService {
    
    let remoteNewService = RemoteBBC_NewsService()
    let stack  = CoreDataStack.sharedInstance
    
    
    
    
    func getBBC_News(localHandler: ([NewBBC]?) -> Void, remoteHandler: @escaping ([NewBBC]?) -> Void) {
        
        localHandler(self.queryNews())
        
        remoteNewService.getBBC_News() { news in
            
            if let news = news {
                
                for newBBCDictionary in news {
                    
                    if let new = self.getNewByDate(date: newBBCDictionary["title"]!) {
                        self.updateNewBB(newBBCDictionary: newBBCDictionary, newBBC: new)
                    } else {
                        self.insertNewBBC(newBBCDictionary: newBBCDictionary)
                    }
                    
                }
                
                remoteHandler(self.queryNews())
                
            } else {
                remoteHandler(nil)
            }
            
        }
        
        
    }
    

    func queryNews() -> [NewBBC]? {
        
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


    func getNewByDate(date: String) -> NewBBCManaged? {
        
        let context = stack.persistentContainer.viewContext
        let request : NSFetchRequest<NewBBCManaged> = NewBBCManaged.fetchRequest()
        
        let predicate = NSPredicate(format: "title == %@",date as String)
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
        
        //Convertir de string a date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
        let date = dateFormatter.date(from: newBBCDictionary["publishedAt"]!)

        newBBC.publishedAt = date;
        
        
        updateNewBB(newBBCDictionary: newBBCDictionary, newBBC: newBBC)
    }
    
    
    func updateNewBB(newBBCDictionary: [String:String], newBBC: NewBBCManaged) {
        
        let context = stack.persistentContainer.viewContext
        
        newBBC.author = newBBCDictionary["author"]
        newBBC.title = newBBCDictionary["title"]
        newBBC.ampliada = newBBCDictionary["ampliada"]
        newBBC.url = newBBCDictionary["url"]
        newBBC.urlToImage = newBBCDictionary["urlToImage"]
        
        do {
            try context.save()
        } catch {
            print("Error while updating Core Data")
        }
        
    }



}
