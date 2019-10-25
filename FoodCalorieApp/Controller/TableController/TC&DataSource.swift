//
//  TC&DataSource.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-10-25.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import UIKit

//MARK: -UITableViweDataSource extension

extension TableController: UITableViewDataSource {
    
    func numberOfRows() -> Int {
        return currentState?.meals?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          numberOfRows()
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
