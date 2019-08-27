//
//  DateService.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-27.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import Foundation


class DateService {
    
    
    private init() {}
    
    
    let sharedInstance = DateService()
    
    
    
    func setDateBegininng() -> String {
        let today = Date()
        let calendar = Calendar.current
        let component1 = String(calendar.component(.day, from: today))
        let component2 = String(calendar.component(.month, from: today))
        let component3 = String(calendar.component(.year, from: today))
        let connectedComponent = "\(component1)-\(component2)-\(component3)"
        return connectedComponent
    }
    
    
    func date() {
        
        
        let today = Date()
        let cal = Calendar(identifier: Calendar.Identifier.gregorian)
        
        let calendar = Calendar.current
        let component1 = String(calendar.component(.day, from: today))
        let component2 = String(calendar.component(.month, from: today))
        let component3 = String(calendar.component(.year, from: today))
        let connectedComponent = "\(component1)-\(component2)-\(component3)"
        
      //  tcv.dateLabel.text = connectedComponent
    
        
        
        func setDateWholeLogic() {
            
            
            
            
        }
        
        
        
        
        
    }

}
