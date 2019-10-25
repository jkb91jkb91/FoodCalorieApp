//
//  DateFormatterService.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-10-25.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import Foundation

struct DateFormatterService {
    
    static func formatterCounter(value: Int, date: String?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        let dateFromString = dateFormatter.date(from: date!)
        let calendar = Calendar.current
        let modifiedDate = calendar.date(byAdding: .day, value: value, to: dateFromString!)
        dateFormatter.dateStyle = .short
        let stringFormat = dateFormatter.string(from: modifiedDate!)
        return stringFormat
    }
    
 
    static func currendDate() -> String {
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        let dateFromString = dateFormatter.string(from: today)
        return dateFromString
    }
    
    
}
