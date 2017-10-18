//
//  Utils.swift
//  RetoSantander
//
//  Created by José Ignacio Sanz García on 18/10/2017.
//  Copyright © 2017 Accenture, S.L. All rights reserved.
//

import Foundation

class Utils {
    static public func orderNewsByDate(newsBBC: [NewBBC]) -> [NewBBC]{
        return newsBBC.sorted(by: {$0.publishedAt?.compare($1.publishedAt!) == ComparisonResult.orderedAscending })
    }
    
    static public func formatNSDate(date: NSDate) -> String {
        
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date as Date)
        let month = calendar.component(.month, from: date as Date)
        let day = calendar.component(.day, from: date as Date)
        let dayWeek = calendar.component(.weekday, from: date as Date)
        var dayWeekString = ""
        
        switch dayWeek {
            case WeekDays.sunday.rawValue:
                dayWeekString = "Domingo"
                break
            
            case WeekDays.monday.rawValue:
                dayWeekString = "Lunes"
                break
            
            case WeekDays.tuesday.rawValue:
                dayWeekString = "Martes"
                break
            
            case WeekDays.wednesday.rawValue:
                dayWeekString = "Miércoles"
                break

            
            case WeekDays.thursday.rawValue:
                dayWeekString = "Jueves"
                break

            
            case WeekDays.friday.rawValue:
                dayWeekString = "Viernes"
                break

            case WeekDays.saturday.rawValue:
                dayWeekString = "Sábado"
                break
            
            default:
                dayWeekString = ""
        }

        return "\(dayWeekString), \(day)/\(month)/\(year)"
    }
}
