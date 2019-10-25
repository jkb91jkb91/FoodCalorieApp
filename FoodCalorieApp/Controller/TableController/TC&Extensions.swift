//
//  TC&Extensions.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-10-23.
//  Copyright © 2019 XCodeClub. All rights reserved.
//
//MARK:-Module

import UIKit

//MARK: -UITableViweDataSource extension

extension TableController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          
          guard let meals = currentState?.meals else {
              return 0
          }
          return meals.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
        guard let cell = table.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TableViewCell else {
              return UITableViewCell() }
          
          guard let meals = currentState?.meals?[indexPath.row] as? Meals
              else {
              return cell
              }
      
          cell.updateCell(meal: meals)

          return cell
      }
}

//MARK: - UITableViewDelegate extension

extension TableController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == .delete {
               
               guard let toRemove = currentState?.meals![indexPath.row] as? Meals else {
                   return
               }
            context.delete(toRemove)
               do {
                   try context.save()
                   table.deleteRows(at: [indexPath], with: .automatic)
               } catch let error as NSError {
                   print("\(error)")
               }
           }
       }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           
           return CGFloat(100)
       }
}
