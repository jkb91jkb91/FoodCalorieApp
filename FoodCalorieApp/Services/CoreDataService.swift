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
/*
struct CoreDataService {
    
   
    
    static func fetchData(date: String,  currentState: Day) {
        let fetch :NSFetchRequest<Day> = Day.fetchRequest()
              fetch.predicate = NSPredicate(format: "%K == %@", #keyPath(Day.wartosc),date)
              do {
                  let result = try context.fetch(fetch)
                  if result.count > 0 {
                      currentState = result.first
                      dateLabel.text = currentState?.wartosc
                      
                  } else {
                    
                    
                      let dzien = Day(context: context)
                      dzien.wartosc = date
                      currentState = dzien
                      try context.save()
                      dateLabel.text = date
                     
                  }
                  
              } catch let error as NSError {
                  print ( "\(error)")
              }
        
    }
    
    func saveData(){
        
        
        let meal = Meals(context: context)
              meal.productField = productField.text
              meal.calorieField = Int16(calorieField.text!) ?? 0
              meal.proteinField = Int16(proteinField.text!) ?? 0
              meal.carbField = Int16(carbField.text!) ?? 0
              meal.fatField = Int16(fatField.text!) ?? 0
          
              if let meals = current.meals?.mutableCopy() as? NSMutableOrderedSet {
                  meals.add(meal)
                  current.meals = meals
              }
              do {
                  try context.save()
              } catch let error as NSError {
                  print("\(error)")
              }
        
        
        
        
    }
    
    
    
    
 }
    */
    
    
    
    

