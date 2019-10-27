//
//  CoreDataService.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-10-23.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import UIKit
import CoreData

public let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

struct CoreDataService {
    
   //try to use completionHandlers
    
    
    static func fetchData(date: String,
                          currentState: Day?,
                          handler: @escaping ([Day]) -> (Void),
                          completion: @escaping (Day) -> (Void)
                          ) {
        let fetch :NSFetchRequest<Day> = Day.fetchRequest()
              fetch.predicate = NSPredicate(format: "%K == %@", #keyPath(Day.wartosc),date)
              do {
                  let result = try context.fetch(fetch)
                  if result.count > 0 {
                     handler(result)
                      
                  } else {
                    
                    
                      let dzien = Day(context: context)
                      dzien.wartosc = date
                      try context.save()
                    completion(dzien)
                    
                     
                  }
                  
              } catch let error as NSError {
                  print ( "\(error)")
              }
        
    }
 
    
 }
    
    
    
    
    


