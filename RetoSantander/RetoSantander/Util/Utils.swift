//
//  Utils.swift
//  RetoSantander
//
//  Created by iOSDev2 on 18/10/2017.
//  Copyright © 2017 Accenture, S.L. All rights reserved.
//

import Foundation

class Utils {
    
    //Ordena un array de noticias por fecha
    static public func orderNewsByDate(newsBBC: [NewBBC]) -> [NewBBC]{
        return newsBBC.sorted(by: {$0.publishedAt?.compare($1.publishedAt!) == ComparisonResult.orderedAscending })
    }
    
    //Formatea la fecha en formato: Día de la semana, dia mes año
    static public func formatNSDate(date: NSDate) -> String {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date as Date)
        let month = calendar.component(.month, from: date as Date)
        let day = calendar.component(.day, from: date as Date)
        let dayWeek = calendar.component(.weekday, from: date as Date)
        let dayWeekString = getDayOfWeek(dayOfWeek: dayWeek)
        let monthString = getMonth(month: month)

        return "\(dayWeekString), \(day) \(monthString) \(year)"
    }
    
    //Método al que se le pasa el entero de un día de la semana y obtiene una el literal
    static func getDayOfWeek(dayOfWeek: Int) -> String {
        var dayWeekString = ""
        switch dayOfWeek {
        case WeekDays.sunday.rawValue:
            dayWeekString = NSLocalizedString("sunday", comment: "")
            break
        case WeekDays.monday.rawValue:
            dayWeekString = NSLocalizedString("monday", comment: "")
            break
        case WeekDays.tuesday.rawValue:
            dayWeekString = NSLocalizedString("tuesday", comment: "")
            break
        case WeekDays.wednesday.rawValue:
            dayWeekString = NSLocalizedString("wednesday", comment: "")
            break
        case WeekDays.thursday.rawValue:
            dayWeekString = NSLocalizedString("thursday", comment: "")
            break
        case WeekDays.friday.rawValue:
            dayWeekString = NSLocalizedString("friday", comment: "")
            break
        case WeekDays.saturday.rawValue:
            dayWeekString = NSLocalizedString("saturday", comment: "")
            break
        default:
            dayWeekString = ""
        }
        return dayWeekString
    }
    
    //Método al que se le pasa el entero de un mes y obtiene una el literal
    static func getMonth(month: Int) -> String {
        var monthString = ""
        switch month {
        case Months.January.rawValue:
            monthString = NSLocalizedString("january", comment: "")
            break
        case Months.February.rawValue:
            monthString = NSLocalizedString("february", comment: "")
            break
        case Months.March.rawValue:
            monthString = NSLocalizedString("march", comment: "")
            break
        case Months.April.rawValue:
            monthString = NSLocalizedString("april", comment: "")
            break
        case Months.May.rawValue:
            monthString = NSLocalizedString("may", comment: "")
            break
        case Months.June.rawValue:
            monthString = NSLocalizedString("june", comment: "")
            break
        case Months.July.rawValue:
            monthString = NSLocalizedString("july", comment: "")
            break
        case Months.August.rawValue:
            monthString = NSLocalizedString("august", comment: "")
            break
        case Months.September.rawValue:
            monthString = NSLocalizedString("september", comment: "")
        case Months.October.rawValue:
            monthString = NSLocalizedString("october", comment: "")
            break
        case Months.November.rawValue:
            monthString = NSLocalizedString("november", comment: "")
            break
        case Months.December.rawValue:
            monthString = NSLocalizedString("december", comment: "")
            break
        default:
            monthString = ""
        }
        return monthString
    }
}
